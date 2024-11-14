package utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;
import vo.Member;

public class Commons extends HttpServlet{
	private PostService service = new PostServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pnoStr = req.getParameter("pno");
		Object memberObj = req.getSession().getAttribute("member");
		
		if(pnoStr == null || memberObj == null) {
			printMsg("비정상적인 접근입니다","list",resp);
			return;
		}
		Long pno = Long.valueOf(pnoStr);
		Member m = (Member) memberObj;
		if(!m.getId().equals(service.findBy(pno).getWriter()) ) {
			printMsg("본인이 작성한 글만 삭제할 수 있습니다", "list", resp);
			return;
		}
		service.remove(pno);
		
		resp.sendRedirect("list");
		//오류메시지
		//이동할페이지
	}
	
	public static final String UPLOAD_PATH = "c:/upload";
	
	public static void printMsg(String msg, String url, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<script>");
		pw.printf("alert('%s'); %n", msg);
		
		if(url == null) {
			pw.printf("history.back();");
		}else {
			pw.printf("location.href = '%s';%n",url);
		}
		pw.println("</script>");
		
		pw.printf("location.href = '%s';%n",url);
		pw.println("</script>");
	}
}
