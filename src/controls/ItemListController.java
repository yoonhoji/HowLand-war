package controls;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlItemDAO;
import dao.MySqlUserDAO;
import dto.ItemVO;
import dto.UserVO;

@Component("/pointshop/list.do")
public class ItemListController implements Controller, DataBinding {
	private MySqlItemDAO itemDao;
	private MySqlUserDAO userDao;
	
	public ItemListController setItemDAO(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;	
		return this;
	}
	public ItemListController setUserDAO(MySqlUserDAO userDao) {
		this.userDao = userDao;	
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"ctg", String.class,
			"align", String.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO) session.getAttribute("user");
		UserVO updateUser = userDao.selectOne(user.getNo());
		session.removeAttribute("user");
		session.setAttribute("user", updateUser);
		
		if (model.get("ctg") != null && model.get("align") != null) {
			ArrayList<ItemVO> items = itemDao.selectList((String)model.get("ctg"), (String)model.get("align"));
			model.put("items", items);
			
			return "/pointshop/ShopPage.jsp";
		} else {
			return "model.get(\"ctg\") is null";
		}
	}
}
