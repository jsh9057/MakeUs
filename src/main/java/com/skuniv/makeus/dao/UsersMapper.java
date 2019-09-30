package com.skuniv.makeus.dao;

import com.skuniv.makeus.dto.Users;

public interface UsersMapper {
	public Users signin(int userId, String password);
	public Users getUsersbyNick(String nick);
	public Users getUsersbyUserId(int userId);
	public void registUser(Users user) ;
}
