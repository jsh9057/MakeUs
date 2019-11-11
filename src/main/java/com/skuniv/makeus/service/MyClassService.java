package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.dto.MyclassEnrol;
import com.skuniv.makeus.dto.Users;

import java.util.List;

public interface MyClassService {
    public List<Myclass> myclassList (int userId) ;
    public List<MyclassEnrol> studentMyClassList (int userId);
    public void tempInsertMyclass(Myclass myclass);
    public List<Myclass> allMyclass (int userId);
    public void cancelMyclass(int userId, int fk_classId);
    public List<Myclass> getMyClassList (int fk_classId);
    public void myClassConfirm (int userId, int fk_classId);
    public void insertMyClassService (Myclass myclass);
    public List<Myclass> operatorMyClass();
    public int isMyClassService(int userId, int classId);
}
