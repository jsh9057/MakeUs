package com.skuniv.makeus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skuniv.makeus.dao.UsersMapper;
import com.skuniv.makeus.dto.Users;

@Service
public class SignupServiceImpl implements SignupService{
	@Autowired
	UsersMapper usersDao;
	
	@Override
	public Users getUsersbyNick(String nick) {
		return usersDao.getUsersbyNick(nick);
	}

	@Override
	public Users getUsersbyUserId(int userId) {
		return usersDao.getUsersbyUserId(userId);
	}
	
	@Override
	public void registUser(Users user) {
		try {
		usersDao.registUser(user);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
