package com.iacrs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/nav")
public class NavController {

    @RequestMapping("/home")
    public String list(ModelMap model)
    {
        
        return "home";
    }
}
