package com.work.bean;
/**
 * @author 
 *
 */
public class TieziPraise  {

	/**
	 * 贴子编号
	 */
	private Integer tiezi_id;

	/**
	 * 用户编号
	 */
	private Integer user_id;

	public void setTiezi_id(Integer tiezi_id){
		this.tiezi_id=tiezi_id;
	}

	public Integer getTiezi_id(){
		return this.tiezi_id;
	}

	public void setUser_id(Integer user_id){
		this.user_id=user_id;
	}

	public Integer getUser_id(){
		return this.user_id;
	}

}