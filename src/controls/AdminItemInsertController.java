package controls;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Component;
import dao.MySqlItemDAO;
import dto.ItemVO;

@Component("/admin/insertitem.do")
public class AdminItemInsertController implements Controller {
	private MySqlItemDAO itemDao;
	
	public AdminItemInsertController setItemDao(MySqlItemDAO itemDao) {
		this.itemDao = itemDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpServletRequest request = (HttpServletRequest)model.get("request");
		ServletContext context = (ServletContext) model.get("context");
		String savePath = "source/pointshop";
		int uploadFileSizeLimit = 10 * 1024 * 1024;
		String encType = "UTF-8";
		String uploadFilePath = context.getRealPath(savePath);
		
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String file = (String)files.nextElement();
			String itemimg = multi.getFilesystemName(file);
		
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			
			ItemVO item = new ItemVO()
					.setCtg(multi.getParameter("ctg"))
					.setName(multi.getParameter("name"))
					.setImg(itemimg)
					.setPrice(Integer.parseInt(multi.getParameter("price")))
					.setDescription(multi.getParameter("description"));
			
			itemDao.insert(item);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:../admin/itemlist.do";
	}
	
}
