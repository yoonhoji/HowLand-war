package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;
import dto.UserVO;

@Component("/user/insert.do")
public class UserInsertController implements Controller, DataBinding {
	
	private MySqlUserDAO userDao;
	
	public UserInsertController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	public Object[] getDataBinders() {
		return new Object[] {
			"user", UserVO.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		UserVO user = (UserVO) model.get("user");
		System.out.println(user.getId());
		
		if (user.getId() != null) {
			userDao.insert(user);
			
			UserVO rcmdUser = userDao.rcmdUser(user.getRecommend());
			UserVO newUser = userDao.newUser();
			
			if (rcmdUser != null) {
				userDao.rcmdPoint(rcmdUser, newUser);
			}
			return "redirect:../auth/login.do";
			
		} else {
			return "redirect:../user/JoinPage.jsp";
		}		
	}
}
