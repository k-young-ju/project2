package admin.notice;

import java.io.IOException;
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


@WebServlet("/admin/notice/list")
public class AdminNoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminNoticeList() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gongji = request.getParameter("gongji");
		
		String option = request.getParameter("option");
		if(request.getParameter("option") == null) {
			option="";
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		String search = request.getParameter("search");
		if(request.getParameter("search") == null) {
			search = "";
		}
		
		
		
		
		int pageSize = 10;
		int pageNum = 1; 
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		
		NoticeDAO dao = new NoticeDAO();
		
		int count= 0;
		int number = 0;
		if(gongji.equals("1")) {
		count = dao.noticeCount();
		number = count - (pageNum-1) * pageSize;
		}
		
		ArrayList<Notice> v = dao.listNotice(id,gongji,search,option,startRow,endRow);
		//request.setAttribute("cmt2", comment);

		request.setAttribute("LF", "\n");
		
		request.setAttribute("v", v);
		request.setAttribute("gongji",gongji);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp?gongji="+gongji);
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
