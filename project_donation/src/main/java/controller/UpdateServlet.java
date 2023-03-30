package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MemberVO;
import db.MemberDAO;

@WebServlet("/updatemember.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			MemberDAO dao = new MemberDAO();
			MemberVO m = new MemberVO();
			m.setId(request.getParameter("id"));
			m.setPw(request.getParameter("pw"));
			m.setName(request.getParameter("name"));
			m.setTel(request.getParameter("tel"));
			
			dao.update(m);
			
			response.sendRedirect("mypage.jsp");
	}

}
