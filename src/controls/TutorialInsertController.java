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
import controller.DataBinding;
import dao.MySqlTutorialDAO;
import dao.MySqlUserDAO;
import dto.TutorialVO;
import dto.UserVO;

@Component("/tutorial/insert.do")
public class TutorialInsertController implements Controller, DataBinding {
	private MySqlTutorialDAO tutorialDao;
	private MySqlUserDAO userDao;
	
	public TutorialInsertController setTutorialDao(MySqlTutorialDAO tutorialDao) {
		this.tutorialDao = tutorialDao;
		return this;
	}
	public TutorialInsertController setUserDao(MySqlUserDAO userDao) {
		this.userDao = userDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"tutorial", TutorialVO.class
		};
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpServletRequest request = (HttpServletRequest)model.get("request");
		ServletContext context = (ServletContext) model.get("context");
		String savePath = "source/tutorial";
		int uploadFileSizeLimit = 10 * 1024 * 1024;
		String encType = "UTF-8";
		System.out.println(request);
		System.out.println(context);
		String uploadFilePath = context.getRealPath(savePath);
		
		
		try {
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
			System.out.println("mainimg: "+fileNames[3]);
			System.out.println("img1: "+fileNames[4]);
			System.out.println("img2: "+fileNames[2]);
			System.out.println("img3: "+fileNames[1]);
			System.out.println("img4: "+fileNames[0]);
		
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		
			HttpSession session = (HttpSession) model.get("session");
			UserVO user = (UserVO) session.getAttribute("user");
			
			TutorialVO tutorial = new TutorialVO()
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
			
			tutorialDao.insert(tutorial);
			userDao.postUp(user.getNo());
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		int maxTseq = tutorialDao.maxTseq();
		return "redirect:../tutorial/detail.do?tseq="+maxTseq;
	}
	
}
