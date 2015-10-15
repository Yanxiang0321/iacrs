package com.iacrs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iacrs.entity.ChargeRecord;
import com.iacrs.model.CarAdapter;
import com.iacrs.model.Pagination;
import com.iacrs.model.PaginationModel;
import com.iacrs.model.RentBillAdapter;
import com.iacrs.model.UserModel;
import com.iacrs.service.ICarService;
import com.iacrs.service.IChargeService;
import com.iacrs.service.IRentalService;
import com.iacrs.service.IUserService;

/*
 *  Services regarding price and payments
 */

@Controller
@RequestMapping("/subscriber")
public class SubscriberController extends BaseController
{
    @Autowired
    private IUserService userService;
    
    @Autowired
    private ICarService carService;
    
    @Autowired
    private IChargeService chargeService;
    
    @Autowired
    private IRentalService rentalService;
    
    @RequestMapping("/dashboard")
    public String dashboard(ModelMap model)
    {
        UserModel user = userService.getUserModel(getAuthenticatedUser().getUsername());
        model.addAttribute("user_model", user);
        Pagination<ChargeRecord> pagination = chargeService.find(getAuthenticatedUser().getId(), 1, 5);
        model.addAttribute("charge_records", pagination.getRecords());
        Pagination<RentBillAdapter> rentbills = rentalService.find(getAuthenticatedUser().getId(), 1, 5);
        model.addAttribute("rent_bills", rentbills.getRecords());
        return "master/subscriber/dashboard";
    }
    
    @RequestMapping("/forward_charge")
    public String forwardCharge(ModelMap model)
    {
        model.addAttribute("user", getAuthenticatedUser());
        return "master/subscriber/charge";
    }
    
    @RequestMapping("/forward_mock_gateway")
    public String forwardMockGateway(Integer amount, Integer userId, ModelMap model)
    {
        model.addAttribute("userId", userId);
        model.addAttribute("amount", amount);
        return "master/subscriber/mock_gateway";
    }
    
    @RequestMapping("/charge_list")
    public String chargeList(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<ChargeRecord> pagination = chargeService.find(getAuthenticatedUser().getId(), pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/subscriber/charge_list";
    }
    
    @RequestMapping("/car_price_list")
    public String carPriceList(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<CarAdapter> pagination = carService.findCars(pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/subscriber/car_price_list";
    }
    
    @RequestMapping("/bill_list")
    public String billList(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<RentBillAdapter> pagination = rentalService.find(getAuthenticatedUser().getId(), pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/subscriber/bill_list";
    }
    
    @RequestMapping("/testJSP")
    public String testJSP(ModelMap model){
    	return "resource/index.html";
    }
}
