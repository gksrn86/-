package edu.smu.ss.ctr;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.smu.ss.dao.BoardDao;
import edu.smu.ss.vo.Board;

@WebServlet("/Board.do")
public class BoardServlet extends HttpServlet {
	 
		BoardDao dao = new BoardDao();
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
		}	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			//1.요청 분석
			String action = request.getParameter("action");
			System.out.println("Servlet"+action);
			switch(action) {
			case "save":
				save(request, response);
				break;
			case "list":
				list(request, response);
				break;
			case "search":
				search(request, response);
				break;
			case "view":
				view(request, response);
				break;
			case "delete" :
				delete(request, response);
				break;
			case "updateview":
				updateview(request, response);
				break;
			case "update":
				update(request, response);
				break;
				
			}//end switch
		}//end post
		protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			String write=request.getParameter("write");
			String title=request.getParameter("title");
			String cont=request.getParameter("cont");
			Board b = new Board();
			b.setWrite(write);
			b.setTitle(title);
			b.setCont(cont);
			String next="BoardResult.jsp";
			try{
				dao.save(b);
				request.setAttribute("msg", "게시물 등록 완료");
			}catch (SQLException e) {
				request.setAttribute("msg", "게시물 등록 오류"+e.getMessage());			
			}
			request.getRequestDispatcher(next).forward(request, response);
		}
		
		protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ArrayList<Board> results;
			String next="Board.jsp";
					try {
						results =dao.search();
						request.setAttribute("results", results);
					}catch (SQLException e) {
						next="BoardError.jsp";
						request.setAttribute("msg", "게시물 목록 오류"+e.getMessage());
					}
			request.getRequestDispatcher(next).forward(request, response);
		}
		protected void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String num = request.getParameter("num");    
			    String next="BoardView.jsp";
			    try {
			    	dao.updateRate(Integer.parseInt(num));
					Board b = dao.search(Integer.parseInt(num));
					request.setAttribute("write", dao.searchWrite(num));
					request.setAttribute("result", b);
				} catch (Exception e) {
					next ="BoardError.jsp";
					request.setAttribute("result", "게시물 조회 오류:"+e.getMessage());				
				} 
			    request.getRequestDispatcher(next).forward(request, response);
		}
		protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String num = request.getParameter("num");
			String next = "BoardResult.jsp";
			try {
				dao.delete(Integer.parseInt(num));
				request.setAttribute("result","게시물 삭제 완료");
			} catch (SQLException e) {
				next="BoardError.jsp";
				request.setAttribute("result","게시물 삭제 오류"+e.getMessage());
				
			}
			request.getRequestDispatcher(next).forward(request, response);
		}
		protected void updateview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String num=request.getParameter("num");
			    String next="BoardUpdate.jsp";
			    try {
					Board b = dao.search(Integer.parseInt(num));
					request.setAttribute("result", b);
				} catch (Exception e) {
					next ="BoardError.jsp";
					request.setAttribute("result", "게시물 수정 오류:"+e.getMessage());							
				} 
			    request.getRequestDispatcher(next).forward(request, response);
		}
		protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int num=Integer.parseInt(request.getParameter("num"));
			String title=request.getParameter("title");
			String cont=request.getParameter("cont");
			String next = "BoardResult.jsp";
			Board b=new Board(num,title,cont);
			
			try {
				dao.update(b);
				request.setAttribute("msg", "게시물 수정 완료");
			} catch (SQLException e) {
				request.setAttribute("msg", "게시물 수정 오류"+e.getMessage());
				next="BoardError.jsp";
			}
			  request.getRequestDispatcher(next).forward(request, response);
		}
		protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      
		      ArrayList<Board> result;
		      String nextPage="Board.jsp";

		      try {
		         result = dao.list();
		         request.setAttribute("resultList", result);      
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		         request.setAttribute("msg", e);
		         nextPage="BoardError.jsp";
		      }
		       request.getRequestDispatcher(nextPage).forward(request, response);
		      }
}
