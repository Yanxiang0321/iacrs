package com.iacrs.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iacrs.dao.BaseDaoSupport;
import com.iacrs.entity.RentBill;
import com.iacrs.exception.ServiceException;
import com.iacrs.exception.ServiceExceptionCode;
import com.iacrs.model.CarAdapter;
import com.iacrs.model.Pagination;
import com.iacrs.model.Queryer;
import com.iacrs.model.RentBillAdapter;
import com.iacrs.model.UserModel;
import com.iacrs.service.ICarService;
import com.iacrs.service.IRentalService;
import com.iacrs.service.IUserService;
import com.iacrs.util.DateUtil;

@Service
public class RentalServiceImpl implements IRentalService
{
    @Autowired
    private BaseDaoSupport baseDaoSupport;
    
    @Autowired
    private IUserService userService;
    
    @Autowired
    private ICarService carService;
    
    
    //get rent bill order by time DESC
    
    @Override
    public Pagination<RentBillAdapter> find(Integer userId, int pageNo, int pageSize)
    {
        UserModel userModel = userService.getUserModel(userId);
        String hql = "FROM RentBill b WHERE b.endTime IS NOT NULL AND b.userId = ? ORDER BY b.balanceTime DESC";
        Queryer queryer = new Queryer();
        queryer.setHql(hql);
        List<Object> parameters = new ArrayList<Object>();
        parameters.add(userId);
        queryer.setParameters(parameters);
        Pagination<RentBill> pagination = baseDaoSupport.find(queryer, pageNo, pageSize, RentBill.class);
        List<RentBill> records = pagination.getRecords();
        List<RentBillAdapter> wrapperRecords = new ArrayList<RentBillAdapter>();
        
        for (RentBill record : records)
        {
            wrapperRecords.add(wrap(record, userModel));
        }
        
        Pagination<RentBillAdapter> result =
            new Pagination<RentBillAdapter>(pagination.getPageNo(), pagination.getPageSize(),
                pagination.getTotalCount());
        result.setRecords(wrapperRecords);
        return result;
    }
    
    @Override
    public Pagination<RentBillAdapter> find(int pageNo, int pageSize)
    {
        String hql = "FROM RentBill b ORDER BY b.startTime DESC";
        Queryer queryer = new Queryer();
        queryer.setHql(hql);
        Pagination<RentBill> pagination = baseDaoSupport.find(queryer, pageNo, pageSize, RentBill.class);
        List<RentBill> records = pagination.getRecords();
        List<RentBillAdapter> wrapperRecords = new ArrayList<RentBillAdapter>();
        
        for (RentBill record : records)
        {
            wrapperRecords.add(wrap(record));
        }
        
        Pagination<RentBillAdapter> result =
            new Pagination<RentBillAdapter>(pagination.getPageNo(), pagination.getPageSize(),
                pagination.getTotalCount());
        result.setRecords(wrapperRecords);
        return result;
    }
    
    private RentBillAdapter wrap(RentBill entity, UserModel userModel)
    {
        RentBillAdapter model = new RentBillAdapter();
        model.setUser(userModel);
        model.setBill(entity);
        model.setCar(carService.getCarAdapter(entity.getCarId()));
        return model;
    }
    
    private RentBillAdapter wrap(RentBill entity)
    {
        RentBillAdapter model = new RentBillAdapter();
        model.setUser(userService.getUserModel(entity.getUserId()));
        model.setBill(entity);
        model.setCar(carService.getCarAdapter(entity.getCarId()));
        return model;
    }
    
    
    // This method is not used
    @Override
    @Transactional
    public Integer readCard(String idcardno, String gpsid)
    {
        CarAdapter car = carService.getCarAdapterByGPS(gpsid);
        
        if (null == car)
        {
            throw new ServiceException(ServiceExceptionCode.IACRS_0006);
        }
        
        UserModel model = userService.getUserModelByCard(idcardno);
        
        if (null == model)
        {
            throw new ServiceException(ServiceExceptionCode.IACRS_0005);
        }
        
        Date time = new Date();
        
        // Determine whether the vehicle under the lease
        RentBill bill = getRentingBillByCar(car.getCar().getId(), time);
        
        if (null != bill && bill.getUserId().intValue() != model.getUser().getId())
        {
            throw new ServiceException(ServiceExceptionCode.IACRS_0009);
        }
        
        // ���������������������������������������
        // Determine whether the user in a state of the lease
        bill = getRentingBillByUser(model.getUser().getId(), time);
        
        // ���������������������������
        // if There is no rental record before
        if (null == bill)
        {
            // 
        	// Pre authorization credit account whether meet the requirements
            Integer accountPreauth = model.getAccount().getPreauth();
            
            if (car.getCar().getPreauth() > accountPreauth)
            {
                throw new ServiceException(ServiceExceptionCode.IACRS_0008);
            }
            
            bill = new RentBill();
            bill.setUserId(model.getUser().getId());
            bill.setCarId(car.getCar().getId());
            //set start time
            bill.setStartTime(time);
            bill.setDailyRental(car.getCar().getDailyRental());
            bill.setDailyPremium(car.getCar().getDailyPremium());
            baseDaoSupport.insert(bill);
            return READ_CARD_START_RENTAL;
        }
        // ���������������������
        // Has been rented
        else
        {
            // ������������������������������������������������������
        	// If is the same car, finish renting
            if (bill.getCarId().intValue() == car.getCar().getId().intValue())
            {
                Date startTime = bill.getStartTime();
                Integer duration = DateUtil.getInterval(startTime, time) + 1;
                //set end time
                bill.setEndTime(time);
                bill.setDuration(duration);
                bill.setBalanceTime(time);
                bill.setAmount(duration * (bill.getDailyRental() + bill.getDailyPremium()));
                baseDaoSupport.update(bill);
                return READ_CARD_END_RENTAL;
            }
            // Throw exception, one person can not rent two cars at the same time
            else
            {
                throw new ServiceException(ServiceExceptionCode.IACRS_0007);
            }
        }
    }
    
    private RentBill getRentingBillByUser(Integer userId, Date date)
    {
        String hql = "FROM RentBill b WHERE b.startTime < ? AND b.endTime IS NULL AND b.userId = ?";
        List<RentBill> records = baseDaoSupport.find(RentBill.class, hql, DateUtil.toEndDate(date), userId);
        return records.isEmpty() ? null : records.get(0);
    }
    
    private RentBill getRentingBillByCar(Integer carId, Date date)
    {
        String hql = "FROM RentBill b WHERE b.startTime < ? AND b.endTime IS NULL AND b.carId = ?";
        List<RentBill> records = baseDaoSupport.find(RentBill.class, hql, DateUtil.toEndDate(date), carId);
        return records.isEmpty() ? null : records.get(0);
    }
}
