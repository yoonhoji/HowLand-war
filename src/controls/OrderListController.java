package controls;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import dao.MySqlCartDAO;
import dto.CartVO;
import dto.UserVO;

@Component("/cart/orderlist.do")
public class OrderListController implements Controller {
	private MySqlCartDAO cartDao;
	
	public void setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO)session.getAttribute("user");
		
		if (user.getNo() > 0) {
			ArrayList<CartVO> orderList = cartDao.selectCart(user.getNo(), "2");
			model.put("orderList", orderList);
			
			return "/cart/OrderListPage.jsp";
		} else {
			return "redirect:../auth/LoginPage.jsp";
		}
	}
}
