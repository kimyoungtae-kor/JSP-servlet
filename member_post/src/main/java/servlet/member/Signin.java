package servlet.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/signin")
public class Signin extends HttpServlet{
    private MemberService service = new MemberServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id =    req.getParameter("id");
        String pw = req.getParameter("pw");
        String save = null;

        System.out.println(id);
        System.out.println(pw);
//        Member member = new Member();
//        member.setId(id);
        if(service.login(id, pw)) {
            save = req.getParameter("remember-id");
    		Cookie cookie = new Cookie("save", id);
        	//로그인 성공
        	if("yes".equals(save)) {

        		cookie.setMaxAge(60*60*24);
        		resp.addCookie(cookie);
        		System.out.println(save);
        	}else {
        		//아이디 기억안할때 처리할 일
        		Cookie[] cookies = req.getCookies();
        		for(Cookie c : cookies) {
        			if(c.getName().equals("remember-id")) {
        				c.setMaxAge(0);
        				break;
        			}
        		}
        	}
        	//세션 생성
        	HttpSession session = req.getSession();
        	session.setAttribute("member", service.findBy(id));
        	
        	
        	//url 파라미터 여부에 따른 리디렉션 페이지 지정
        	String redirectURL = req.getContextPath()+"/index";
        	String url = req.getParameter("url");
        	if(url != null && !url.equals("")) {
        		redirectURL = URLDecoder.decode(url,"utf-8") ;
        	}
            resp.sendRedirect(redirectURL);
            
            
            
            
            
        }else {
        	
        	resp.sendRedirect("login?msg=fail");
        }

	}
	
}
