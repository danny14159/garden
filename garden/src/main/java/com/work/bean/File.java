package com.work.bean;
/**
 * @author 
 *
 */
public class File  {

	/**
	 * 
	 */
	private Integer id;

	/**
	 * 文件名
	 */
	private String name;

	/**
	 * 访问路径
	 */
	private String path;

	/**
	 * 创建时间
	 */
	@org.springframework.format.annotation.DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date create_time;

	/**
	 * 下载次数
	 */
	private Integer download_times;

	/**
	 * 文件类型
	 */
	private String file_type;
	
	private String descn;

	public String getDescn() {
		return descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getName(){
		return this.name;
	}

	public void setPath(String path){
		this.path=path;
	}

	public String getPath(){
		return this.path;
	}

	public void setCreate_time(java.util.Date create_time){
		this.create_time=create_time;
	}

	public java.util.Date getCreate_time(){
		return this.create_time;
	}

	public void setDownload_times(Integer download_times){
		this.download_times=download_times;
	}

	public Integer getDownload_times(){
		return this.download_times;
	}

	public void setFile_type(String file_type){
		this.file_type=file_type;
	}

	public String getFile_type(){
		return this.file_type;
	}

}