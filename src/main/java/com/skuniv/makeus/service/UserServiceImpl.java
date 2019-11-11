package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.UsersMapper;
import com.skuniv.makeus.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UsersMapper userDao;

    public List<Users> allUserListService(){
        return userDao.allUsers();
    }
    public void updatePsSerivce(Users user){
        userDao.updatePs(user);
    }
    public List<Users> getProfessorService () {return  userDao.getProfessor();}
}
