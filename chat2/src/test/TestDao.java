package test;

import java.sql.*;
import java.util.*;

import javax.sql.*;
import javax.naming.*;

import test.Test;

public class TestDao {
	private static TestDao instance;

	private TestDao() {
	}

	public static TestDao getInstance() {
		if (instance == null) {
			instance = new TestDao();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int insert(Test test) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String sql = "insert into test values(3,?,?,?,sysdate)";		
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, test.getWriter());
			pstmt.setString(2, test.getContent());
			pstmt.setString(3, test.getIp());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	public List<Test> list() throws SQLException {
		List<Test> list = new ArrayList<Test>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from test order by num desc";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Test test = new Test();
				
				test.setNum(rs.getInt("num"));
				test.setWriter(rs.getString("writer"));
				test.setContent(rs.getString("content"));
				test.setIp(rs.getString("ip"));
				test.setReg_date(rs.getDate("reg_date"));
				
				list.add(test);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
}
