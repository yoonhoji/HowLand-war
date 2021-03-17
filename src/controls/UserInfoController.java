package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;
import dto.UserVO;

@Component("/user/info.do")
public class UserInfoController implements Controller, DataBinding {
	private MySqlUserDAO userDao;

	public UserInfoController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"no", Integer.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {

		UserVO user = userDao.selectOne((Integer)model.get("no"));
		model.put("user", user);
		
		return "/user/InfoPage.jsp";
	}
}
