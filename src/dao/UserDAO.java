package dao;

import java.util.List;

import dto.UserVO;

public interface UserDAO {
	List<UserVO> selectList() throws Exception;
	int insert(UserVO user) throws Exception;
	int idCheck(String id, String forr) throws Exception;
	UserVO selectOne(int no) throws Exception;
	int update(UserVO user) throws Exception;
	UserVO exist(String id, String pw) throws Exception;
	UserVO rcmdUser(String id) throws Exception;
	UserVO newUser() throws Exception;
	void rcmdPoint(UserVO rcmdUser, UserVO newUser) throws Exception;
	String findId(String name, String phone) throws Exception;
	String findPw(String name, String id) throws Exception;
	int postUp(int no) throws Exception;
	int likeUp(int tseq) throws Exception;
	int likeDown(int tseq) throws Exception;
	int postDown(int no) throws Exception;
	int orderCart(int no, int sum) throws Exception;
	int status(int no, String status) throws Exception;
}