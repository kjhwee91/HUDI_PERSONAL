package net.aprilchoi.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RawJdbcUserDao {
	private Connection conn;
	
	public RawJdbcUserDao(Connection conn) {
		this.conn = conn;
	}
	
	public void insert(User user) throws SQLException {
		InsertJdbcTemplate template = new InsertJdbcTemplate(conn) {

			@Override
			String createQueryForInsert() {
				return "insert into user (email, username, passwd) values (?, ?, ?)";
			}

			@Override
			void setValuesForInsert(User user, PreparedStatement pstmt) throws SQLException {
				pstmt.setString(1, user.getEmail());
				pstmt.setString(2, user.getUsername());
				pstmt.setString(3, user.getPassword());
			}
			
		};
	    template.insert(user);
	}

	void setValuesForInsert(User user, PreparedStatement pstmt)
			throws SQLException {
		pstmt.setString(1, user.getEmail());
		pstmt.setString(2, user.getUsername());
		pstmt.setString(3, user.getPassword());
	}

	String createQueryForInsert() {
		return "insert into user (email, username, passwd) values (?, ?, ?)";
	}
	
	public void update(User user) throws SQLException {
		UpdateJdbcTemplate template = new UpdateJdbcTemplate(conn);
		template.update(user, this);
	}

	void setValuesForUpdate(User user, PreparedStatement pstmt)
			throws SQLException {
		pstmt.setString(1, user.getEmail());
		pstmt.setString(2, user.getUsername());
		pstmt.setInt(3, user.getUserId());
	}

	String createQueryForUpdate() {
		return "update user set email=?, username=? where u_id=?";
	}
	
	public User selectByUsername(String username) throws SQLException {
		String query = "select * from user where username=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, username);
		
		ResultSet rs = pstmt.executeQuery();
		User user = null;
		if(rs.next()) {
			user = new User(rs.getInt("u_id"), rs.getString("email"), rs.getString("username"), rs.getString("passwd"));
		}
		return user;
	}
}