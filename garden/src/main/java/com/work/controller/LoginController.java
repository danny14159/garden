package com.work.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.work.bean.User;
import com.work.mapper.UserDao;
import com.work.util.M;
import com.work.util.Strings;

@RequestMapping("/app")
@Controller
public class LoginController {
	@Resource
	private UserDao userDao;

	@RequestMapping("/register")
	public String register(String username,String password,Model model){
		if(Strings.isEmpty(username)){
			model.addAttribute("msg", "请输入用户名");
			return "register";
		}
		if(Strings.isEmpty(password)){
			model.addAttribute("msg", "请输入密码");
			return "register";
		}
		
		User u = userDao.load(M.make("username", username).asMap());
		if(null != u){
			model.addAttribute("msg", "用户名已经存在！");
			return "register";
		}
		else{
			User nuser = new User();
			nuser.setType("2");
			nuser.setUsername(username);
			nuser.setPassword(password);
			userDao.insert(nuser);
			
			return "login";
		}
	}
	
	@RequestMapping("/login")
	public String login(String username,String password,Model model,HttpServletRequest request){
		if(Strings.isEmpty(username)){
			model.addAttribute("msg", "请输入用户名");
			return "register";
		}
		if(Strings.isEmpty(password)){
			model.addAttribute("msg", "请输入密码");
			return "register";
		}
		
		User u = userDao.load(M.make("username", username).put("password", password).asMap());
		if(null == u){
			model.addAttribute("msg", "用户名或者密码错误！");
			return "login";
		}
		WebUtils.setSessionAttribute(request, "me", u);
		if(u.getType().equals("1")){
			return "redirect:/app/frame";
		}
		else {
			return "redirect:/";
		}
	}
	
	public static User loginUser(HttpServletRequest request){
		
		return (User) WebUtils.getSessionAttribute(request, "me");
	}
}
