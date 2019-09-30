package com.skuniv.makeus.dto;

import java.time.LocalDateTime;

public class Users {
	int userId;
	String password;
	String nick;
	String name;
	int grade;
	String phone;
	String email;
	boolean ps;
	boolean operator;
	String session_key;
	LocalDateTime session_limit;
	LocalDateTime login_date;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isPs() {
		return ps;
	}
	public void setPs(boolean ps) {
		this.ps = ps;
	}
	public boolean isOperator() {
		return operator;
	}
	public void setOperator(boolean operator) {
		this.operator = operator;
	}
	public String getSession_key() {
		return session_key;
	}
	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}
	public LocalDateTime getSession_limit() {
		return session_limit;
	}
	public void setSession_limit(LocalDateTime session_limit) {
		this.session_limit = session_limit;
	}
	public LocalDateTime getLogin_date() {
		return login_date;
	}
	public void setLogin_date(LocalDateTime login_date) {
		this.login_date = login_date;
	}

}
