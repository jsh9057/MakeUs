package com.skuniv.makeus.dao;

import com.skuniv.makeus.dto.Users;

import java.util.List;

public interface UsersMapper {
	public Users signin(int userId, String password);
	public Users getUsersbyNick(String nick);
	public Users getUsersbyUserId(int userId);
	public void registUser(Users user) ;
	public List<Users> allUsers ();
	public void updatePs(Users user);
	public List<Users> getProfessor();
}
