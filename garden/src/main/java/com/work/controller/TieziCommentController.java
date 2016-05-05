
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.TieziComment;
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


}
    