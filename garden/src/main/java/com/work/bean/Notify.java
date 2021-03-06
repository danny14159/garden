package com.work.bean;
/**
 * @author 
 *
 */
public class Notify  {

	/**
	 * 
	 */
	private Integer id;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 内容
	 */
	private String content;

	/**
	 * 作者
	 */
	private String author;

	/**
	 * 创建时间
	 */
	@org.springframework.format.annotation.DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date create_time;

	/**
	 * 修改时间
	 */
	@org.springframework.format.annotation.DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date update_time;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setTitle(String title){
		this.title=title;
	}

	public String getTitle(){
		return this.title;
	}

	public void setContent(String content){
		this.content=content;
	}

	public String getContent(){
		return this.content;
	}

	public void setAuthor(String author){
		this.author=author;
	}

	public String getAuthor(){
		return this.author;
	}

	public void setCreate_time(java.util.Date create_time){
		this.create_time=create_time;
	}

	public java.util.Date getCreate_time(){
		return this.create_time;
	}

	public void setUpdate_time(java.util.Date update_time){
		this.update_time=update_time;
	}

	public java.util.Date getUpdate_time(){
		return this.update_time;
	}

}