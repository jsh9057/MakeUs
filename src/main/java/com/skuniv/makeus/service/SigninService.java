package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Users;

public interface SigninService {
	public Users signin(int userNo, String password);
}
