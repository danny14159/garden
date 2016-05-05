package com.work.bean;
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