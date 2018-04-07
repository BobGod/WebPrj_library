package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.JdbcUtils;

public class UserDao {

	public User getUserByUsername(String username) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = JdbcUtils.getConnection();
			String sql = "select ID,PASSWORD,USERNAME,TYPE from USERS where USERNAME=?";
			st = conn.prepareStatement(sql);
			st.setString(1, username);
			rs = st.executeQuery();
			if (rs.next()) {
				user = new User();
				String id = rs.getString("ID");
				String password = rs.getString("PASSWORD");
				String type = rs.getString("TYPE");
				user.setId(id);
				user.setUsername(username);
				user.setType(type);
				user.setPassword(password);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return user;
	}

	public User getById(String id) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = JdbcUtils.getConnection();
			String sql = "select ID,PASSWORD,USERNAME,TYPE from USERS where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				user = new User();
				String username = rs.getString("USERNAME");
				String password = rs.getString("PASSWORD");
				String type = rs.getString("TYPE");
				user.setId(id);
				user.setUsername(username);
				user.setType(type);
				user.setPassword(password);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return user;
	}

	public boolean add(User user) {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			String sql = "insert into USERS(ID,PASSWORD,USERNAME,TYPE) values (USERS_SEQUENCE.nextval,?,?,?)";
			st = conn.prepareStatement(sql);
			st.setString(1, user.getPassword());
			st.setString(2, user.getUsername());
			st.setString(3, "1");
			int num = st.executeUpdate();
			if (num < 1) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return true;
	}

	public boolean update(String password, String id) {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			String sql = "update USERS set PASSWORD=? where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, password);
			st.setString(2, id);
			int num = st.executeUpdate();
			if (num < 1) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return true;
	}

	public boolean deleteById(String id) {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			String sql = "delete from USERS where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			int num = st.executeUpdate();
			if (num < 1) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return true;
	}

	public List<User> getList() {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();
		try {
			conn = JdbcUtils.getConnection();
			String sql = "select * from USERS  order by ID asc";
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			while (rs.next()) {
				User user = new User();

				user.setId(rs.getString("ID"));
				user.setUsername(rs.getString("USERNAME"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setType(rs.getString("TYPE"));

				list.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return list;
	}

}
