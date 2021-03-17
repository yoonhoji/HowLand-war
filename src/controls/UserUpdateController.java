package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;
import dto.UserVO;

@Component("/user/update.do")
public class UserUpdateController implements Controller, DataBinding {
	private MySqlUserDAO userDao;

	public UserUpdateController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"no", Integer.class,
				"user", UserVO.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		UserVO user = (UserVO) model.get("user");
		
		if (user.getId() == null) {
			System.out.println("model.get(\"user\") == null");
			UserVO user2 = userDao.selectOne((Integer)model.get("no"));
			model.put("user2", user2);
			
			return "/user/EditPage.jsp";
		}else {
			System.out.println("model.get(\"user\") != null");
			userDao.update(user);
			
			return "redirect:../user/info.do?no="+user.getNo();
		}
	}
}
