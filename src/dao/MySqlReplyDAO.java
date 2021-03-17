package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import controller.Component;
import dto.ReplyVO;

@Component("replyDao")
public class MySqlReplyDAO implements ReplyDAO {
	private DataSource ds;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	
	public ArrayList<ReplyVO> selectList(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ReplyVO> replies = new ArrayList<>();

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM reply WHERE TSEQ="+tseq+" ORDER BY rseq");

			while (rs.next()) {
				replies.add(new ReplyVO()
						.setRseq(rs.getInt("RSEQ"))
						.setTseq(rs.getInt("TSEQ"))
						.setWriter(rs.getString("WRITER"))
						.setNo(rs.getInt("NO"))
						.setMastery(rs.getInt("MASTERY"))
						.setContent(rs.getString("CONTENT"))
						.setIndate(rs.getString("INDATE")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
		return replies;
	}
	
	@Override
	public int insert(ReplyVO reply) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "insert into reply(TSEQ, WRITER, NO, MASTERY, CONTENT)"
					+ " values(" + reply.getTseq() + ", '" + reply.getWriter() + "', "
					+ reply.getNo() + ", " + reply.getMastery() + ", '"+ reply.getContent() + "')";
			result = stmt.executeUpdate(sql);

		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	@Override
	public int delete(int rseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from reply WHERE RSEQ=" + rseq;
			result = stmt.executeUpdate(sql);

		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	@Override
	public int deleteTutorial(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from reply WHERE TSEQ=" + tseq;
			result = stmt.executeUpdate(sql);

		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	@Override
	public int updateMastery(int no, int mastery) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE reply SET MASTERY="+mastery+" WHERE NO=" + no;
			result = stmt.executeUpdate(sql);

		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}