package controls;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Component;
import dao.MySqlTutorialDAO;
import dto.TutorialVO;
import dto.UserVO;

@Component("/tutorial/update.do")
public class TutorialUpdateController implements Controller {
	private MySqlTutorialDAO tutorialDao;

	public TutorialUpdateController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
			
		try {
			
			HttpServletRequest request = (HttpServletRequest)model.get("request");
			ServletContext context = (ServletContext) model.get("context");
			String savePath = "source/tutorial";
			int uploadFileSizeLimit = 10 * 1024 * 1024;
			String encType = "UTF-8";
			System.out.println(request);
			System.out.println(context);
			String uploadFilePath = context.getRealPath(savePath);
			
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String[] fileNames = new String[5];
			String file = null;
			int loop = 0;
			
			while (files.hasMoreElements()) {
				file = (String)files.nextElement();
				System.out.println(loop+"번째 파일: "+file);
				fileNames[loop] = multi.getFilesystemName(file);
				loop++;
			}
			
			if (fileNames[3] == null || fileNames[3].contentEquals("")) {
				fileNames[3] = multi.getParameter("mainimage");
			}
			if (fileNames[4] == null || fileNames[4].contentEquals("")) {
				fileNames[4] = multi.getParameter("image1");
			}
			if (fileNames[2] == null || fileNames[2].contentEquals("")) {
				fileNames[2] = multi.getParameter("image2");
			}
			if (fileNames[1] == null || fileNames[1].contentEquals("")) {
				fileNames[1] = multi.getParameter("image3");
			}
			if (fileNames[0] == null || fileNames[0].contentEquals("")) {
				fileNames[0] = multi.getParameter("image4");
			}
		
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		
			HttpSession session = (HttpSession) model.get("session");
			UserVO user = (UserVO) session.getAttribute("user");
			
			TutorialVO tutorial = new TutorialVO()
					.setTseq(Integer.parseInt(multi.getParameter("tseq")))
					.setTag(multi.getParameter("tag"))
					.setTitle(multi.getParameter("title"))
					.setDescription(multi.getParameter("description"))
					.setWriter(user.getName())
					.setNo(user.getNo())
					.setMastery(user.getMastery())
					.setDifficulty(Integer.parseInt(multi.getParameter("difficulty")))
					.setTime(Integer.parseInt(multi.getParameter("time")))
					.setMainimg(fileNames[3])
					.setImg1(fileNames[4])
					.setContent1(multi.getParameter("content1"))
					.setImg2(fileNames[2])
					.setContent2(multi.getParameter("content2"))
					.setImg3(fileNames[1])
					.setContent3(multi.getParameter("content3"))
					.setImg4(fileNames[0])
					.setContent4(multi.getParameter("content4"));
			
			tutorialDao.update(tutorial);
				
			return "redirect:../tutorial/detail.do?tseq="+tutorial.getTseq();
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
