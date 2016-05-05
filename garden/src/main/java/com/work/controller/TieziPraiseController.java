
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.TieziPraise;
import com.work.mapper.BasicDao;
import com.work.mapper.TieziPraiseDao;

@Controller
@RequestMapping("/tiezipraise")
public class TieziPraiseController extends BasicController<TieziPraise>{
	
	@Resource
	private TieziPraiseDao TieziPraiseDao;
	
	public static final String PREFIX="TieziPraise/";

	@Override
	protected String getPrefix() {
		return PREFIX.toLowerCase();
	}

	@Override
	protected BasicDao<TieziPraise> getDao() {
		return TieziPraiseDao;
	}


}
    