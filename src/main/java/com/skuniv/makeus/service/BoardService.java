package com.skuniv.makeus.service;

import com.skuniv.makeus.dto.Boards;
import com.skuniv.makeus.dto.Files;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BoardService {
    public List<Boards> boardListService(int boardNo) throws Exception;
    public Boards boardDetailService(int postNo) throws Exception;
    public void boardInsertService(Boards board) throws Exception;
    public void fileInsert(MultipartFile[] files, MultipartFile[] imgFiles, int postNo) throws Exception;
    public List<Files> fileDetail (int fk_postNo) throws Exception;
    public void fileDeleteService(int fileNo) throws Exception;
    public Files downFileService (int fileNo) throws Exception;
    public void boardUpdateService(Boards board) throws Exception;
    public int boardDeleteService(int postNo) throws Exception;
    public Boards isFileCheckService (Boards board) throws Exception;
    public void upHitService(int postNo) throws Exception;
    public List<Boards> myPostService(int boardNo, int fk_postUserId);
    public void upCommentCountService(int postNo, int count);
}

