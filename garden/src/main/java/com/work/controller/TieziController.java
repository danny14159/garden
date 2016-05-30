
package com.work.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.Tiezi;
import com.work.bean.TieziPraise;
import com.work.bean.User;
import com.work.mapper.BasicDao;
import com.work.mapper.TieziCommentDao;
import com.work.mapper.TieziDao;
import com.work.mapper.TieziPraiseDao;
import com.work.util.AjaxReturn;

@Controller
@RequestMapping("/tiezi")
public class TieziController extends BasicController<Tiezi>{
	
	@Resource
	private TieziDao TieziDao;
	@Resource
	private TieziPraiseDao tieziPraiseDao;
	@Resource
	private TieziCommentDao tieziCommentDao;
	
	public static final String PREFIX="Tiezi/";

	@Override
	protected String getPrefix() {
		return PREFIX.toLowerCase();
	}

	@Override
	protected BasicDao<Tiezi> getDao() {
		return TieziDao;
	}


	@Override
	public Object insert(Tiezi obj) {
		
		User u = LoginController.loginUser(request);
		if(null == u){
			return new AjaxReturn(false,"请先登录");
		}
		obj.setCreate_by(u.getId());
		obj.setCreate_time(new Date());
		return super.insert(obj);
	}
	
	@RequestMapping("/praise")
	public String togglePraise(Integer tieziId){
		User u = LoginController.loginUser(request);
		if(null == u){
			return "redirect:/app/login";
		}
		
		TieziPraise praise = new TieziPraise();
		praise.setTiezi_id(tieziId);
		praise.setUser_id(u.getId());
		int hasPraised = tieziPraiseDao.count(praise);
		
		if(hasPraised > 0){
			tieziPraiseDao.delete(praise);
		}
		else
		{
			tieziPraiseDao.insert(praise);
		}
		
		return "redirect:/tiezi";
	}
	
}
    