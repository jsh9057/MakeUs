package com.skuniv.makeus.dao;

import java.util.List;

import com.skuniv.makeus.dto.Board_Managament;

public interface Board_ManagementMapper {
	public List<Board_Managament> loadGradeList();
	public List<Board_Managament> loadCommonMenuList();
	public List<Board_Managament> loadOtherMenuList();
	public List<Board_Managament> loadClassMenuList();
	public List<Board_Managament> loadAllList();
	public int getfk_classId(int boardNo);
	public Board_Managament getBoard_Management(int boardNo);
	public void insertClassBoardList(Board_Managament board_managament);
	public void insertCommonBoard(Board_Managament board_managament);
}
