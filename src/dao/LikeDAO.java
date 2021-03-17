package dao;

public interface LikeDAO {
	int likeInsert(int tseq, int no) throws Exception;
	int likeDelete(int tseq, int no) throws Exception;
	String likeCheck(int tseq, int no) throws Exception;
}
