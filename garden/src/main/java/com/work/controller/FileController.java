
package com.work.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.work.bean.File;
import com.work.mapper.BasicDao;
import com.work.mapper.FileDao;

@Controller
@RequestMapping("/file")
public class FileController extends BasicController<File>{
	
	@Resource
	private FileDao FileDao;
	
	public static final String PREFIX="file/";

	@Override
	protected String getPrefix() {
		return PREFIX;
	}

	@Override
	protected BasicDao<File> getDao() {
		return FileDao;
	}


}
    