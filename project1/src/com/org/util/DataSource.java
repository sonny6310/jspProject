package com.org.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.org.value.ConValues;

public class DataSource {
	public static Connection getConnection() {
		Connection conn = null;

		try {
			Class.forName(ConValues.sqlClass);
			conn = DriverManager.getConnection(ConValues.sqlUrl, ConValues.sqlUser, ConValues.sqlPass);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void doClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
	}
}
