package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import javax.sql.DataSource;

import controller.Component;
import dto.CartVO;

@Component("cartDao")
public class MySqlCartDAO implements CartDAO {
	private DataSource ds;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public ArrayList<CartVO> selectCart(int no, String result) throws Exception {
		ArrayList<CartVO> cartList = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM CART_VIEW WHERE NO=" + no + " and RESULT='" + result + "'");

			while (rs.next()) {
				cartList.add(new CartVO()
						.setCseq(rs.getInt("cseq"))
						.setNo(rs.getInt("no"))
						.setIseq(rs.getInt("iseq"))
						.setImg(rs.getString("img"))
						.setUname(rs.getString("uname"))
						.setIname(rs.getString("iname"))
						.setQuantity(rs.getInt("quantity"))
						.setIndate(rs.getString("indate"))
						.setBuydate(rs.getString("buydate"))
						.setCoupon(rs.getString("coupon"))
						.setPrice(rs.getInt("price"))
						.setResult(rs.getString("result"))
				);
				
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

			}
		}
		return cartList;
	}
	
	@Override
	public int buyNow(CartVO cart) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			// 쿠폰 번호 생성
			Random rd = new Random();
			
			String[] coupon = new String[4];
			String[] fourNum = new String[4];
			
			for (int i = 0; i < 4; i++) {
				for (int j = 0; j < 4; j++) {
					fourNum[j] = (Integer.toString(rd.nextInt(10)));
		        }
				coupon[i] = fourNum[0]+fourNum[1]+fourNum[2]+fourNum[3];
			}
				
				
			String fullCoupon = coupon[0]+"-"+coupon[1]+"-"+coupon[2]+"-"+coupon[3];

			String sql = "insert into cart(no, iseq, img, quantity, coupon, buydate, result)"
					+ "values(" + cart.getNo() + ", "
								+ cart.getIseq() + ", '"
								+ cart.getImg() + "', "
								+ cart.getQuantity() + ", '"
								+ fullCoupon + "', NOW(), '2')";
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
	public int insertCart(CartVO cart) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "insert into cart(no, iseq, img, quantity)"
					+ "values(" + cart.getNo() + ", "
								+ cart.getIseq() + ", '"
								+ cart.getImg() + "', "
								+ cart.getQuantity() + ")";
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
	public int deleteCart(int cseq) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			String sql = "DELETE FROM CART WHERE CSEQ=" + cseq;
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
	public int orderCart(int cseq) throws Exception{
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			// 쿠폰 번호 생성
			Random rd = new Random();
			
			String[] coupon = new String[4];
			String[] fourNum = new String[4];
			
			for (int i = 0; i < 4; i++) {
				for (int j = 0; j < 4; j++) {
					fourNum[j] = (Integer.toString(rd.nextInt(10)));
		        }
				coupon[i] = fourNum[0]+fourNum[1]+fourNum[2]+fourNum[3];
			}
				
				
			String fullCoupon = coupon[0]+"-"+coupon[1]+"-"+coupon[2]+"-"+coupon[3];
			
			String sql = "update cart set RESULT='2', BUYDATE=NOW(), COUPON='"+ fullCoupon +"' WHERE CSEQ=" + cseq;
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
	public CartVO forBuyUp(int cseq) throws Exception {
		CartVO cart = new CartVO();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT ISEQ, QUANTITY FROM CART_VIEW WHERE CSEQ="+cseq);

			while (rs.next()) {
				cart.setIseq(rs.getInt("iseq"))
					.setQuantity(rs.getInt("quantity"));
				
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

			}
		}
		return cart;
	}
}
