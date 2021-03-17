package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlReplyDAO;
import dao.MySqlTutorialDAO;
import dto.ReplyVO;
import dto.UserVO;

@Component("/reply/insert.do")
public class ReplyInsertController implements Controller, DataBinding {
	private MySqlReplyDAO replyDao;
	private MySqlTutorialDAO tutorialDao;
	
	public ReplyInsertController setReplyDao(MySqlReplyDAO replyDao) {
		this.replyDao = replyDao;
		return this;
	}
	public ReplyInsertController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"tseq", Integer.class,
				"content", String.class
		};
	}
	
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO writer = (UserVO) session.getAttribute("user");
		int tseq = (Integer) model.get("tseq");
		String content = (String) model.get("content");
		
		replyDao.insert(new ReplyVO()
				.setTseq(tseq)
				.setWriter(writer.getName())
				.setNo(writer.getNo())
				.setMastery(writer.getMastery())
				.setContent(content)
				);
		
		tutorialDao.replyUp(tseq);
		
		return "redirect:../tutorial/detail.do?tseq="+tseq+"&show=reply";
	}
}
