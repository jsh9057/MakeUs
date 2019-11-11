package com.skuniv.makeus.dao;

import com.skuniv.makeus.dto.Boards;
import com.skuniv.makeus.dto.Files;

import java.util.List;

public interface BoardsMapper {
    //게시글 개수
    public int boardCount(int boardNo) throws Exception;

    //게시글 목록
    public List<Boards> boardList(int boardNo) throws Exception;

    //게시글 상세
    public Boards boardDetail(int postNo) throws Exception;

    public void upHit(int postNo) throws  Exception;

    //게시글 작성
    public void boardInsert(Boards boards) throws Exception;

    public void fileInsert (Files file) throws Exception;

    public List<Files> fileDetail(int fk_postNo) throws Exception;

    public void fileDelete (int fileNo) throws  Exception;

    public Files downFile(int fileNo) throws Exception;

    //게시글 수정
    public void boardUpdate(Boards boards) throws Exception;

    //게시글 삭제
    public int boardDelete(int postNo) throws Exception;

    public List<Boards> myPost(int boardNo, int fk_postUserId);

    public void upComment(int postNo, int count);

}