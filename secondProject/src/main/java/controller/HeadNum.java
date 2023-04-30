package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ItemDAO;


@WebServlet("/head_num")
public class HeadNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeadNum() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("session_id");
		String o_id = request.getParameter("session_cart");
//		System.out.println(id);
//		System.out.println(o_id);
		CartDAO dao = new CartDAO();
		int cartNum = 0;
		
		cartNum = dao.cartNum(id,o_id);
		out.print(cartNum);
	}

}
