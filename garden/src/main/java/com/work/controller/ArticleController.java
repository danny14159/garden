
package com.work.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.Article;
import com.work.mapper.ArticleDao;
import com.work.mapper.BasicDao;

@Controller
@RequestMapping("/article")
public class ArticleController extends BasicController<Article>{
	
	@Resource
	private ArticleDao ArticleDao;
	
	public static final String PREFIX="article/";

	@Override
	protected String getPrefix() {
		return PREFIX;
	}

	@Override
	protected BasicDao<Article> getDao() {
		return ArticleDao;
	}
	
	@Override
	public Object insert(Article obj) {
		obj.setCreate_time(new Date());
		obj.setUpdate_time(new Date());
		return super.insert(obj);
	}
	
	@Override
	public Object update(Article obj) {
		obj.setUpdate_time(new Date());
		return super.update(obj);
	}
}
    