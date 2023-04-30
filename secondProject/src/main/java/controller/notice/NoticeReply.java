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

import dao.NoticeDAO;
import dao.ReplyDAO;
import model.Notice;


@WebServlet("/notice/notice_reply")
public class NoticeReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NoticeReply() {
        super();
     
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fid = Integer.parseInt(request.getParameter("fid"));
		//System.out.println(fid);
		
		ReplyDAO dao = new ReplyDAO();
		Notice n = dao.selectReply(fid);
			
		response.setContentType("text/html; charset=utf-8");
		String comment="";
		if(n.getComment() != null) {
			comment = n.getComment().replaceAll("\n", "<br>");
		}
		
		 PrintWriter out = response.getWriter();
		 if(n.getSubject() == null && n.getComment() == null) {
			 out.print("아직 답변이 없습니다.");
		 }else {
			 out.print("<table height=20/><table width=1200 style='border:1px solid black'><tr><td style='font-weight:bold;color:red;border:1px solid black;font-size:20px'>");
			 out.print(n.getSubject());
			 out.print("</td></tr><tr height=20></tr>");
			 out.print("<tr><td>"+comment+"</td></tr></table>");
			//out.print(n.getSubject()+"<br><br>"+comment);
			
		 }
	}

}
