package dao;

import java.util.ArrayList;
import java.util.List;

import dto.TutorialVO;

public interface TutorialDAO {
	List<TutorialVO> selectList(String tag, String align) throws Exception;
	int insert(TutorialVO tutorial) throws Exception;
	int delete(int tseq) throws Exception;
	TutorialVO selectOne(int tseq) throws Exception;
	int update(TutorialVO tutorial) throws Exception;
	int replyUp(int tseq) throws Exception;
	int replyDown(int tseq) throws Exception;
	int likeUp(int tseq) throws Exception;
	int likeDown(int tseq) throws Exception;
	int maxTseq() throws Exception;
	int viewUp(int tseq) throws Exception;
	int updateMastery(int no, int mastery) throws Exception;
	ArrayList<TutorialVO> selectMyList(int no, String align) throws Exception;
}
