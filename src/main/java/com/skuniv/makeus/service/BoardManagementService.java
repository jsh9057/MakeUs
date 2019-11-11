package com.skuniv.makeus.service;

import java.util.List;

import com.skuniv.makeus.dto.Board_Managament;
import com.skuniv.makeus.dto.Myclass;

public interface BoardManagementService {
    public List<Board_Managament> loadGradeList();
    public List<Board_Managament> loadCommonMenuList();
    public List<Board_Managament> loadOtherMenuList();
    public List<Board_Managament> loadClassMenuList();
    public List<Board_Managament> loadAllMenuList();
    public boolean isMyclssBoard(int boardNo, List<Myclass> myclassList);
    public Board_Managament getBoard_Management(int boardNo);
    public void insertClassBoardList(List<Board_Managament> board_managamentList);
    public void insertCommonBoardService (Board_Managament board_managament);
}
