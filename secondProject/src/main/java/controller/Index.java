package controller;

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
import dao.ItemDAO;
import model.Item;


@WebServlet("")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Index() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemDAO dao = new ItemDAO();
		//베스트셀러 리스트 1~6
		ArrayList<Item> b1 = dao.listLimitBestItemOne();
		
		//베스트 셀러 리스트 7~12
		ArrayList<Item> b2 = dao.listLimitBestItemTwo();
		
		//베스트 셀러 리스트 13~19
		ArrayList<Item> b3 = dao.listLimitBestItemThree();
		
		//신간 상품 리스트 1~6
		ArrayList<Item> n1 = dao.listLimitNewItemOne();
		
		//신간 상품 리스트 7~12
		ArrayList<Item> n2 = dao.listLimitNewItemTwo();
		
		//신간 상품 리스트 13~19
		ArrayList<Item> n3 = dao.listLimitNewItemThree();
		
		//중고상품 리스트 1~6
		ArrayList<Item> u1 = dao.listLimitUsedItemOne();
		
		//중고상품 리스트 7~12
		ArrayList<Item> u2 = dao.listLimitUsedItemTwo();
		
		//중고상품 리스트 13~19
		ArrayList<Item> u3 = dao.listLimitUsedItemThree();
				
		request.setAttribute("b1", b1);
		request.setAttribute("b2", b2);
		request.setAttribute("b3", b3);
		request.setAttribute("n1", n1);
		request.setAttribute("n2", n2);
		request.setAttribute("n3", n3);
		request.setAttribute("u1", u1);
		request.setAttribute("u2", u2);
		request.setAttribute("u3", u3);
		//System.out.println(v);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
