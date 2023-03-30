package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.MemberVO;

public class MemberDAO {
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	InitialContext ic;
	
	
	public void insert(MemberVO m) {
		String query = "INSERT INTO member (id, pw, name, tel) VALUES (?, ?, ?, ?)";
		try {
			
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPw());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getTel());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> list = new ArrayList<>();
		try {
			ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/maria");
			Connection conn = ds.getConnection();
			String query = "SELECT * FROM member";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO m = new MemberVO();
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				m.setTel(rs.getString("tel"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int idcheck(String id) {

		int result = 0;
		try {
			Connection conn = DBcon.getConnection();

			pstmt = conn.prepareStatement("SELECT count(*) FROM member WHERE id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	
	public MemberVO selectOne(String id) {
		MemberVO m = new MemberVO();
		
		String query = "SELECT * FROM member WHERE id = ?";
		try {
			ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/maria");
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setTel(rs.getString("tel"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}
	
	public void update(MemberVO m) {
		String query = "UPDATE member SET pw = ?, name = ?, tel = ? WHERE id = ?";
		try {
			ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/maria");
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getPw());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getTel());
			pstmt.setString(4, m.getId());
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String query = "DELETE FROM member WHERE id = ?";
		try {
			ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/maria");
			Connection conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int loginCheck(String id, String pw) {
		int result = 0;
		String query = "SELECT count(*) FROM member WHERE id = ? AND pw = ?";
		try {
			Connection conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
