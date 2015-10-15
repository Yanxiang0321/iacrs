package com.iacrs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.iacrs.entity.CarPosition;
import com.iacrs.model.CarAdapter;
import com.iacrs.model.CarForm;
import com.iacrs.model.CarModelAdapter;
import com.iacrs.model.CarModelForm;
import com.iacrs.model.Pagination;
import com.iacrs.model.PaginationModel;
import com.iacrs.service.ICarService;
import com.iacrs.util.ResponseUtils;
/*
 *  Admin console
 *  Including CRUD manipulations
 */
@Controller
@RequestMapping("/admin/car")
public class CarController extends BaseController
{
    @Autowired
    private ICarService carService;
    
    @RequestMapping("model_list")
    public String models(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<CarModelAdapter> pagination = carService.find(pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/admin/car/model_list";
    }
    
    @RequestMapping("model_info")
    public void getModelInfo(Integer id, HttpServletResponse response)
    {
        CarModelAdapter model = carService.getCarModelAdapter(id);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("id", model.getModel().getId());
        jsonObject.addProperty("name", model.getModel().getName());
        jsonObject.addProperty("dailyRental", model.getPrice().getDailyRental());
        jsonObject.addProperty("dailyPremium", model.getPrice().getDailyPremium());
        jsonObject.addProperty("preauth", model.getPrice().getPreauth());
        ResponseUtils.renderJson(response, jsonObject.toString());
    }
    
    @RequestMapping("forward_add_model")
    public String forwardAddModel()
    {
        return "master/admin/car/model_add";
    }
    
    @RequestMapping("add_model")
    public String addModel(CarModelForm data)
    {
        carService.addModel(data);
        return "redirect:/admin/car/model_list";
    }
    
    @RequestMapping("forward_modify_model")
    public String forwardModifyModel(Integer id, ModelMap model)
    {
        CarModelAdapter adapter = carService.getCarModelAdapter(id);
        model.addAttribute("car", adapter);
        return "master/admin/car/model_modify";
    }
    
    @RequestMapping("modify_model")
    public String modifyModel(CarModelForm data)
    {
        carService.modifyModel(data);
        return "redirect:/admin/car/model_list";
    }
    
    @RequestMapping("delete_model")
    public String deleteModel(Integer id, ModelMap model)
    {
        carService.deleteModel(id);
        return "redirect:/admin/car/model_list";
    }
    
    @RequestMapping("car_list")
    public String cars(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<CarAdapter> pagination = carService.findCars(pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/admin/car/car_list";
    }
    
    @RequestMapping("forward_add_car")
    public String forwardAddCar()
    {
        return "master/admin/car/car_add";
    }
    
    @RequestMapping("model_list_select")
    public String forwardModelSelect(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<CarModelAdapter> pagination = carService.find(pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/admin/car/model_list_select";
    }
    
    @RequestMapping("add_car")
    public String addCar(CarForm data)
    {
        carService.addCar(data);
        return "redirect:/admin/car/car_list";
    }
    
    @RequestMapping("forward_modify_car")
    public String forwardModifyCar(Integer id, ModelMap model)
    {
        CarAdapter adapter = carService.getCarAdapter(id);
        model.addAttribute("car", adapter);
        return "master/admin/car/car_modify";
    }
    
    @RequestMapping("modify_car")
    public String modifyCar(CarForm data)
    {
        carService.modifyCar(data);
        return "redirect:/admin/car/car_list";
    }
    
    @RequestMapping("delete_car")
    public String deleteCar(Integer id, ModelMap model)
    {
        carService.deleteCar(id);
        return "redirect:/admin/car/car_list";
    }
    
    @RequestMapping("position_car")
    public String positionCar(Integer id, ModelMap model)
    {
        CarAdapter car = carService.getCarAdapter(id);
        model.addAttribute("car", car);
        CarPosition position = carService.getPosition(id);
        model.addAttribute("position", position);
        return "master/admin/car/car_position";
    }
    
    @RequestMapping("orbit_car")
    public String orbitCar(Integer id, ModelMap model)
    {
        CarAdapter car = carService.getCarAdapter(id);
        model.addAttribute("car", car);
        List<CarPosition> positions = carService.findPositions(id);
        model.addAttribute("positions", positions);
        
        CarPosition lastposition = null;
        
        if (positions.isEmpty())
        {
            lastposition = new CarPosition();
            lastposition.setLongitude(39.9);
            lastposition.setLatitude(116.4);
        }
        else
        {
            lastposition = positions.get(0);
        }
        
        model.addAttribute("lastposition", lastposition);
        
        //return "master/admin/car/car_orbit";
        return "mapTest";
    }
}
