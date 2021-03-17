package controls;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlLikeDAO;
import dao.MySqlReplyDAO;
import dao.MySqlTutorialDAO;
import dao.MySqlUserDAO;
import dto.ReplyVO;
import dto.TutorialVO;
import dto.UserVO;

@Component("/tutorial/detail.do")
public class TutorialDetailController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;
	private MySqlReplyDAO replyDao;
	private MySqlLikeDAO likeDao;
	private MySqlUserDAO userDao;
	
	public TutorialDetailController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	public TutorialDetailController setReplyDao(MySqlReplyDAO replyDao) {
		this.replyDao = replyDao;
		return this;
	}
	public TutorialDetailController setLikeDao(MySqlLikeDAO likeDao) {
		this.likeDao = likeDao;
		return this;
	}
	public TutorialDetailController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"tseq", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("user");
		
		int tseq = (Integer)model.get("tseq");
		
		tutorialDao.viewUp(tseq);
		
		String likeCheck = likeDao.likeCheck(tseq, user.getNo());
		System.out.println(likeCheck);
		model.put("likeCheck", likeCheck);
		
		TutorialVO tutorial = tutorialDao.selectOne(tseq);
		model.put("tutorial", tutorial);
		
		UserVO writer = userDao.selectOne(tutorial.getNo());
		
		tutorialDao.updateMastery(writer.getNo(), writer.getMastery());
		
		ArrayList<ReplyVO> replies = replyDao.selectList(tseq);
		model.put("replies", replies);
		
		for (ReplyVO reply : replies) {
			UserVO repler = userDao.selectOne(reply.getNo());
			replyDao.updateMastery(repler.getNo(), repler.getMastery());
		}
		
		
		return "/tutorial/TutorialDetailPage.jsp";
	}
}
