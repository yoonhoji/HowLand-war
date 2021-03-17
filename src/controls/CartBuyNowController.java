package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlCartDAO;
import dao.MySqlUserDAO;
import dto.CartVO;
import dto.UserVO;

@Component("/cart/buynow.do")
public class CartBuyNowController implements Controller, DataBinding {	
	private MySqlCartDAO cartDao;
	private MySqlUserDAO userDao;
	
	public CartBuyNowController setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
		return this;
	}
	public CartBuyNowController setUserDAO(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}

	public Object[] getDataBinders() {
		return new Object[] { 
				"iseq", Integer.class,
				"img", String.class,
				"quantity", Integer.class,
				"price", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO)session.getAttribute("user");
		
		if (user.getId() != null) {
			
			CartVO cart = new CartVO()
			.setNo(user.getNo())
			.setIseq((Integer) model.get("iseq"))
			.setImg((String) model.get("img"))
			.setQuantity((Integer) model.get("quantity"));
			
			if (cart.getIseq() > 0 && cart.getImg() != null && cart.getQuantity() > 0) {
				userDao.orderCart(user.getNo(), (Integer) model.get("price"));
				cartDao.buyNow(cart);
				return "redirect:../pointshop/detail.do?iseq="+cart.getIseq();
			} else {
				return "iseq or img or quantity or price 값 확인해";
			}		
		} else {
			return "redirect:../auth/LoginPage.jsp";
		}
	}
}