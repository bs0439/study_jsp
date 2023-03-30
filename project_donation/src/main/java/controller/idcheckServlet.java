package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MemberDAO;

@WebServlet("/idcheckServlet")
public class idcheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		
		if(dao.idcheck(id) == 1) {
			out.println("<span style = 'color : red';>사용불가</span>");
		}else {
			out.println("<span style = 'color : green';>사용가능</span>");
		}
	}
}
