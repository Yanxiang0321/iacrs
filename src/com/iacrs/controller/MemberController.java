package com.iacrs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iacrs.model.Pagination;
import com.iacrs.model.PaginationModel;
import com.iacrs.model.UserModel;
import com.iacrs.service.IUserService;

/*
 *  Admin console for membership management
 */

@Controller
@RequestMapping("/admin/member")
public class MemberController extends BaseController
{
    @Autowired
    private IUserService userService;
    
    @RequestMapping("/member_list")
    public String list(HttpServletRequest request, ModelMap model, @RequestParam(value = "pageNo", defaultValue = "1", required = false) int pageNo)
    {
        Pagination<UserModel> pagination = userService.find(pageNo, 20);
        model.addAttribute(PaginationModel.MODEL_KEY, new PaginationModel(pagination, request));
        return "master/admin/member/member_list";
    }
    
    @RequestMapping("/set_state")
    public String setState(Integer id, boolean disabled)
    {
        userService.setState(id, disabled);
        return "redirect:/admin/member/member_list";
    }
    
    @RequestMapping("/forward_set_preauth")
    public String forwardSetPreauth(Integer id, ModelMap model)
    {
        UserModel userModel = userService.getUserModel(id);
        model.addAttribute("user_model", userModel);
        return "master/admin/member/set_preauth";
    }
    
    @RequestMapping("/set_preauth")
    public String setPreauth(Integer id, Integer preauth)
    {
        userService.setPreauth(id, preauth);
        return "redirect:/admin/member/member_list";
    }
}
