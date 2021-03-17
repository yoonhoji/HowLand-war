package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlReplyDAO;
import dao.MySqlTutorialDAO;

@Component("/reply/delete.do")
public class ReplyDeleteController implements Controller, DataBinding {
	private MySqlReplyDAO replyDao;
	private MySqlTutorialDAO tutorialDao;
	
	public ReplyDeleteController setReplyDao(MySqlReplyDAO replyDao) {
		this.replyDao = replyDao;
		return this;
	}
	public ReplyDeleteController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"rseq", Integer.class,
				"tseq", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int rseq = (Integer) model.get("rseq");
		int tseq = (Integer) model.get("tseq");
		
		replyDao.delete(rseq);
		tutorialDao.replyDown(tseq);
		
		return "redirect:../tutorial/detail.do?tseq="+tseq+"&show=reply";
	}
}
