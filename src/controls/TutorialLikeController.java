package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlLikeDAO;
import dao.MySqlTutorialDAO;
import dao.MySqlUserDAO;

@Component("/tutorial/like.do")
public class TutorialLikeController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;
	private MySqlLikeDAO likeDao;
	private MySqlUserDAO userDao;
	
	public TutorialLikeController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	public TutorialLikeController setLikeDao(MySqlLikeDAO likeDao) {
		this.likeDao = likeDao;
		return this;
	}
	public TutorialLikeController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"tseq", Integer.class,
				"updown", String.class,
				"no", Integer.class
		};
	}
	
	public String execute(Map<String, Object> model) throws Exception {
		int tseq = (Integer) model.get("tseq");
		String updown = (String) model.get("updown");
		int no = (Integer) model.get("no");
		
		
		if (updown.contentEquals("up")) {
			tutorialDao.likeUp(tseq);
			likeDao.likeInsert(tseq, no);
			userDao.likeUp(no);
			
		} else if (updown.contentEquals("down")) {
			tutorialDao.likeDown(tseq);
			likeDao.likeDelete(tseq, no);
			userDao.likeDown(no);
		}
		
		return "redirect:../tutorial/detail.do?tseq="+tseq+"&show=like";
	}
}
