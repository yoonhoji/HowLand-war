package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import controller.Component;
import dto.ItemVO;
import dto.UserVO;

@Component("itemDao")
public class MySqlItemDAO implements ItemDAO {
	private DataSource ds;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public ArrayList<ItemVO> selectList(String ctg, String align) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ItemVO> items = new ArrayList<>();

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			if (ctg.contentEquals("all")) {
				ctg = "";
			}
			rs = stmt.executeQuery("SELECT * FROM item WHERE ctg like '%" + ctg + "%' ORDER BY "+align);

			while (rs.next()) {
				items.add(new ItemVO()
						.setIseq(rs.getInt("ISEQ"))
						.setCtg(rs.getString("CTG"))
						.setName(rs.getString("NAME"))
						.setImg(rs.getString("IMG"))
						.setPrice(rs.getInt("PRICE"))
						.setDescription(rs.getString("DESCRIPTION"))
						.setBuy(rs.getInt("BUY")));
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
		return items;
	}
	
	@Override
	public int insert(ItemVO item) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "insert into ITEM(CTG, NAME, IMG, PRICE, DESCRIPTION)"
			+ "values(" + "'" + item.getCtg() + "', '"
							+ item.getName() + "', '"
							+ item.getImg() + "', "
							+ item.getPrice() + ", '"
							+ item.getDescription() + "')";
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
	public int delete(int iseq) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "DELETE FROM item WHERE ISEQ=" + iseq;
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
	public ItemVO selectOne(int iseq)throws Exception{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM item WHERE iseq =" + iseq);
			
			if(rs.next()) {
				return new ItemVO()
						.setIseq(rs.getInt("ISEQ"))
						.setCtg(rs.getString("CTG"))
						.setName(rs.getString("NAME"))
						.setImg(rs.getString("IMG"))
						.setPrice(rs.getInt("PRICE"))
						.setDescription(rs.getString("DESCRIPTION"))
						.setBuy(rs.getInt("BUY"));
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
	public int buyUp(int iseq, int quantity) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			String sql = "UPDATE item SET BUY=BUY+"+quantity+" WHERE ISEQ=" + iseq;
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
