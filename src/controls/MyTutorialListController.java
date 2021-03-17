package controls;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlTutorialDAO;
import dto.TutorialVO;
import dto.UserVO;

@Component("/tutorial/mylist.do")
public class MyTutorialListController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;
	
	public MyTutorialListController setTutorialDAO(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"align", String.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("user");
		
		if (user.getNo() > 0 && model.get("align") != null) {
			ArrayList<TutorialVO> tutorials = tutorialDao.selectMyList(user.getNo(), (String)model.get("align"));
			model.put("tutorials", tutorials);
			
			return "/tutorial/MyTutorialPage.jsp";
		} else {
			return "model.get(\"align\") is null";
		}
	}
}
