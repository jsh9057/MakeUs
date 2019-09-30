package com.skuniv.makeus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skuniv.makeus.dao.Board_ManagementMapper;
import com.skuniv.makeus.dto.Board_Managament;

@Service
public class BoardManagementServiceImpl implements BoardManagementService{
	@Autowired
	Board_ManagementMapper board_ManagementMapper;
	
	// CommonMenuList 는 DB board_management 의 boardNo 가 1000 을 초과하는 메뉴.
	// 나중에 Commonlist및 다른 리스트를 나누는 테이블을 만드는게 좋아보임.
	
	public List<Board_Managament> loadGradeMenuList() {
		return board_ManagementMapper.loadGradeMenuList();
	}
	public List<Board_Managament> loadCommonMenuList(){
		return board_ManagementMapper.loadCommonMenuList();
	}
	public List<Board_Managament> loadOtherMenuList(){
		return board_ManagementMapper.loadOtherMenuList();
	}
}
