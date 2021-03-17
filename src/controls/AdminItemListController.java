package controls;

import java.util.ArrayList;
import java.util.Map;

import controller.Component;
import dao.MySqlItemDAO;
import dto.ItemVO;

@Component("/admin/itemlist.do")
public class AdminItemListController implements Controller {
	private MySqlItemDAO itemDao;
	
	public AdminItemListController setItemDAO(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;	
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {	
		ArrayList<ItemVO> items = itemDao.selectList("", "iseq");
		model.put("items", items);
		
		return "/admin/AdminItemListPage.jsp";
	}
}
