package controller.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ItemDAO;
import model.Item;


@WebServlet("/board/jjim_insert")
public class JjimInsertDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public JjimInsertDelete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String path = request.getParameter("path");
		String list_option =request.getParameter("list_option");
		String kind_big= request.getParameter("kind_big");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		CartDAO daoc = new CartDAO();
		ItemDAO dao =  new ItemDAO();
		
		int num = daoc.jjimCount(uid,id);
		
		Item i = dao.oneItem(uid);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(num ==0) {
			daoc.insertJjim(i,id);
			out.print("<script>");
			out.print("alert('찜 추가 되었습니다');");
			out.print("</script>");
		}else {
			daoc.deleteJjim(uid,id);
			out.print("<script>");
			out.print("alert('찜 해제 되었습니다');");
			out.print("</script>");
		}
				
		if(path.equals("view")) {
			out.print("<script>");	
			out.print("location.href='/board/view?uid="+uid+"&list_option="+list_option+"'");
			out.print("</script>");
			
		}else {
			out.print("<script>");	
			out.print("location.href='/board/list?uid="+uid+"&list_option="+list_option+"'");
			out.print("</script>");
			
		}
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
