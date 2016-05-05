package com.work.mapper;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.work.bean.Article;
/**
 * @author 
 *
 */
@Repository
public interface ArticleDao extends BasicDao<Article> {


	public List<Article> search(String key);
}