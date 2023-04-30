package admin.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.ReplyDAO;


@WebServlet("/admin/reply/delete")
public class AdminReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AdminReplyDelete() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		if(uid == null) {
			uid = "";
		}
		String gongji=request.getParameter("gongji");
		
		ReplyDAO dao = new ReplyDAO();
		String uids = request.getParameter("uids");
		if(uids != null) {
		String[] uidss = uids.split(",");
			for(int i=0;i<uidss.length;i++) {
				dao.deleteAdminReplyList2(uidss[i]);
				System.out.println(uidss[i]);
			}
		}
		if(gongji.equals("2")){	 
		dao.deleteAdminReplyList(uid);
		}
		response.sendRedirect("list?gongji="+gongji);
	}

	
	

}
