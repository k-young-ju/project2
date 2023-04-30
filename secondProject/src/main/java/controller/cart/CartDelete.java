package controller.cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import model.Cart;


@WebServlet("/cart/delete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CartDelete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("m_id");
		
		String ct_uid = request.getParameter("ct_uid");
		
		CartDAO dao = new CartDAO();
		dao.cartDelete(ct_uid);
		
		response.sendRedirect("list");
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
