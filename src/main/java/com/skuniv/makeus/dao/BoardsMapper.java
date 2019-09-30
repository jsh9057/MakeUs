package com.skuniv.makeus.dao;

import com.skuniv.makeus.dto.Boards;
import java.util.List;

public interface BoardsMapper {
    //게시글 개수
    public int boardCount(int boardNo) throws Exception;

    //게시글 목록
    public List<Boards> boardList(int boardNo) throws Exception;

    //게시글 상세
    public Boards boardDetail(int postNo) throws Exception;

    //게시글 작성
    public int boardInsert(Boards boards) throws Exception;

    //게시글 수정
    public int boardUpdate(Boards boards) throws Exception;

    //게시글 삭제
    public int boardDelete(int postNo) throws Exception;
}