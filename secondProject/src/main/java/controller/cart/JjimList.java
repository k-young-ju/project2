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
import model.Jjim;


@WebServlet("/cart/jjim")
public class JjimList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public JjimList() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	String id = (String)session.getAttribute("m_id");
	
	String option = request.getParameter("option");
	int pageSize = 10; //한 페이지당 출력할 게시물 수
	int pageNum = 1; //현재 페이지 값
	if(request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	CartDAO dao = new CartDAO();
	int count = dao.jjimListCount(id); 
	
	int number = count - (pageNum-1) * pageSize;
	
	ArrayList<Jjim> v = dao.listJjimNew(id);
	
	ArrayList<Jjim> v2 = dao.listJjimUsed(id);
	
	request.setAttribute("option", option);
	request.setAttribute("count", count);		
	request.setAttribute("v", v);
	request.setAttribute("v2", v2);
	RequestDispatcher dis = request.getRequestDispatcher("jjim_list.jsp");
	dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
