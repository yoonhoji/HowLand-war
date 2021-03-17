package controls;

import java.util.ArrayList;
import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlTutorialDAO;
import dto.TutorialVO;

@Component("/tutorial/list.do")
public class TutorialListController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;
	
	public TutorialListController setTutorialDAO(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"tag", String.class,
			"align", String.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if (model.get("tag") != null && model.get("align") != null) {
			ArrayList<TutorialVO> tutorials = tutorialDao.selectList((String)model.get("tag"), (String)model.get("align"));
			model.put("tutorials", tutorials);
			
			return "/tutorial/Index.jsp";
		} else {
			return "model.get(\"tag\") is null";
		}
	}
}
