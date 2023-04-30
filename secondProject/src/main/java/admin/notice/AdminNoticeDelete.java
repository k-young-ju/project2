package admin.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import dao.NoticeDAO;
import model.Order;


@WebServlet("/admin/notice/delete")
public class AdminNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminNoticeDelete() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		System.out.println(uid);
		String gongji = request.getParameter("gongji");
		System.out.println(gongji);
		
		String[] uids = uid.split(",");
		
		NoticeDAO dao = new NoticeDAO();
		for(int i=0;i<uids.length;i++) {
			dao.deleteNotice2(uids[i]);
		}
		
		
		
		response.sendRedirect("list?gongji="+gongji);
	}

	
}
