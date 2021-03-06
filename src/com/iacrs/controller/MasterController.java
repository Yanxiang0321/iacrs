package com.iacrs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.iacrs.entity.User;
import com.iacrs.model.MenuTreeNode;
import com.iacrs.service.IMenuService;
import com.iacrs.service.IUploadService;
import com.iacrs.service.IUserService;

/*
 *  View Splitter
 *    top banner
 *   ------------
 *        |
 *   left |  main
 *   	  |
 */


@Controller
@RequestMapping("/master")
public class MasterController extends BaseController
{
    private static Logger log = LoggerFactory.getLogger(MasterController.class);
    
    @Autowired
    private IMenuService menuService;
    
    @Autowired
    private IUserService userService;
    
    @Autowired
    private IUploadService uploadService;
    
    @RequestMapping("/index")
    public String index()
    {
        return "master/index";
    }
    
    @RequestMapping("/top")
    public String top(ModelMap model)
    {
        model.addAttribute("username", getAuthenticatedUser().getUsername());
        return "master/layout/top";
    }
    
    @RequestMapping("/main")
    public String main()
    {
        return "master/layout/main";
    }
    
    @RequestMapping("/left")
    public String left(ModelMap model)
    {
        List<MenuTreeNode> menus = menuService.getRootMenus(getAuthentication());
        model.addAttribute("menus", menus);
        return "master/layout/left";
    }
    
    @RequestMapping("/split")
    public String split(ModelMap model)
    {
        return "master/layout/split";
    }
    
    
    @RequestMapping("/preferred_menu")
    public String preferredMenu()
    {
        User user = getAuthenticatedUser();
        
        if (User.TYPE_USER == user.getType())
        {
            return "redirect:/subscriber/dashboard";
        	//return "resource/index.html";
        }
        else
        {
            return "redirect:/admin/member/member_list";
        }
    }
    
    @RequestMapping("/forward_modify_password")
    public String forwardModifyPassword()
    {
        return "master/modify_password";
    }
    
    @RequestMapping("modify_password")
    public String modifyPassword(HttpServletRequest request, ModelMap model, String oldPassword, String newPassword)
    {
        User user = getAuthenticatedUser();
        userService.modifyPassword(user.getUsername(), oldPassword, newPassword);
        return forwardSuccessPage(model);
    }
    
    @RequestMapping("upload")
    public String upload(DefaultMultipartHttpServletRequest request, ModelMap model)
    {
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        MultipartFile file = request.getFile("file");
        String returnText = "";
        
        try
        {
            String imagePath = uploadService.upload(file, rootPath);
            returnText = imagePath.replaceAll("\\\\", "/");
        }
        catch (Exception e)
        {
            log.error(e.getMessage(), e);
        }
        
        model.addAttribute("returnText", returnText);
        return "common/upload";
    }
}
