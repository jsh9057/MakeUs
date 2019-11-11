package com.skuniv.makeus.controller;

import com.skuniv.makeus.dto.Files;
import com.skuniv.makeus.service.BoardService;
import com.skuniv.makeus.util.MediaUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

@Controller
public class fileController {
    @Autowired
    BoardService boardService;

    String uploadPath = "C:\\Users\\Jeong\\git\\MakeUs\\makeus\\src\\main\\resources\\static\\assets\\images\\uploadimages\\image\\";

    @RequestMapping("/fileDown/{fileNo}")
    private void fileDown(@PathVariable int fileNo, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        Files files = null;
        try {
            files = boardService.downFileService(fileNo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String path = files.getPath();
            String savePath = path;
            String fileName = files.getFileNm();
            String oriFileNm = files.getFileOriNm();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";

            try {
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException e) {
                skip = true;
            }

            client = request.getHeader("User-Agent");

            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");

            if (!skip) {
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileNm, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileNm, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileNm.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }

    }

    @RequestMapping("/display")
    public ResponseEntity<byte[]> displayFile(@RequestParam("name") String fileName) throws Exception{
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        try{
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mediaType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath+fileName);

            if(mediaType != null){
                headers.setContentType(mediaType);
            }else{
                System.out.println("img 확장자 오류");
            }
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers, HttpStatus.CREATED);


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            in.close();
        }
        return entity;
    }
}
