package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DonationVO;

public class DonationDAO {
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public void insert(DonationVO d) {
		String query = "INSERT INTO donation (bno, id, donation, donation_date, comments) VALUES (?, ?, ?, NOW(), ?)";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, d.getBno());
			pstmt.setString(2, d.getId());
			pstmt.setInt(3, d.getDonation());
			pstmt.setString(4, d.getComments());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
