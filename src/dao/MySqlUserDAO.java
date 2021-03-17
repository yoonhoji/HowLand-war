package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import controller.Component;
import dto.UserVO;

@Component("userDao")
public class MySqlUserDAO implements UserDAO {
	private DataSource ds;

	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}

	public UserVO exist(String id, String pw) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(
					"SELECT * FROM USER WHERE ID='" + id + "'");
			if (rs.next()) {
				if (rs.getString("STATUS").equals("Valid")) {
					if (rs.getString("PW").equals(pw)) {
						
						return new UserVO()
								.setNo(rs.getInt("NO"))
								.setId(rs.getString("ID"))
								.setPw(rs.getString("PW"))
								.setName(rs.getString("NAME"))
								.setPhone(rs.getString("PHONE"))
								.setTag1(rs.getString("TAG1"))
								.setTag2(rs.getString("TAG2"))
								.setTag3(rs.getString("TAG3"))
								.setSubscriber(rs.getInt("SUBSCRIBER"))
								.setPost(rs.getInt("POST"))
								.setPoint(rs.getInt("POINT"))
								.setMastery(rs.getInt("MASTERY"))
								.setStatus(rs.getString("STATUS"));
						
					} else {
						return new UserVO().setStatus("InvPW");
					}
				} else {
					return new UserVO().setStatus(rs.getString("STATUS"));
				}
			} else {
				return new UserVO().setStatus("InvID");
			}
		} catch (SQLException e) {
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

			}
		}
		return null;
	}

	/*
	 * - MVC 아키텍처의 등장 배경 세계화와 인터넷의 등장 -> 글로벌 경쟁을 가속 -> 제품 생명주기를 단축 -> 조직도나 업무의 잦은 변경
	 * -> 프로그램의 잦은 변경 -> 기능 추가 및 변경의 용이성 -> 배포의 편의성 -> "MVC 아키텍처"
	 * 
	 * - MVC 아키텍처의 특징 유지 보수가 쉽도록, 중복 코드의 작성을 최소화하고 기존 코드의 재사용을 높임(역할을 세분화, 의존성 최소화).
	 */
	public List<UserVO> selectList() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<UserVO> users = new ArrayList<>();

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM USER ORDER BY NO ASC");

			while (rs.next()) {
				users.add(new UserVO()
						.setNo(rs.getInt("NO"))
						.setId(rs.getString("ID"))
						.setPw(rs.getString("PW"))
						.setName(rs.getString("NAME"))
						.setPhone(rs.getString("PHONE"))
						.setTag1(rs.getString("TAG1"))
						.setTag2(rs.getString("TAG2"))
						.setTag3(rs.getString("TAG3"))
						.setSubscriber(rs.getInt("SUBSCRIBER"))
						.setPost(rs.getInt("POST"))
						.setPoint(rs.getInt("POINT"))
						.setMastery(rs.getInt("MASTERY"))
						.setStatus(rs.getString("STATUS")));
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
		return users;
	}

	@Override
	public int insert(UserVO user) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "insert into USER(ID, PW, NAME, PHONE, TAG1, TAG2, TAG3, RECOMMEND)"
			+ "values(" + "'" + user.getId() + "', '"
							+ user.getPw() + "', '"
							+ user.getName() + "', '"
							+ user.getPhone() + "', '"
							+ user.getTag1() + "', '"
							+ user.getTag2() + "', '"
							+ user.getTag3() + "', '"
							+ user.getRecommend() + "')";
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
	public int idCheck(String id, String forr) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			if (forr.contentEquals("insert")) {
				rs = stmt.executeQuery("SELECT NO FROM USER WHERE ID ='" + id + "'");
			} else if (forr.contentEquals("rcmd")) {
				rs = stmt.executeQuery("SELECT NO FROM USER WHERE ID ='" + id + "' and STATUS = 'Valid'");
			}
			
			if(rs.next()) {
				return 2;
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
		return 1;
	}

	@Override
	public UserVO selectOne(int no)throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM USER WHERE NO =" + no);
			
			if(rs.next()) {
				return new UserVO()
						.setNo(rs.getInt("NO"))
						.setId(rs.getString("ID"))
						.setPw(rs.getString("PW"))
						.setName(rs.getString("NAME"))
						.setPhone(rs.getString("PHONE"))
						.setTag1(rs.getString("TAG1"))
						.setTag2(rs.getString("TAG2"))
						.setTag3(rs.getString("TAG3"))
						.setSubscriber(rs.getInt("SUBSCRIBER"))
						.setPost(rs.getInt("POST"))
						.setPoint(rs.getInt("POINT"))
						.setMastery(rs.getInt("MASTERY"))
						.setStatus(rs.getString("STATUS"));
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
	public int update(UserVO user) throws Exception {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "update USER set PW = '" + user.getPw()
			+ "', NAME = '" + user.getName()
			+ "', PHONE = '" + user.getPhone()
			+ "', TAG1 = '" + user.getTag1()
			+ "', TAG2 = '" + user.getTag2()
			+ "', TAG3 = '" + user.getTag3() + "' WHERE NO=" + user.getNo();

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
	public UserVO rcmdUser(String id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT NO, POINT FROM USER WHERE ID ='" + id + "' and STATUS = 'Valid'");
			
			if(rs.next()) {
				return new UserVO()
						.setNo(rs.getInt("NO"))
						.setPoint(rs.getInt("POINT"));
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
	public UserVO newUser() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int maxNo = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT NO FROM USER order by NO desc");					

			while (rs.next()) {
				if (rs.getInt("NO") > maxNo) {
					maxNo = rs.getInt("NO");
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
		
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT POINT FROM USER where NO="+maxNo);					

			if (rs.next()) {
				return new UserVO()
						.setNo(maxNo)
						.setPoint(rs.getInt("POINT"));
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
		return null;
	}
	
	@Override
	public void rcmdPoint(UserVO rcmdUser, UserVO newUser) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "update USER set POINT = " + (rcmdUser.getPoint()+500) + " WHERE NO=" + rcmdUser.getNo();
			stmt.executeUpdate(sql);

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
		
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "update USER set POINT = " + (newUser.getPoint()+500) + " WHERE NO=" + newUser.getNo();
			stmt.executeUpdate(sql);

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
	public String findId(String name, String phone) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT ID FROM USER where NAME='"+name+"' and PHONE='"+phone+"'");					

			if (rs.next()) {
				return rs.getString("ID");
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
		return "";
	}
	
	@Override
	public String findPw(String name, String id) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT PW FROM USER where NAME='"+name+"' and ID='"+id+"'");					

			if (rs.next()) {
				return rs.getString("PW");
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
		return "";
	}
	
	@Override
	public int postUp(int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET POST=POST+1, POINT=POINT+200, MASTERY=MASTERY+50 WHERE NO=" + no;
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
	public int postDown(int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET POST=POST-1, POINT=POINT-200, MASTERY=MASTERY-50 WHERE NO=" + no;
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
	public int likeUp(int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET POINT=POINT+50, MASTERY=MASTERY+10 WHERE NO=" + no;
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
	public int likeDown(int no) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET POINT=POINT-50, MASTERY=MASTERY-10 WHERE NO=" + no;
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
	public int orderCart(int no, int sum) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET POINT=POINT-"+sum+" WHERE NO=" + no;
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
	public int status(int no, String status) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE user SET STATUS='"+status+"' WHERE NO=" + no;
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
