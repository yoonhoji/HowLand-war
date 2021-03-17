package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import controller.Component;

@Component("likeDao")
public class MySqlLikeDAO implements LikeDAO {
	private DataSource ds;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public int likeInsert(int tseq, int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			String sql = "insert into LIKES(tseq, no) values(" + tseq + ", " + no + ")";
			
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
	public int likeDelete(int tseq, int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			String sql = "delete from LIKES where tseq=" + tseq + " and no=" + no;
			
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
	public String likeCheck(int tseq, int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			rs =  stmt.executeQuery("select * from LIKES where tseq=" + tseq + " and no=" + no);
			
			if (rs.next()) {
				return "y";
			}

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
		return "n";
	}
}
