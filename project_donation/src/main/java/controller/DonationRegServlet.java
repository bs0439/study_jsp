package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DonationVO;
import db.BoardDAO;
import db.DonationDAO;


@WebServlet("/regDonation.do")
public class DonationRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		DonationVO d = new DonationVO();
		DonationDAO dao = new DonationDAO();
		BoardDAO dao2 = new BoardDAO();
		
		d.setBno(Integer.parseInt(request.getParameter("bno")));
		d.setDonation(Integer.parseInt(request.getParameter("donation")));
		d.setComments(request.getParameter("comments"));
		d.setId((String)session.getAttribute("id"));
		
		dao.insert(d);
		dao2.update(Integer.parseInt(request.getParameter("bno")), Integer.parseInt(request.getParameter("donation")));
	}

}
