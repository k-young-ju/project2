package admin.item;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dao.MemberDAO;


@WebServlet("/admin/item/delete_select")
public class AdminDeleteSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminDeleteSelect() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		String uids =  request.getParameter("uids");
		//System.out.println("type="+type);
		//System.out.println("uids="+uids);
		String[] uid_ch = uids.split(",");
	
		for(int i=0 ; i<uid_ch.length;i++) {
			
			ItemDAO dao = new ItemDAO();
			dao.deleteItem(uid_ch[i]);
			//System.out.println(uid_ch[i]);
				
		}
		PrintWriter out = response.getWriter();
		out.print(type);
	}

}
