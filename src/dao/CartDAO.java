package dao;

import java.util.ArrayList;

import dto.CartVO;

public interface CartDAO {
	ArrayList<CartVO> selectCart(int no, String result) throws Exception;
	int insertCart(CartVO cart) throws Exception;
	int deleteCart(int cseq) throws Exception;
	int orderCart(int cseq) throws Exception;
	CartVO forBuyUp(int cseq) throws Exception;
	int buyNow(CartVO cart) throws Exception;
}
