package com.skuniv.makeus.service;

import com.skuniv.makeus.dao.BoardsMapper;
import com.skuniv.makeus.dto.Boards;
import com.skuniv.makeus.dto.Files;
import com.skuniv.makeus.util.ByteCalcuation;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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
    public void boardInsertService(Boards board) throws Exception {
        mBoardsMapper.boardInsert(board);
    }
    public void fileInsert(MultipartFile[] files, MultipartFile[] imgFiles, int postNo) throws Exception{

        if(!files[0].isEmpty()){
            for(MultipartFile mf : files){
                if(!mf.isEmpty()) {
                    Files file = new Files();
                    String sourceFileName = mf.getOriginalFilename();
                    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
                    File destinationFile;
                    String destinationFileName;
                    String path = "C:\\Users\\Jeong\\git\\MakeUs\\makeus\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

                    double size = mf.getSize();
                    do {
                        destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
                        destinationFile = new File(path + destinationFileName);
                    } while (destinationFile.exists());

                    destinationFile.getParentFile().mkdir();
                    mf.transferTo(destinationFile);
                    file.setFk_postNo(postNo);
                    file.setFileNm(destinationFileName);
                    file.setFileOriNm(sourceFileName);
                    file.setPath(path);
                    file.setSize(ByteCalcuation.byteCalculation(size));
                    mBoardsMapper.fileInsert(file);
                }
            }
        }
        if(!imgFiles[0].isEmpty()){
            for(MultipartFile mf : imgFiles){
                if(!mf.isEmpty()) {
                    Files file = new Files();
                    String sourceFileName = mf.getOriginalFilename();
                    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
                    File destinationFile;
                    String destinationFileName;

                    String path = "C:\\Users\\Jeong\\git\\MakeUs\\makeus\\src\\main\\resources\\static\\assets\\images\\uploadimages\\image\\";

                    double size = mf.getSize();
                    do {
                        destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension;
                        destinationFile = new File(path + destinationFileName);
                    } while (destinationFile.exists());

                    destinationFile.getParentFile().mkdir();
                    mf.transferTo(destinationFile);
                    file.setFk_postNo(postNo);
                    file.setFileNm(destinationFileName);
                    file.setFileOriNm(sourceFileName);
                    file.setPath(path);
                    file.setSize(ByteCalcuation.byteCalculation(size));
                    file.setImg(true);
                    mBoardsMapper.fileInsert(file);
                }
            }
        }
    }

    public List<Files> fileDetail (int fk_postNo) throws Exception{
        return mBoardsMapper.fileDetail(fk_postNo);
    }

    public Files downFileService (int fileNo) throws Exception{
        return mBoardsMapper.downFile(fileNo);
    }
    public void boardUpdateService(Boards board) throws Exception {
        mBoardsMapper.boardUpdate(board);
    }
    public void fileDeleteService(int fileNo) throws Exception{
        Files file = downFileService(fileNo); // 이름과 상관 X fileNo로 file 찾기
        String path = file.getPath()+file.getFileNm();
        File delfile = new File(path);
        if(delfile.exists()==true){
            delfile.delete();
            mBoardsMapper.fileDelete(fileNo);
        }
    }

    public int boardDeleteService(int postNo) throws Exception{
        List<Files> files = fileDetail(postNo);
        for(Files f : files){
            String path = f.getPath() + f.getFileNm();
            File file = new File(path);
            if (file.exists() == true){
                System.out.println(path);
                file.delete();
            }
        }
        return mBoardsMapper.boardDelete(postNo);
    }

    public Boards isFileCheckService (Boards board) throws Exception{
        List<Files> files = mBoardsMapper.fileDetail(board.getPostNo());

        Boolean isFile = false;
        Boolean isImg = false;

        if(!files.isEmpty()) {
            for (Files f : files) {
                System.out.println("file Name: "+f.getFileOriNm());
                if(f.isImg()){
                    System.out.println("이미지");
                    isImg=true;
                }else{
                    System.out.println("파일");
                    isFile=true;
                }
            }
        }
        System.out.println("img : "+isImg);
        System.out.println("file : "+isFile);
        board.setImg(isImg);
        board.setFile(isFile);
        return board;
    }

    public void upHitService(int postNo) throws Exception{
        mBoardsMapper.upHit(postNo);
    }

    public List<Boards> myPostService (int boardNo, int fk_postUserId){
        return mBoardsMapper.myPost(boardNo,fk_postUserId);
    }
    public void upCommentCountService(int postNo , int count){
        System.out.println("postNo: 댓글추가");
        mBoardsMapper.upComment(postNo, count);
    }
}