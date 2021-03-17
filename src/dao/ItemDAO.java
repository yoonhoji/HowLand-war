package dao;

import java.util.List;

import dto.ItemVO;

public interface ItemDAO {
	List<ItemVO> selectList(String ctg, String align) throws Exception;
	int insert(ItemVO item) throws Exception;
	int delete(int iseq) throws Exception;
	ItemVO selectOne(int iseq) throws Exception;
	int buyUp(int iseq, int quantity) throws Exception;
}
