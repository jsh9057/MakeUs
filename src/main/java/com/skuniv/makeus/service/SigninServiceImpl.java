package com.skuniv.makeus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skuniv.makeus.dao.UsersMapper;
import com.skuniv.makeus.dto.Users;

@Service
public class SigninServiceImpl implements SigninService{
	@Autowired
	UsersMapper usersDao;
	
	@Override
	public Users signin(int userNo, String password) {
		return usersDao.signin(userNo, password);
	}
	

}
