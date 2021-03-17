package controls;

import java.util.ArrayList;
import java.util.Map;

import controller.Component;
import dao.MySqlTutorialDAO;
import dto.TutorialVO;

@Component("/admin/tutlist.do")
public class AdminTutorialListController implements Controller {
	private MySqlTutorialDAO tutorialDao;
	
	public AdminTutorialListController setTutorialDAO(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {

		ArrayList<TutorialVO> tutorials = tutorialDao.selectList("", "tseq");
		model.put("tutorials", tutorials);
			
		return "/admin/AdminTutorialListPage.jsp";
	}
}
