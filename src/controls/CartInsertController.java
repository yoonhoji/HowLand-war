package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlCartDAO;
import dto.CartVO;
import dto.UserVO;

@Component("/cart/insert.do")
public class CartInsertController implements Controller, DataBinding {	
	private MySqlCartDAO cartDao;
	
	public CartInsertController setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
		return this;
	}

	public Object[] getDataBinders() {
		return new Object[] { 
				"iseq", Integer.class,
				"img", String.class,
				"quantity", Integer.class
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
				cartDao.insertCart(cart);
				return "redirect:../pointshop/detail.do?iseq="+cart.getIseq();
			} else {
				return "iseq or quantity 값 확인해";
			}		
		} else {
			return "redirect:../auth/LoginPage.jsp";
		}
	}
}