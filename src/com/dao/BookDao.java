package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Book;
import com.util.JdbcUtils;

public class BookDao {

	public Book getById(String id) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		Book book = null;
		try {
			conn = JdbcUtils.getConnection();
			String sql = "select * from BOOK where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				book = new Book();
				book.setId(rs.getString("ID"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setCode(rs.getString("CODE"));
				book.setName(rs.getString("NAME"));
				book.setPage(rs.getString("PAGE"));
				book.setPress(rs.getString("PRESS"));
				book.setPrice(rs.getString("PRICE"));
				book.setType(rs.getString("TYPE"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return book;
	}

	public List<Book> getList() {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		try {
			conn = JdbcUtils.getConnection();
			String sql = "select * from BOOK  order by ID asc";
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			while (rs.next()) {
				Book book = new Book();

				book.setId(rs.getString("ID"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setCode(rs.getString("CODE"));
				book.setName(rs.getString("NAME"));
				book.setPage(rs.getString("PAGE"));
				book.setPress(rs.getString("PRESS"));
				book.setPrice(rs.getString("PRICE"));
				book.setType(rs.getString("TYPE"));

				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JdbcUtils.release(conn, st, rs);
		}

		return list;
	}

	public boolean add(Book book) {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {

			conn = JdbcUtils.getConnection();
			String sql = "insert into BOOK (ID,CODE,NAME,TYPE,AUTHOR,PRESS,PRICE,PAGE) values (BOOK_SEQUENCE.nextval,?,?,?,?,?,?,?)";
			st = conn.prepareStatement(sql);
			st.setString(1, book.getCode());
			st.setString(2, book.getName());
			st.setString(3, book.getType());
			st.setString(4, book.getAuthor());
			st.setString(5, book.getPress());
			st.setString(6, book.getPrice());
			st.setString(7, book.getPage());
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

	public boolean update(Book book) {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtils.getConnection();
			String sql = "update BOOK set CODE=?,NAME=?,TYPE=?,AUTHOR=?,PRESS=?,PRICE=?,PAGE=? where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, book.getCode());
			st.setString(2, book.getName());
			st.setString(3, book.getType());
			st.setString(4, book.getAuthor());
			st.setString(5, book.getPress());
			st.setString(6, book.getPrice());
			st.setString(7, book.getPage());
			st.setString(8, book.getId());
			int num = st.executeUpdate();
			System.out.println(st.toString());
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
			String sql = "delete from BOOK where ID=?";
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			int num = st.executeUpdate();
			System.out.println(st.toString());
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

}
