package com.iacrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iacrs.model.RegisterForm;
import com.iacrs.service.IRegisterService;

/*
 *  Dispatcher Controller
 */

@Controller
public class PublicController extends BaseController
{
    //private static Logger log = LoggerFactory.getLogger(PublicController.class);
    
    @Autowired
    private IRegisterService registerService;
    
//    @RequestMapping("/sitemap")
//    public String sitemap()
//    {
//        return "sitemap";
//    }
    
    @RequestMapping("/forward_register")
    public String forwardRegiste()
    {
        return "register";
    }
    
    @RequestMapping("register")
    public String register(RegisterForm data, ModelMap model)
    {
        registerService.register(data);
        return "redirect:/forward_login";
    }
    
    @RequestMapping("/forward_login")
    public String forwardLogin()
    {
        return "login";
    }
    
    @RequestMapping("/contact")
    public String contact()
    {
        return "contact";
    }
    
    @RequestMapping("/about")
    public String about()
    {
        return "about";
    }
}
