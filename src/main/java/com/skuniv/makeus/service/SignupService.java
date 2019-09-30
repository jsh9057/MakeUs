package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Users;

public interface SignupService {
	public Users getUsersbyNick(String nick);
	public Users getUsersbyUserId(int userId);
	public void registUser(Users user);
}
