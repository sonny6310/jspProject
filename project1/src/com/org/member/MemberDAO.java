package com.org.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.org.util.DataSource;

public class MemberDAO {
	private static MemberDAO mDAO = new MemberDAO();

	public static MemberDAO getInstance() {
		return mDAO;
	}

	public int regist(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int x = 0;

		try {
			conn = DataSource.getConnection();
			pstmt = conn.prepareStatement("insert into CloudMember(id,pw,name,email) values (?,?,?,?)");
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPw());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getEmail());
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception e) {
			e.printStackTrace();
			return x;
		} finally {
			DataSource.doClose(null, pstmt, conn);
		}
		return x;
	}
	
	public int registNaver(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int x = 0;
		
		try {
			conn = DataSource.getConnection();
			pstmt = conn.prepareStatement("insert into CloudMemberNaver(id,name,email) values (?,?,?)");
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getName());
			pstmt.setString(3, mDTO.getEmail());
			pstmt.executeUpdate();
			x = 1;
		} catch (Exception e) {
			e.printStackTrace();
			return x;
		} finally {
			DataSource.doClose(null, pstmt, conn);
		}
		return x;
	}

	public int login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			conn = DataSource.getConnection();
			pstmt = conn.prepareStatement("select pw from CloudMember where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			rs.next();
			String passwd = rs.getString("pw");
			if (passwd.equals(pw)) {
				x = 1;
			}
		} catch (Exception e) {
			return x;
		} finally {
			DataSource.doClose(rs, pstmt, conn);
		}
		return x;
	}

	public int idCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			conn = DataSource.getConnection();
			pstmt = conn.prepareStatement("select * from CloudMember where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (!rs.next()) {
				x = 1;
			}
		} catch (Exception e) {
			return x;
		} finally {
			DataSource.doClose(rs, pstmt, conn);
		}
		return x;
	}
}
