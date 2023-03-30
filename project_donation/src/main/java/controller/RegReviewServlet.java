package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.BoardVO;
import db.ReviewDAO;


@WebServlet("/regReview.do")
public class RegReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String content=request.getParameter("content");
		content=content.replace("\r\n","<br>");
		
		BoardVO b = new BoardVO();
		ReviewDAO dao = new ReviewDAO();
		b.setTitle(request.getParameter("title"));
		b.setContent(content);
		b.setCate(request.getParameter("cate"));
		b.setTarget_amount(Integer.parseInt(request.getParameter("target_amount")));
		b.setPrice(Integer.parseInt(request.getParameter("price")));
		
		dao.insert(b);
		response.sendRedirect("raiseReview.jsp");
	}
}
