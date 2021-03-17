package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;

@Component("/user/idcheck.do")
public class UserIdCheckController implements Controller, DataBinding {

	private MySqlUserDAO userDao;
	
	public UserIdCheckController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	public Object[] getDataBinders() {
		return new Object[] {
			"id", String.class,
			"for", String.class
		};
	}
	
	public String execute(Map<String, Object> model) throws Exception {
		int idc;
		
		if (model.get("id") != null) {
			idc = userDao.idCheck((String)model.get("id"), (String) model.get("for"));
		} else {
			return "id is null";
		}
		
		if (((String) model.get("for")).equals("insert")) {
			if (idc == 1) {
				return "redirect:../user/IdOk.jsp";
			} else {
				return "redirect:../user/IdNo.jsp";
			}
		} else if (((String) model.get("for")).equals("rcmd")) {
			if (idc == 1) {
				return "redirect:../user/RcmdNo.jsp";
			} else {
				return "redirect:../user/RcmdOk.jsp";
			}
		}
		return "";
	}
}
