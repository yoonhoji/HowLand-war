package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;

@Component("/admin/status.do")
public class AdminUserStatusController implements Controller, DataBinding {
	private MySqlUserDAO userDao;
	
	public AdminUserStatusController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	public Object[] getDataBinders() {
		return new Object[] {
				"no", Integer.class,
				"status", String.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int no = (Integer)model.get("no");
		String status = (String)model.get("status");
		
		if (no > 0 && status != null) {
			userDao.status(no, status);

			return "redirect:../admin/userlist.do";
		}
		return "";
	}
}