package com.iacrs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iacrs.entity.User;
import com.iacrs.service.IUserService;

/*
 *  User validation
 */

@Controller
@RequestMapping("/CheckUser")
public class CheckUserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Autowired
    private IUserService userService;

	  @RequestMapping(method=RequestMethod.GET)
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {
			   response.setContentType("text/xml;charset=UTF-8");
			   response.setHeader("Cache-Control", "no-cache");
			   String username = request.getParameter("username");
			   //System.out.println(username);
			   String msg = "";
			   String f="1";
			   try{
			   User user = userService.getUser(username);
			   
			   if (user!=null) {
			    
			    msg = "Sorry! "+username+" has been used already! X";
			    f="0";
			   }
			   else{
			    msg = "Congratulations! "+username+" can be used. √";
			   }
			   
			         }catch(Exception ex){

			         }
			         response.getWriter().println("<?xml version='1.0' encoding='UTF-8'?>");
			         response.getWriter().println("<root>");
			         response.getWriter().println("<content>");
			         response.getWriter().print(msg);
			         response.getWriter().println("</content>");
			         response.getWriter().println("<flag>");
			         response.getWriter().print(f);
			         response.getWriter().println("</flag>");
			         response.getWriter().println("</root>");
			         response.getWriter().close();
			  }
}
