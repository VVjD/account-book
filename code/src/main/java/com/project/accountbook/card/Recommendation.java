package com.project.accountbook.card;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.accountbook.card.model.CardDTO;
import com.project.accountbook.card.repository.CardDAO;


@WebServlet("/card/recommendation.do")
public class Recommendation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CardDAO dao = new CardDAO();
        ArrayList<CardDTO> list = dao.randomCard();

        req.setAttribute("list", list);

        System.out.println("Random Card List Size: " + list.size()); // 디버깅: 랜덤 카드 목록 크기 출력

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/card/recommendation.jsp");
        dispatcher.forward(req, resp);
    }
}