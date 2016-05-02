
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.Article;
import com.work.mapper.BasicDao;
import com.work.mapper.ArticleDao;

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


}
    