package controls;

import java.util.Map;

import controller.Component;
import controller.DataBinding;
import dao.MySqlItemDAO;

@Component("/admin/delitem.do")
public class AdminItemDeleteController implements Controller, DataBinding {
	private MySqlItemDAO itemDao;

	public void setCartDAO(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"iseq", Integer.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int iseq = (Integer) model.get("iseq");

		itemDao.delete(iseq);
		
		return "redirect:../admin/itemlist.do";
	}
}