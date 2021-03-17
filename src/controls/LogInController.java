package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlUserDAO;
import dto.UserVO;

// Component 애너테이션은 컨테이너에서 Controller 객체를 생성하기 위해 붙이는 것이다.
@Component("/auth/login.do")
public class LogInController implements Controller, DataBinding {
	private MySqlUserDAO userDao;
	
	public LogInController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"loginInfo",
			UserVO.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		UserVO loginInfo = (UserVO) model.get("loginInfo");
		
		if (loginInfo.getId() == null) {
			return "/auth/LoginPage.jsp";
		} else {
			UserVO user = userDao.exist(
					loginInfo.getId(),
					loginInfo.getPw());
			
			if (user.getStatus().equals("Valid")) {
				HttpSession session = (HttpSession) model.get("session");
				session.setAttribute("user", user);
				
				if (user.getId().contentEquals("admin")) {
					return "redirect:../admin/AdminPage.jsp";
				} else {
					return "redirect:../tutorial/list.do?tag=all&align=tseq desc";
				}
				
			} else if (user.getStatus().contentEquals("InvID")){
				return "redirect:../auth/LoginPage.jsp?check=id";
			} else if (user.getStatus().contentEquals("Invalid")) {
				return "redirect:../auth/LoginPage.jsp?check=user";
			} else if (user.getStatus().contentEquals("InvPW")) {
				return "redirect:../auth/LoginPage.jsp?check=pw";
			} else {
				return "Status가 이상해";
			}
		}
	}
}
