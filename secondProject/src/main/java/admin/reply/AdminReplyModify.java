package admin.reply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.ReplyDAO;
import model.Notice;


@WebServlet("/admin/reply/modify")
public class AdminReplyModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
      public AdminReplyModify() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		NoticeDAO dao = new NoticeDAO();
		Notice n =dao.viewNotice(uid);
		
		
		ReplyDAO dao1 = new ReplyDAO();
		Notice n2 = dao1.replyModify(uid);
		
		request.setAttribute("LF", "\n");
		request.setAttribute("n", n);
		request.setAttribute("n2", n2);
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		String gongji =  request.getParameter("gongji");
		String subject = request.getParameter("subject");
		String comment = request.getParameter("comment");
		//System.out.println("제목은:"+subject);
		//System.out.println("내용은:"+comment);
		//System.out.println("공지는:"+gongji);
		ReplyDAO dao = new ReplyDAO();
		dao.updateReplyModify(uid,subject,comment);
		
		response.sendRedirect("view?uid="+uid);
		
	}

}
