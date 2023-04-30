package controller.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;


@WebServlet("/cart/jjimDelete")
public class JjimDeleteSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public JjimDeleteSelect() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uids = request.getParameter("uids");
		if(request.getParameter("uids") == null) {
			uids="";
		}
		
		int uid = 0;
		
		if(request.getParameter("uid") != null) {
			uid =Integer.parseInt(request.getParameter("uid"));
		}
		System.out.println(uid);
		String option= request.getParameter("option");
		
		//System.out.println(uid);
		//System.out.println(uids);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		CartDAO dao = new CartDAO();
		
		String[] uid_ch = uids.split(",");
		if(uids != null) {
			for(int i=0;i<uid_ch.length;i++) {
				dao.deleteJjimSelect(uid_ch[i], id);
			}
		}
		if(uid != 0) {
			dao.deleteJjim(uid, id);
		}
		response.sendRedirect("jjim?option="+option);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
