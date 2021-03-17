package controls;

import java.util.List;
import java.util.Map;

import controller.Component;
import dao.MySqlUserDAO;
import dto.UserVO;

@Component("/admin/userlist.do")
public class AdminUserListController implements Controller {
	private MySqlUserDAO userDao;
	
	public AdminUserListController setUserDAO(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		List<UserVO> userList = userDao.selectList();
		model.put("userList", userList);
			
		return "/admin/AdminUserListPage.jsp";
	}
}
