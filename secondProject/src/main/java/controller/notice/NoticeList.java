package controller.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import model.Notice;


@WebServlet("/notice/list")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NoticeList() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pageSize = 10; //한 페이지당 출력할 게시물 수

		
		int pageNum = 1; //현재 페이지 값
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		String gongji = request.getParameter("gongji");
		
		String option = request.getParameter("option");
		if(request.getParameter("option") ==null) {
			option="";
		}
		//System.out.println(option);
		String search = request.getParameter("search");
		if(request.getParameter("search") == null) {
			search = "";
		}

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		response.setContentType("text/html; charset=utf-8");
						
		if(id == null && gongji.equals("2")) { //문의 게시판
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('로그인을 해주세요');");
			out.print("location.href='/member/login';");
			out.print("</script>");
				
		}else { //공지사항, 자주 묻는 질문,로그인 후 문의게시판
				NoticeDAO dao = new NoticeDAO();
				int count = dao.noticeCount(gongji,id,search); 
				
				int number = count - (pageNum-1) * pageSize;
				ArrayList<Notice> v = dao.listNotice(id,gongji,search,option,startRow,endRow);
				
				ArrayList<Notice> v2 = dao.replyNotice(id,gongji);		
				//System.out.println(count);
				
				request.setAttribute("search", search);
				request.setAttribute("LF", "\n");
				request.setAttribute("v", v);
				request.setAttribute("v2", v2);
				request.setAttribute("gongji",gongji);
				request.setAttribute("option", option);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("number", number);
				request.setAttribute("count", count);		
				RequestDispatcher dis = request.getRequestDispatcher("list.jsp?gongji="+gongji);
				dis.forward(request, response);
		}				
	}		
		
}

	
	


