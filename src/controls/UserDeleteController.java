package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;

@Component("/user/delete.do")
public class UserDeleteController implements Controller, DataBinding {
	private MySqlUserDAO userDao;
	
	public UserDeleteController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	public Object[] getDataBinders() {
		return new Object[] {
				"no", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("DeleteController : "+model.get("no"));
		int no = (Integer)model.get("no");
		
		if (no > 0) {
			int result = userDao.status(no, "Invalid");
			if (result > -1) {
				HttpSession session = (HttpSession) model.get("session");
				
				if (session != null) {
					session.invalidate();			
				}
				return "redirect:../tutorial/list.do?tag=all&align=tseq desc";
			}else {
				System.out.println("딜리트 실패");
			}
		}
		return "";
	}
}