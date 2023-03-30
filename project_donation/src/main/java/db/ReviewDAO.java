package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.BoardVO;

public class ReviewDAO {
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public void insert(BoardVO b) {
		String query = "INSERT INTO review_board (title, content, regDate, target_amount, cate, price) VALUES (?, ?, NOW(), ?, ?, ?)";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getTarget_amount());
			pstmt.setString(4, b.getCate());
			pstmt.setInt(5, b.getPrice());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(int bno) {
		String query = "DELETE FROM review_board WHERE bno = ?";
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
