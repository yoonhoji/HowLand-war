package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlTutorialDAO;
import dto.TutorialVO;

@Component("/tutorial/updateform.do")
public class TutorialUpdateFormController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;

	public TutorialUpdateFormController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
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
		System.out.println(model.get("tseq"));
		int tseq = (Integer)model.get("tseq");
		TutorialVO tutorial2 = tutorialDao.selectOne(tseq);
		model.put("tutorial2", tutorial2);
		
		return "/tutorial/TutorialEditPage.jsp";
	}
}
