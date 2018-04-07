package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtils {  

	/**
	 * 获取数据库的连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			 
			 Class.forName("oracle.jdbc.driver.OracleDriver");// 加载Oracle驱动程序
		        System.out.println("开始尝试连接数据库！");
		    	String url = "jdbc:oracle:thin:@localhost:1521:XE";// 127.0.0.1是本机地址，XE是精简版Oracle的默认数据库名
				String user = "jsd1710";// 用户名,系统默认的账户名
				String password = "jsd1710";// 你安装时选设置的密码
			conn = DriverManager.getConnection(url, user, password);// 获取连接
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err.println("警告: DbConnectionManager.getConnection() 获得数据库链接失败.\r\n\r\n链接类型");
		}
		return conn;
	}

	/**
	 * 释放数据库的连接
	 */

	public static void release(Connection conn, Statement st, ResultSet rs) {

		if (rs != null) {
			try {
				rs.close(); // throw new
			} catch (Exception e) {
				e.printStackTrace();
			}
			rs = null;
		}
		if (st != null) {
			try {
				st.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			st = null;
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
