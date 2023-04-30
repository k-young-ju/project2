package admin.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import dao.NoticeDAO;
import model.Notice;


@WebServlet("/admin/notice/view")
public class AdminNoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminNoticeView() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		
						
		NoticeDAO dao =  new NoticeDAO();
		Notice n = dao.viewNotice(uid);
		
		
		Notice n2 = dao.frontWrite(uid);
		
		
		Notice n3 = dao.nextWrite(uid);
		
		String comment = n.getComment();
		
		
		//comment 개행처리
		request.setAttribute("cmt2", comment);

		request.setAttribute("LF", "\n");
		request.setAttribute("n", n);
		request.setAttribute("n2", n2);
		request.setAttribute("n3", n3);
		
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}

	
	

}
