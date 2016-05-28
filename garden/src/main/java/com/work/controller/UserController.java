
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.work.MainController;
import com.work.bean.User;
import com.work.mapper.BasicDao;
import com.work.mapper.UserDao;

@Controller
@RequestMapping("/user")
public class UserController extends BasicController<User>{
	
	@Resource
	private UserDao UserDao;
	
	public static final String PREFIX="user/";

	@Override
	protected String getPrefix() {
		return PREFIX;
	}

	@Override
	protected BasicDao<User> getDao() {
		return UserDao;
	}


	@Override
	public Object update(User obj) {
		User u = MainController.getCurrentUser(request);
		u.setBirth(obj.getBirth());
		u.setEmail(obj.getEmail());
		u.setNickname(obj.getNickname());
		u.setSelf_intro(	obj.getSelf_intro());
		u.setSex(obj.getSex());
		return super.update(obj);
	}
}
    