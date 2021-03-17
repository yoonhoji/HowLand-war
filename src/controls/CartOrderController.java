package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlCartDAO;
import dao.MySqlItemDAO;
import dao.MySqlUserDAO;
import dto.CartVO;
import dto.UserVO;

@Component("/cart/order.do")
public class CartOrderController implements Controller, DataBinding{
	private MySqlCartDAO cartDao;
	private MySqlUserDAO userDao;
	private MySqlItemDAO itemDao;
	
	public CartOrderController setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
		return this;
	}
	public CartOrderController setUserDAO(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	public CartOrderController setItemDAO(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"cseqs", String.class,
			"checkSum", Integer.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO)session.getAttribute("user");
		
		String cseqs = (String) model.get("cseqs");
		int sum = (Integer) model.get("checkSum");
		
		if (cseqs != null && sum > 0) {
			userDao.orderCart(user.getNo(), sum);
			
			String[] cseq = cseqs.split(",");

			for (int i = 0; i < cseq.length; i++) {
				cartDao.orderCart(Integer.parseInt(cseq[i]));
				CartVO cart = cartDao.forBuyUp(Integer.parseInt(cseq[i]));
				itemDao.buyUp(cart.getIseq(), cart.getQuantity());
			}

			return "redirect:../cart/list.do?no="+user.getNo();
		}
		return "cseqs or sum 을 확인해";
	}
}
