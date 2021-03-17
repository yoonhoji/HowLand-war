package controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import controller.Component;
import controller.DataBinding;
import dao.MySqlCartDAO;
import dto.UserVO;

@Component("/cart/delete.do")
public class CartDeleteController implements Controller, DataBinding {
	private MySqlCartDAO cartDao;

	public void setCartDAO(MySqlCartDAO cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"cseqs", String.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession) model.get("session");
		UserVO user = (UserVO)session.getAttribute("user");
		
		String cseqs = (String) model.get("cseqs");

		if (cseqs != null) {
			String[] cseq = cseqs.split(",");

			for (int i = 0; i < cseq.length; i++) {
				cartDao.deleteCart(Integer.parseInt(cseq[i]));
			}

			return "redirect:../cart/list.do?no="+user.getNo();
		}
		return "cseqs is null (CartDeleteController)";
	}
}