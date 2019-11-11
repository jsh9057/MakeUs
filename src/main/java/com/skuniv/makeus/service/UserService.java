package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Users;

import java.util.List;

public interface UserService {
    public List<Users> allUserListService();
    public void updatePsSerivce(Users user);
    public List<Users> getProfessorService();
}
