package com.work.bean;

import java.util.List;

/**
 * @author 
 *
 */
public class Tiezi  {

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
	 * 创建时间
	 */
	@org.springframework.format.annotation.DateTimeFormat(pattern="yyyy-MM-dd")
	private java.util.Date create_time;

	/**
	 * 创建人
	 */
	private Integer create_by;
	
	/**
	 * 帖子的所有评论
	 */
	private List<TieziComment> comments;
	
	public List<TieziComment> getComments() {
		return comments;
	}

	public void setComments(List<TieziComment> comments) {
		this.comments = comments;
	}

	private String create_username;
	
	public String getCreate_username() {
		return create_username;
	}

	public void setCreate_username(String create_username) {
		this.create_username = create_username;
	}

	private Integer nPraise;
	
	private Integer nComment;
	
	private Integer hasPraised;

	public Integer getHasPraised() {
		return hasPraised;
	}

	public void setHasPraised(Integer hasPraised) {
		this.hasPraised = hasPraised;
	}

	public Integer getnPraise() {
		return nPraise;
	}

	public void setnPraise(Integer nPraise) {
		this.nPraise = nPraise;
	}

	public Integer getnComment() {
		return nComment;
	}

	public void setnComment(Integer nComment) {
		this.nComment = nComment;
	}

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

	public void setCreate_time(java.util.Date create_time){
		this.create_time=create_time;
	}

	public java.util.Date getCreate_time(){
		return this.create_time;
	}

	public void setCreate_by(Integer create_by){
		this.create_by=create_by;
	}

	public Integer getCreate_by(){
		return this.create_by;
	}

}