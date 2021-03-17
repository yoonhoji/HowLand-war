package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import controller.Component;
import dto.TutorialVO;
import dto.UserVO;

@Component("tutorialDao")
public class MySqlTutorialDAO implements TutorialDAO {
	private DataSource ds;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public ArrayList<TutorialVO> selectList(String tag, String align) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<TutorialVO> tutorials = new ArrayList<>();

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			if (tag.contentEquals("all")) {
				tag = "";
			}
			rs = stmt.executeQuery("SELECT * FROM tutorial WHERE tag like '%" + tag + "%' ORDER BY "+align);

			while (rs.next()) {
				tutorials.add(new TutorialVO()
						.setTseq(rs.getInt("TSEQ"))
						.setTag(rs.getString("TAG"))
						.setTitle(rs.getString("TITLE"))
						.setDescription(rs.getString("DESCRIPTION"))
						.setWriter(rs.getString("WRITER"))
						.setNo(rs.getInt("NO"))
						.setMastery(rs.getInt("MASTERY"))
						.setDifficulty(rs.getInt("DIFFICULTY"))
						.setTime(rs.getInt("TIME"))
						.setMainimg(rs.getString("MAINIMG"))
						.setImg1(rs.getString("IMG1"))
						.setContent1(rs.getString("CONTENT1"))
						.setImg2(rs.getString("IMG1"))
						.setContent2(rs.getString("CONTENT1"))
						.setImg3(rs.getString("IMG1"))
						.setContent3(rs.getString("CONTENT1"))
						.setImg4(rs.getString("IMG1"))
						.setContent4(rs.getString("CONTENT1"))
						.setReply(rs.getInt("REPLY"))
						.setLikes(rs.getInt("LIKES"))
						.setView(rs.getInt("VIEW"))
						.setIndate(rs.getString("INDATE"))
						.setEdit(rs.getString("EDIT"))
						.setEditdate(rs.getString("EDITDATE")));
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
		return tutorials;
	}
	
	@Override
	public ArrayList<TutorialVO> selectMyList(int no, String align) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<TutorialVO> tutorials = new ArrayList<>();

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM tutorial WHERE no="+no+" ORDER BY "+align);

			while (rs.next()) {
				tutorials.add(new TutorialVO()
						.setTseq(rs.getInt("TSEQ"))
						.setTag(rs.getString("TAG"))
						.setTitle(rs.getString("TITLE"))
						.setDescription(rs.getString("DESCRIPTION"))
						.setWriter(rs.getString("WRITER"))
						.setNo(rs.getInt("NO"))
						.setMastery(rs.getInt("MASTERY"))
						.setDifficulty(rs.getInt("DIFFICULTY"))
						.setTime(rs.getInt("TIME"))
						.setMainimg(rs.getString("MAINIMG"))
						.setImg1(rs.getString("IMG1"))
						.setContent1(rs.getString("CONTENT1"))
						.setImg2(rs.getString("IMG1"))
						.setContent2(rs.getString("CONTENT1"))
						.setImg3(rs.getString("IMG1"))
						.setContent3(rs.getString("CONTENT1"))
						.setImg4(rs.getString("IMG1"))
						.setContent4(rs.getString("CONTENT1"))
						.setReply(rs.getInt("REPLY"))
						.setLikes(rs.getInt("LIKES"))
						.setView(rs.getInt("VIEW"))
						.setIndate(rs.getString("INDATE"))
						.setEdit(rs.getString("EDIT"))
						.setEditdate(rs.getString("EDITDATE")));
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
		return tutorials;
	}
	
	@Override
	public int insert(TutorialVO tutorial) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "insert into tutorial(TAG, TITLE, DESCRIPTION, WRITER, NO, MASTERY, DIFFICULTY, TIME, MAINIMG, "
					+ "IMG1, CONTENT1, IMG2, CONTENT2, IMG3, CONTENT3, IMG4, CONTENT4) "
			+ "values(" + "'" + tutorial.getTag() + "', '"
							+ tutorial.getTitle() + "', '"
							+ tutorial.getDescription() + "', '"
							+ tutorial.getWriter() + "', '"
							+ tutorial.getNo() + "', '"
							+ tutorial.getMastery() + "', '"
							+ tutorial.getDifficulty() + "', '"
							+ tutorial.getTime() + "', '"			
							+ tutorial.getMainimg() + "', '"
							+ tutorial.getImg1() + "', '"
							+ tutorial.getContent1() + "', '"
							+ tutorial.getImg2() + "', '"
							+ tutorial.getContent2() + "', '"
							+ tutorial.getImg3() + "', '"
							+ tutorial.getContent3() + "', '"
							+ tutorial.getImg4() + "', '"
							+ tutorial.getContent4() + "')";
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
	public TutorialVO selectOne(int tseq)throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM tutorial WHERE TSEQ =" + tseq);
			
