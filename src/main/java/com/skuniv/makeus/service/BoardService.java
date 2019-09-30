package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Boards;

import java.util.List;

public interface BoardService {
    public List<Boards> boardListService(int boardNo) throws Exception;
    public Boards boardDetailService(int postNo) throws Exception;
    public int boardInsertService(Boards board) throws Exception;
    public int boardUpdateService(Boards board) throws Exception;
    public int boardDeleteService(int postNo) throws Exception;

}