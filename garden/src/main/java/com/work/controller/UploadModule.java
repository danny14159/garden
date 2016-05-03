package com.work.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.work.mapper.FileDao;
import com.work.util.AjaxReturn;
import com.work.util.ImageUtil;
import com.work.util.file.FileTypeJudge;

@Controller
@RequestMapping("/upd")
public class UploadModule {
	@Resource
	private HttpServletRequest request;
	
	@Resource
	private FileDao fileDao;

	/**
	 * @return 
	 */
	/**文件保存至服务器的私有函数
	 * @param file 文件
	 * @param typeFilter 文件类型
	 * @param moduleName 模块名称，命名时模块名称+时间戳
	 * @param StoreFolder 上传目录，under /static/assets/upload/
	 * @param returnPath 返回的文件路径 returnPath+filename
	 * @param thumbnail 是否生成缩略图，同目录下源文件名+thumb[width]-[height]
	 * @return 返回文件名，false表示发生错误。
	 */
	private AjaxReturn processUploading(
			MultipartFile file,
			String typeFilter,
			String moduleName,
			String storeFolder,
			String returnPath,
			boolean thumbnail,
			int thumb_width,
			int thumb_height,
			String FileName){
		if(null == file || file.isEmpty()){
			return new AjaxReturn(false, "文件未上传");
		}
		
		// 文件类型 过滤
		boolean isFileSpecified = false;
		try {
			isFileSpecified = FileTypeJudge.isFileSpecifiedType(file.getInputStream(), typeFilter);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		System.out.println("is file "+typeFilter+":"+isFileSpecified);
		if(!isFileSpecified){
			return new AjaxReturn(false, "文件类型错误，请检查。");
		}
		
		//获得存储路径
		String realPath = request.getSession().getServletContext().getRealPath("/static/upload/"+storeFolder );
		
		// 文件存储到服务器，加上时间戳
		String fileName = moduleName + new Date().getTime();
		try {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(
					realPath, fileName));
			String[] filename_sep = FileName.split("\\.");
			
			//向数据库插入文件记录
			com.work.bean.File file_bean = new com.work.bean.File();
			file_bean.setCreate_time(new Date());
			file_bean.setName(FileName);
			file_bean.setPath(returnPath+fileName);
			if(filename_sep.length > 1){
				file_bean.setFile_type(filename_sep[1]);
			}
			else{
				file_bean.setFile_type(filename_sep[0]);
			}
			fileDao.insert(file_bean);
			
			System.out.println("向服务器写入文件"+realPath+","+fileName);
		} catch (IOException e) {
			e.printStackTrace();
			return new AjaxReturn(false, "服务器文件存储异常");
		}
		
		//生成缩略图
		if(thumbnail)
			try {
				BufferedImage bufimg = ImageUtil.fillImage(ImageIO.read(file.getInputStream()), thumb_width, thumb_height);
				ImageIO.write(bufimg, "PNG", new File(
						realPath, fileName+"thumb"+thumb_width+"-"+thumb_height));
			} catch (IOException e) {
				e.printStackTrace();
				return new AjaxReturn(false, "缩略图生成异常！");
			}
		return new AjaxReturn(true,returnPath+fileName);
	}
	
	@RequestMapping(value="/ueditor/controller")
	public String ueditorController(@RequestParam String action){
		if("config".equals(action))
			return "frontend/assets/ueditor/jsp/controller.jsp";
		else if("ueimg".equals(action)){
			return "forward:/upd/ueimage";
		}
		return "";
	}
	
	/**上传文章封面
	 * @param file
	 * @return
	 */
	@RequestMapping("/cover")
	@ResponseBody
	public Object articleCover(@RequestParam(value="img",required=false) MultipartFile img,String Filename){
		return processUploading(img, "image", "cover", "", "/static/upload/", false, 0, 0,Filename);
	}
	
}
