package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlReplyDAO;
import dao.MySqlTutorialDAO;
import dao.MySqlUserDAO;

@Component("/admin/deltut.do")
public class AdminTutorialDeleteController implements Controller, DataBinding {
	private MySqlReplyDAO replyDao;
	private MySqlTutorialDAO tutorialDao;
	private MySqlUserDAO userDao;
	
	public AdminTutorialDeleteController setReplyDao(MySqlReplyDAO replyDao) {
		this.replyDao = replyDao;
		return this;
	}
	public AdminTutorialDeleteController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	public AdminTutorialDeleteController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"tseq", Integer.class,
				"no", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int tseq = (Integer) model.get("tseq");
		int no = (Integer) model.get("no");
		
		replyDao.deleteTutorial(tseq);
		tutorialDao.delete(tseq);
		userDao.postDown(no);
		
		return "redirect:../admin/tutlist.do";
	}
}
