package com.work.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	 * 1:管理员
	 * 2：普通用户
	 */
	private String type;
	
	private String sex;
	
	private String nickname;
	
	private String email;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	
	private String self_intro;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSelf_intro() {
		return self_intro;
	}

	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}

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