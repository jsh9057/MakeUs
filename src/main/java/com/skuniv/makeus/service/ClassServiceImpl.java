package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.ClassMapper;
import com.skuniv.makeus.dto.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    ClassMapper classDao;

    public List<Class> classList(int userId)  { return classDao.classList(userId); }
    public List<Class> classListAll() {
        return classDao.classListAll();
    }
    public int createClass(Class class_) {
        return classDao.createClass(class_);
    }
    public Class getClass (int classId) {return  classDao.getClass(classId);}
    public void deleteClassService(int classId) {classDao.deleteClass(classId);}

}

