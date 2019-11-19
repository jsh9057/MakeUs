package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.MyclassMapper;
import com.skuniv.makeus.dto.Myclass;
import com.skuniv.makeus.dto.MyclassEnrol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyClassServiceImpl implements MyClassService {
    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    MyclassMapper myclassDao;

    @Override
    public List<Myclass> myclassList(int userId) {
        return myclassDao.myclassList(userId);
    }
    public List<MyclassEnrol> studentMyClassList (int userId) {return myclassDao.studentMyClassList(userId);}
    public void tempInsertMyclass (Myclass myclass) {myclassDao.tempMyclass(myclass);}
    public List<Myclass> allMyclass (int userId) {return myclassDao.allMyclassList(userId);}
    public void cancelMyclass(int userId, int fk_classId){myclassDao.cancelMyclass(userId,fk_classId);}
    public List<Myclass> getMyClassList (int fk_classId){return myclassDao.getMyClassList(fk_classId);}
    public void myClassConfirm (int userId, int fk_classId) {myclassDao.myClassConfirm(userId,fk_classId);}
    public void insertMyClassService(Myclass myclass){
        myclassDao.insertMyClass(myclass);
    }
    public List<Myclass> operatorMyClass(){
        return myclassDao.operatorMyClass();
    }
    public int isMyClassService(int userId, int classId){
        return myclassDao.isMyClass(userId,classId);
    }
}
