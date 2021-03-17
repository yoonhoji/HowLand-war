package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlReplyDAO;
import dao.MySqlTutorialDAO;
import dao.MySqlUserDAO;
import dto.UserVO;

@Component("/tutorial/delete.do")
public class TutorialDeleteController implements Controller, DataBinding {
	private MySqlReplyDAO replyDao;
	private MySqlTutorialDAO tutorialDao;
	private MySqlUserDAO userDao;
	
	public TutorialDeleteController setReplyDao(MySqlReplyDAO replyDao) {
		this.replyDao = replyDao;
		return this;
	}
	public TutorialDeleteController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	public TutorialDeleteController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"tseq", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int tseq = (Integer) model.get("tseq");
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("user");
		
		replyDao.deleteTutorial(tseq);
		tutorialDao.delete(tseq);
		userDao.postDown(user.getNo());
		
		return "redirect:../tutorial/list.do?tag=all&align=tseq desc";
	}
}
