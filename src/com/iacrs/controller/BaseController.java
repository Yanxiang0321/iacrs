package com.iacrs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.iacrs.entity.User;
import com.iacrs.security.SecurityUserModel;
import com.iacrs.util.ActionUtil;
/*
 * This file is the general class that all other sub-controllers extends
 * This controller defines the controller template
 */
public class BaseController
{
    @ModelAttribute
    protected void fillCommonAttributes(HttpServletRequest request, ModelMap model)
    {
        ActionUtil.fillCommonAttributes(request, model);
    }
    
    protected Authentication getAuthentication()
    {
        return SecurityContextHolder.getContext().getAuthentication();
    }
    /*
     * Credentail Check
     */
    protected User getAuthenticatedUser()
    {
        Authentication authentication = getAuthentication();
        
        if (null != authentication)
        {
            Object principal = authentication.getPrincipal();
            
            if (principal instanceof SecurityUserModel)
            {
                return ((SecurityUserModel)principal).getUser();
            }
        }
        
        return null;
    }
    
    protected String forwardSuccessPage(ModelMap model)
    {
        return forwardMessagePage(ActionUtil.getMessage("System.Operate.Success"), model);
    }
    
    protected String forwardMessagePage(String message, ModelMap model)
    {
        model.addAttribute("message", message);
        return "common/message";
    }
}
