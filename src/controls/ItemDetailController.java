package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlItemDAO;
import dao.MySqlUserDAO;
import dto.ItemVO;
import dto.UserVO;

@Component("/pointshop/detail.do")
public class ItemDetailController implements Controller, DataBinding {
	private MySqlItemDAO itemDao;
	private MySqlUserDAO userDao;

	public ItemDetailController setItemDao(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;
		return this;
	}
	public ItemDetailController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	public Object[] getDataBinders() {
		return new Object[] {
				"iseq", Integer.class,
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("user");
		UserVO updateUser = userDao.selectOne(user.getNo());
		session.removeAttribute("user");
		session.setAttribute("user", updateUser);

		ItemVO item = itemDao.selectOne((Integer)model.get("iseq"));
		model.put("item", item);
		
		return "/pointshop/ItemDetailPage.jsp";
	}
}
