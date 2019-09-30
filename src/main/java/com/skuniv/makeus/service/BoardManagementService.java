package com.skuniv.makeus.service;

import java.util.List;

import com.skuniv.makeus.dto.Board_Managament;

public interface BoardManagementService {
	public List<Board_Managament> loadGradeMenuList();
	public List<Board_Managament> loadCommonMenuList();
	public List<Board_Managament> loadOtherMenuList();

}
