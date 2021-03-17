package controls;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import dao.MySqlCartDAO;
import dto.CartVO;
import dto.UserVO;

@Component("/cart/list.do")
public class CartListController implements Controller {
	private MySqlCartDAO cartDao;
	
	public void setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO)session.getAttribute("user");
		
		if (user.getNo() > 0) {
			ArrayList<CartVO> cartList = cartDao.selectCart(user.getNo(), "1");
			model.put("cartList", cartList);
			
			int sum = 0;
			for(CartVO cart : cartList) {
				sum += cart.getPrice() * cart.getQuantity();
			}
			model.put("sum", sum);
			
			return "/cart/CartListPage.jsp";
		} else {
			return "redirect:../auth/LoginPage.jsp";
		}
	}
}
