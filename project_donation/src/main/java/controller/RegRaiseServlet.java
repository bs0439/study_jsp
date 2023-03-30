package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.BoardVO;
import db.BoardDAO;

@WebServlet("/regRaise.do")
public class RegRaiseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		MultipartRequest multi = new MultipartRequest(request, application.getRealPath("/images"), // 파일을 저장할 경로
				100 * 1024 * 1024, // 최대 파일 크기
				"utf-8", // 인코딩
				new DefaultFileRenamePolicy() // 동일한 파일명이 있을 경우 처리방법
		);
		String content = multi.getParameter("content");
		content = content.replace("\r\n", "<br>");

		BoardVO b = new BoardVO();
		BoardDAO dao = new BoardDAO();
		System.out.println(multi.getParameter("title"));
		b.setTitle(multi.getParameter("title"));
		b.setContent(content);
		b.setEndDate(multi.getParameter("endDate"));
		b.setCate(multi.getParameter("cate"));
		b.setYoutube(multi.getParameter("youtube"));
		b.setTarget_amount(Integer.parseInt(multi.getParameter("target_amount")));
		// 파일을 얻어와야 하니깐
		File file = multi.getFile("upload");
		File file2 = multi.getFile("upload2");
		if (file != null) {
			b.setFname(file.getName());
		}
		if (file != null) {
			b.setFname2(file2.getName());
		}
		dao.insert(b);

		// 업데이트 실행되었으면 메인페이지로 돌아가기

		response.sendRedirect("raise.jsp");
	}
}
