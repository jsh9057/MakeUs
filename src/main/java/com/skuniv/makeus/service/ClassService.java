package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Class;

import java.util.List;

public interface ClassService {
    public List<Class> classList(int userId);
    public List<Class> classListAll() ;
    public int createClass(Class class_);
    public Class getClass(int classId);
    public void deleteClassService (int classId);
}
