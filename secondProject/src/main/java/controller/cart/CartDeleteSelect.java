package controller.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.MemberDAO;


@WebServlet("/cart/delete_select")
public class CartDeleteSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CartDeleteSelect() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String lists =  request.getParameter("lists");
		//System.out.println(lists);
		
		String[] list_ch = lists.split(",");
						
		for(int i=0 ; i<list_ch.length;i++) {
						
			CartDAO dao = new CartDAO();
			dao.deleteCart(list_ch[i]);
			
			//System.out.println(id_ch);
		}
		
		response.sendRedirect("list");
	}
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
