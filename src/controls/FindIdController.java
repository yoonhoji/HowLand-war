package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;

@Component("/user/findid.do")
public class FindIdController implements Controller, DataBinding {
	private MySqlUserDAO userDao;
	
	public FindIdController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
			"name", String.class,
			"phone", String.class
		};
	}
	
	public String execute(Map<String, Object> model) throws Exception {
		String name = (String) model.get("name");
		String phone = (String) model.get("phone");
		
		if (name != null && phone != null) {
			String id = userDao.findId(name, phone);
			
			if (id != null && id != "") {
				model.put("id", id);
				return "/user/IdShowPage.jsp";
			} else {
				return "redirect:../user/FindIdPage.jsp?id=no";
			}
		} else {
			return "name phone null";
		}
	}
}
