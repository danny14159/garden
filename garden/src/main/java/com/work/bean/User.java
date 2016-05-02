package com.work.bean;
/**
 * @author 
 *
 */
public class User  {

	/**
	 * 
	 */
	private Integer id;

	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 密码
	 */
	private String password;

	/**
	 * 用户类型
	 */
	private String type;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setUsername(String username){
		this.username=username;
	}

	public String getUsername(){
		return this.username;
	}

	public void setPassword(String password){
		this.password=password;
	}

	public String getPassword(){
		return this.password;
	}

	public void setType(String type){
		this.type=type;
	}

	public String getType(){
		return this.type;
	}

}