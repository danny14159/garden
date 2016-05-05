
package com.work.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.TieziComment;
import com.work.bean.User;
import com.work.mapper.BasicDao;
import com.work.mapper.TieziCommentDao;

@Controller
@RequestMapping("/tiezicomment")
public class TieziCommentController extends BasicController<TieziComment>{
	
	@Resource
	private TieziCommentDao TieziCommentDao;
	
	public static final String PREFIX="TieziComment/";

	@Override
	protected String getPrefix() {
		return PREFIX.toLowerCase();
	}

	@Override
	protected BasicDao<TieziComment> getDao() {
		return TieziCommentDao;
	}

	@Override
	public Object insert(TieziComment obj) {
		User u = LoginController.loginUser(request);
		if(null == u){
			return 0;
		}
		obj.setUser_id(u.getId());
		obj.setCreate_time(new Date());
		return super.insert(obj);
	}
}
    