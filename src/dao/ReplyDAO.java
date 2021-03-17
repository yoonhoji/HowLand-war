package dao;

import java.util.List;

import dto.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> selectList(int tseq) throws Exception;
	int insert(ReplyVO reply) throws Exception;
	int delete(int rseq) throws Exception;
	int deleteTutorial(int tseq) throws Exception;
	int updateMastery(int no, int mastery) throws Exception;
}