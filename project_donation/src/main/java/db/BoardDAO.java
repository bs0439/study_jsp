package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.BoardVO;

public class BoardDAO {
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public void insert(BoardVO b) {
		String query = "INSERT INTO green_board (title, content, regDate, endDate, target_amount, cate, fname, fname2, youtube) VALUES (?, ?, NOW(), ?, ?, ?, ?, ?, ?)";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getEndDate());
			pstmt.setInt(4, b.getTarget_amount());
			pstmt.setString(5, b.getCate());
			pstmt.setString(6, b.getFname());
			pstmt.setString(7, b.getFname2());
			pstmt.setString(8, b.getYoutube());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void update(int bno, int donation) {
		String query = "SELECT * FROM green_board WHERE bno = ?";
		String query2 = "UPDATE green_board SET price = ? WHERE bno = ?";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			rs.next();
			int price = rs.getInt("price");
			pstmt = conn.prepareStatement(query2);
			pstmt.setInt(1, price+donation);
			pstmt.setInt(2, bno);
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(int bno) {
		String query = "DELETE FROM green_board WHERE bno = ?";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
