package admin.reply;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.ReplyDAO;
import model.Notice;


@WebServlet("/admin/reply/list")
public class AdminReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminReplyList() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReplyDAO dao = new ReplyDAO();
		
		
		int pageSize = 10; //한 페이지당 출력할 게시물 수
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		 
		int count = dao.replyCount();
		int number = count - (pageNum-1) * pageSize;
		int startRow = (pageNum -1) * pageSize;
		int endRow = pageSize;
		
//		System.out.println(count);
//		System.out.println(number);
//		System.out.println(startRow);
//		System.out.println(endRow);
		
		ArrayList<Notice> v =  dao.replyList(startRow,endRow);
//		System.out.println(v);
//		
		request.setAttribute("v", v);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		
		RequestDispatcher dis =  request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
