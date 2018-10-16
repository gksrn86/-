package edu.smu.ss.ctr;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.smu.ss.dao.MemberDao;
import edu.smu.ss.vo.Member;

@WebServlet("/Member.do")
public class MemberServlet extends HttpServlet {
   private static final String String = null;
MemberDao dao = new MemberDao(); 

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String action = request.getParameter("action");
		System.out.println("Servlet:" + action);

		switch (action) {
		case "save":
			save(request, response);
			break;

		case "update":
			update(request, response);
			break;

		case "view": 
			view(request, response);
			break;

		case "delete": 
			delete(request, response);
			String next="index.jsp";
			HttpSession s = request.getSession(false);
			s.invalidate();
			response.sendRedirect(next);
			break;

		case "login":
			login(request, response);
			break;
		case "myPage":
			myPage(request, response);
			break;

		case "logout": 
			 next="index.jsp";
			 s = request.getSession(false);
			s.invalidate();
			request.getRequestDispatcher(next).forward(request, response);
			break;
		}
	}

	
	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		Member m = new Member(id, password, email);
		System.out.println(m);
		String next = "index.jsp";
		try {
			dao.add(m);
			request.setAttribute("msg", "저장완료");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());

		}
		request.getRequestDispatcher(next).forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String next="myPage.jsp";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password_confirmation = request.getParameter("password_confirmation");
		

        try {
        	Member m = (Member)request.getSession().getAttribute("member");
        	if(password.equals(password_confirmation)) {
        		request.setAttribute("msg", "비밀번호 변경완료");
        		System.out.println("if진입");
        		Member m2 = new Member(m.getId(), password, email);
				dao.update(m2);
				System.out.println("변경완료");
				HttpSession s = request.getSession();
				s.setAttribute("member", m2);
				
        	}else {
        		request.setAttribute("msg", "비밀번호가 다릅니다.");
				next = "myPage.jsp";
        	}
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
        response.sendRedirect("Member.do?action=myPage");
        //request.getRequestDispatcher(next).forward(request, response);
	}

	
	
	private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String nextPage = "myPage.jsp";

		try {
			Member result = dao.search(id);
			request.setAttribute("result", result);
		} catch (Exception e) {
			request.setAttribute("msg", "에러");
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}


	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		String nextPage="index.jsp";
		try {
			dao.delete(id);
			request.setAttribute("msg", "삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "삭제실패");
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("inputId");
		String pw = request.getParameter("inputPassword");
		String next = "index.jsp";

		try {
			String pw2 = dao.searchPassword(id);
			if (pw2.equals("")) {
				request.setAttribute("msg", "사용자 아이디가 없습니다.");
				next = "loginPage.jsp";
			} else if (pw2.equals(pw)) {
				request.setAttribute("msg", "로그인 되었습니다.");
				HttpSession s = request.getSession();
				s.setAttribute("id", id);
				s.setAttribute("member", dao.search(id));
			} else {
				request.setAttribute("msg", "비밀번호가 다릅니다.");
				next = "loginPage.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			next = "";
		}
		request.getRequestDispatcher(next).forward(request, response);
	}
	private void myPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "myPage.jsp";
		
		
		request.getRequestDispatcher(next).forward(request, response);
	}
}
