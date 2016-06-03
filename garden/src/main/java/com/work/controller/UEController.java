package com.work.controller;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.work.bean.File;
import com.work.bean.UEReturnVo;
import com.work.mapper.FileDao;

@Controller
@RequestMapping("/ueditor")
public class UEController {
	
	@Resource
	private FileDao fileDao;

	@RequestMapping(value="/server",params="action=config")
	public String config(String action,HttpServletResponse response,HttpServletRequest request) throws IOException{
		
		/*request.setCharacterEncoding( "utf-8" );
		response.setHeader("Content-Type" , "text/html");
		
		String rootPath = request.getServletContext().getRealPath( "/" );
		
		response.getWriter().write( new ActionEnter( request, rootPath ).exec() );*/
		
		return "redirect:/static/ueditor/config.json";
	}
	
	@RequestMapping(value="/server",params="action=uploadimage")
	@ResponseBody
	public Object upload(MultipartFile upfile) throws IOException{
		File file = new File();
		file.setContent(upfile.getBytes());
		file.setCreate_time(new Date());
		file.setName(upfile.getOriginalFilename());
		
		fileDao.insert(file);
		
		;
		
		UEReturnVo vo = new UEReturnVo();
		vo.setUrl("/upd/download/"+fileDao.latestFile().getId());
		vo.setState("SUCCESS");
		return vo;
	}
}
