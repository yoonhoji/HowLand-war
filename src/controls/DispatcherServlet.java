package controls;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ApplicationContext;
import controller.ContextLoaderListener;
import controller.DataBinding;
import controller.ServletRequestDataBinder;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
       
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	String servletPath = request.getServletPath();
    	System.out.println();
    	System.out.println();
    	System.out.println("********************************************************");
    	System.out.println("********************************************************");
    	System.out.println("-------------11111 요청이 프론트 컨트롤러에 들어옴--------------");
    	
    	try {
//			ServletContext sc = this.getServletContext();
    		ApplicationContext ctx = ContextLoaderListener.getApplicationContext();
			HashMap<String, Object> model = new HashMap<String, Object>();
			model.put("session", request.getSession());
			model.put("request", request);
			model.put("context", getServletContext());
//			model.put("url", request.getHeader("referer"));
//			Controller controller = (Controller) sc.getAttribute(servletPath);
			Controller controller = (Controller) ctx.getBean(servletPath);
			
//			if ("/member/add.do".contentEquals(servletPath)) {
//				if (request.getParameter("email") != null) {
//					model.put("member", new Member2()
//							.setEmail(request.getParameter("email"))
//							.setPassword(request.getParameter("password"))
//							.setName(request.getParameter("name")));
//				}
//				
//			}else if ("/member/update.do".contentEquals(servletPath)) {
//				if (request.getParameter("email") != null) {
//					model.put("member", new Member2()
////							.setNo(Integer.parseInt(request.getParameter("no")))
//							.setEmail(request.getParameter("email"))
//							.setPassword(request.getParameter("password"))
//							.setName(request.getParameter("name")));
//				} else {
//					model.put("no", new Integer(request.getParameter("no")));
//				}
//				
//			}else if ("/member/delete.do".contentEquals(servletPath)) {
//				model.put("no", new Integer(request.getParameter("no")));
//				
//			}else if ("/auth/login.do".contentEquals(servletPath)) {
//				if (request.getParameter("email") != null) {
//					model.put("loginInfo", new Member2()
//							.setEmail(request.getParameter("email"))
//							.setPassword(request.getParameter("password")));
//				}
//			}else if ("/auth/logout.do".contentEquals(servletPath)) {
//				if (request.getSession() != null) {
//					model.put("session", request.getSession());
//				}
//			}
			
			if (controller instanceof DataBinding) {
				prepareRequestData(request, model, (DataBinding)controller);
			}
			String viewUrl = controller.execute(model);
			
			for (String key : model.keySet()) {
				request.setAttribute(key, model.get(key));
			}
			
			if (viewUrl.startsWith("redirect:")) {
				response.sendRedirect(viewUrl.substring(9));
				return;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(viewUrl);
				rd.include(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void prepareRequestData
    	(HttpServletRequest request, 
    		HashMap<String, Object> model, 
    			DataBinding dataBinding) throws Exception {
    	Object[] dataBinders = dataBinding.getDataBinders();
    	System.out.println("---------------22222 getDataBinders();----------------");
    	String dataName = null;
    	Class<?> dataType = null;
    	Object dataObj = null;
    	System.out.println("for문 시작 : " + dataBinders.length);
    	
    	for (int i = 0; i < dataBinders.length; i += 2) {
    		dataName = (String) dataBinders[i];
    		dataType = (Class<?>) dataBinders[i + 1];
    		System.out.println("------------33333 ServletRequestDataBinder.bind("+request+", "+dataType+", "+dataName+");------------");
    		dataObj = ServletRequestDataBinder.bind(request, dataType, dataName);
    		model.put(dataName, dataObj);
    		System.out.println("------------55555 model.put("+dataName+", "+dataObj+");------------");
    	}
    }

}
