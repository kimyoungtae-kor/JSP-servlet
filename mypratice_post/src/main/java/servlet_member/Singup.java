package servlet_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;
import vo.Member.M;

@WebServlet("/singup")
public class Singup extends HttpServlet{
	
	private MemberService memberService = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/jsp/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String road_addr = req.getParameter("roadAddr");
		String detail_addr = req.getParameter("detailAddr");
		
		Member member = Member.builder().id(id)
				.pw(pwd)
				.name(name)
				.email(email)
				.road_addr(road_addr)
				.detail_addr(detail_addr)
				.build();
		System.out.println(member);
		memberService.register(member);
	}
	
}