			if(rs.next()) {
				return new TutorialVO()
						.setTseq(rs.getInt("TSEQ"))
						.setTag(rs.getString("TAG"))
						.setTitle(rs.getString("TITLE"))
						.setDescription(rs.getString("DESCRIPTION"))
						.setWriter(rs.getString("WRITER"))
						.setNo(rs.getInt("NO"))
						.setMastery(rs.getInt("MASTERY"))
						.setDifficulty(rs.getInt("DIFFICULTY"))
						.setTime(rs.getInt("TIME"))
						.setMainimg(rs.getString("MAINIMG"))
						.setImg1(rs.getString("IMG1"))
						.setContent1(rs.getString("CONTENT1"))
						.setImg2(rs.getString("IMG2"))
						.setContent2(rs.getString("CONTENT2"))
						.setImg3(rs.getString("IMG3"))
						.setContent3(rs.getString("CONTENT3"))
						.setImg4(rs.getString("IMG4"))
						.setContent4(rs.getString("CONTENT4"))
						.setReply(rs.getInt("REPLY"))
						.setLikes(rs.getInt("LIKES"))
						.setView(rs.getInt("VIEW"))
						.setIndate(rs.getString("INDATE"))
						.setEdit(rs.getString("EDIT"))
						.setEditdate(rs.getString("EDITDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (stmt != null)stmt.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {
				 e2.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public int update(TutorialVO tutorial) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "update tutorial set TAG = '" + tutorial.getTag()
			+ "', TITLE = '" + tutorial.getTitle()
			+ "', DESCRIPTION = '" + tutorial.getDescription()
			+ "', DIFFICULTY = '" + tutorial.getDifficulty()
			+ "', TIME = '" + tutorial.getTime()
			+ "', MAINIMG = '" + tutorial.getMainimg()
			+ "', IMG1 = '" + tutorial.getImg1()
			+ "', CONTENT1 = '" + tutorial.getContent1()
			+ "', IMG2 = '" + tutorial.getImg2()
			+ "', CONTENT2 = '" + tutorial.getContent2()
			+ "', IMG3 = '" + tutorial.getImg3()
			+ "', CONTENT3 = '" + tutorial.getContent3()
			+ "', IMG4 = '" + tutorial.getImg4()
			+ "', CONTENT4 = '" + tutorial.getContent4()
			
			+ "', EDIT='2', EDITDATE=NOW() WHERE TSEQ=" + tutorial.getTseq();

			return stmt.executeUpdate(sql);
			
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
	}

	@Override
	public int delete(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from tutorial WHERE TSEQ=" + tseq;
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
	public int replyUp(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET REPLY=REPLY+1 WHERE TSEQ=" + tseq;
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
	public int replyDown(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET REPLY=REPLY-1 WHERE TSEQ=" + tseq;
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
	public int likeUp(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET LIKES=LIKES+1 WHERE TSEQ=" + tseq;
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
	public int likeDown(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET LIKES=LIKES-1 WHERE TSEQ=" + tseq;
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
	public int viewUp(int tseq) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET VIEW=VIEW+1 WHERE TSEQ=" + tseq;
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
	public int maxTseq() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int maxTseq = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT tseq FROM tutorial order by tseq desc");					

			while (rs.next()) {
				if (rs.getInt("TSEQ") > maxTseq) {
					maxTseq = rs.getInt("TSEQ");
				}
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return maxTseq;
	}
	
	@Override
	public int updateMastery(int no, int mastery) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE tutorial SET MASTERY="+mastery+" WHERE NO=" + no;
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
