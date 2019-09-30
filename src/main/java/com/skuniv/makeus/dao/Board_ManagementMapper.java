package com.skuniv.makeus.dao;

import java.util.List;

import com.skuniv.makeus.dto.Board_Managament;

public interface Board_ManagementMapper {
	public List<Board_Managament> loadGradeMenuList();
	public List<Board_Managament> loadCommonMenuList();
	public List<Board_Managament> loadOtherMenuList();
}
