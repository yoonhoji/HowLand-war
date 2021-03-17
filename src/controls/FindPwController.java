package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;

@Component("/user/findpw.do")
public class FindPwController implements Controller, DataBinding {
	private MySqlUserDAO userDao;
	
	public FindPwController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
			"name", String.class,
			"id", String.class
		};
	}
	
	public String execute(Map<String, Object> model) throws Exception {
		String name = (String) model.get("name");
		String id = (String) model.get("id");
		
		if (name != null && id != null) {
			String pw = userDao.findPw(name, id);
			
			if (pw != null && pw != "") {
				model.put("pw", pw);
				return "/user/PwShowPage.jsp";
			} else {
				return "redirect:../user/FindPwPage.jsp?pw=no";
			}
		} else {
			return "name id null";
		}
	}
}
