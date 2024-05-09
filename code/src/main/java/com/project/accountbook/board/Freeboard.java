package com.project.accountbook.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.accountbook.board.post.model.FreeDTO;
import com.project.accountbook.board.post.model.PostDTO;
import com.project.accountbook.board.repository.BoardDAO;

@WebServlet("/board/freeBoard.do")
public class Freeboard extends HttpServlet {
	
	BoardDAO dao = new BoardDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //n : 목록보기, y : 검색하기
		
		if((column == null && word == null) || (word.equals(""))) {
			search = "n";
		} else {
			search = "y";
		}
		
		HashMap<String, String> map = new HashMap<>();
		
		
		if(column == null) column = "";
		if(word == null) word = "";	
		
		map.put("search", search);
		map.put("column", column);
		map.put("word", word);
		
		
		
		ArrayList<PostDTO> freeList = dao.list(map, "2");

		
		for (PostDTO list : freeList) {
			
            String title = list.getTitle();        
            
            if(search != null && search.equals("y") && (column.equals("title") || column.equals("total"))) {
    			title = title.replace(word, "<span style='color: tomato; font-weight: bold;'>" + word + "</span>");
    			list.setTitle(title);
    		}
            
        }
		
		req.setAttribute("freeList", freeList); // freeList 객체를 요청 객체에 추가
		req.setAttribute("map", map);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/free-board.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq"); //Post seq
		String type = req.getParameter("type"); //Like, Dislike 구분

		Cookie postcookie;
		Cookie[] cookies = req.getCookies(); // 모든 쿠키 가져오기
		boolean check = false;

		if (cookies!= null) {
		    for (Cookie c : cookies) {
		        String name = c.getName(); // 쿠키 이름 가져오기
		        String value = c.getValue(); //쿠기 내용 가져오기
		        if (name.equals("postSeq"+seq) && value.equals(seq)) {
		            check = true;
		        } 	        
		    }
	    }
		
		if(check == false) {
			if(type.equals("like")) {	
				dao.like(seq);
				postcookie = new Cookie("postSeq"+seq, seq);
				//postcookie.setMaxAge(60 * 60 * 24);
				postcookie.setMaxAge(60 * 60);
				postcookie.setPath("/");
				resp.addCookie(postcookie);
				
				
			} else if (type.equals("dislike")) {
				dao.dislike(seq);
				postcookie = new Cookie("postSeq"+seq, seq);
				//postcookie.setMaxAge(60 * 60 * 24);
				postcookie.setMaxAge(60 * 60);
				postcookie.setPath("/");
				resp.addCookie(postcookie);
			}
		} 
	
	}
}
