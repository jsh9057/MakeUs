package com.skuniv.makeus.dto;

import java.util.HashMap;
import java.util.List;

public class Mapping {
    HashMap<Integer,Board_Managament> boardMapping ;
    List<Board_Managament> board_managamentList;
    public Mapping(List<Board_Managament> board_managamentList){
        this.board_managamentList = board_managamentList;
        for(int i=0; i < board_managamentList.size() ; i++){
            Board_Managament board =  board_managamentList.get(i);
            boardMapping.put(board.boardNo, board);
        }
    }

    public Board_Managament getBoardNm(int boardNo){
        return boardMapping.get(boardNo);
    }
}
