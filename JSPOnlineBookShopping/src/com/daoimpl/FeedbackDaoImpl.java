package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.Feedback;
import com.dao.FeedbackDao;
import com.db.DBConnection;

public class FeedbackDaoImpl implements FeedbackDao{
	public int add(Feedback feedback) {
		Connection conn = DBConnection.dbConnect();
		int addFeedbackCount = 0;
		try {
			PreparedStatement ps = conn.prepareStatement("insert into feedback values(seq_feedback_id.nextVal,?,?,?,?)");
			ps.setString(1, feedback.getName());
			ps.setString(2, feedback.getEmail());
			ps.setString(3, feedback.getSubject());
			ps.setString(4, feedback.getDetails());
			addFeedbackCount = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addFeedbackCount;
	}

}
