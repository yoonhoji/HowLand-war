package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;

@Component("/auth/logout.do")
public class LogOutController implements Controller {
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		
		if (session != null) {
			session.invalidate();			
		}
		return "redirect:../auth/login.do";
	}
}