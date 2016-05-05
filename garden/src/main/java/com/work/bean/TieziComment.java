package com.work.bean;

import java.util.Date;

/**
 * @author 
 *
 */
public class TieziComment  {

	/**
	 * 
	 */
	private Integer id;

	/**
	 * 贴子编号
	 */
	private Integer tiezi_id;

	/**
	 * 评论内容
	 */
	private String content;

	/**
	 * 用户编号
	 */
	private Integer user_id;
	
	private String username;
	
	private Date create_time;

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setTiezi_id(Integer tiezi_id){
		this.tiezi_id=tiezi_id;
	}

	public Integer getTiezi_id(){
		return this.tiezi_id;
	}

	public void setContent(String content){
		this.content=content;
	}

	public String getContent(){
		return this.content;
	}

	public void setUser_id(Integer user_id){
		this.user_id=user_id;
	}

	public Integer getUser_id(){
		return this.user_id;
	}

}