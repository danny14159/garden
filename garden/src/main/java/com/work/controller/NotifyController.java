
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.Notify;
import com.work.mapper.BasicDao;
import com.work.mapper.NotifyDao;

@Controller
@RequestMapping("/notify")
public class NotifyController extends BasicController<Notify>{
	
	@Resource
	private NotifyDao NotifyDao;
	
	public static final String PREFIX="notify/";

	@Override
	protected String getPrefix() {
		return PREFIX;
	}

	@Override
	protected BasicDao<Notify> getDao() {
		return NotifyDao;
	}


}
    