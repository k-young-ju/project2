package admin.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import model.Notice;


@WebServlet("/admin/notice/modify")
public class AdminNoticeModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminNoticeModify() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		String gongji=request.getParameter("gongji");
		if(request.getParameter("gongji") == null) {
			gongji ="";
		}
		
		NoticeDAO dao = new NoticeDAO();
		Notice n = dao.oneNotice(uid);
		
		request.setAttribute("n", n);
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		
		Notice n = new Notice();
		String gongji = request.getParameter("gongji");
		System.out.println(gongji);
		n.setSubject(request.getParameter("subject"));
		n.setComment(request.getParameter("comment"));
		
		NoticeDAO dao = new NoticeDAO();
		
		dao.updateNotice(uid,gongji,n);
		
		response.sendRedirect("list?gongji="+gongji);
		
	}

}
