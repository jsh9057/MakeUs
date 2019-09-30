package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.BoardsMapper;
import com.skuniv.makeus.dto.Boards;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardServiceImpl implements BoardService{

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    BoardsMapper mBoardsMapper;

    public List<Boards> boardListService(int boardNo) throws Exception {
        return mBoardsMapper.boardList(boardNo);
    }
    public Boards boardDetailService(int postNo) throws Exception {
        return mBoardsMapper.boardDetail(postNo);
    }
    public int boardInsertService(Boards board) throws Exception {
        return mBoardsMapper.boardInsert(board);
    }
    public int boardUpdateService(Boards board) throws Exception {
        return mBoardsMapper.boardUpdate(board);
    }
    public int boardDeleteService(int postNo) throws Exception{
        return mBoardsMapper.boardDelete(postNo);

    }
}