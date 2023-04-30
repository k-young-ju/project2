package controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.Category;


@WebServlet("/modal_ch2")
public class ModalChange2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ModalChange2() {
        super();
       
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code= request.getParameter("code");
		String list_option= request.getParameter("list_option");
		String ca_name = request.getParameter("ca_name");
		//System.out.println("code=="+code);
		//System.out.println(list_option);
		//System.out.println("ca_name="+ca_name);
		ItemDAO dao =  new ItemDAO();
		LinkedList<Category> vm2 = dao.categorySmall(code);
		
		request.setAttribute("vm2", vm2);
		request.setAttribute("code", code);
		request.setAttribute("ca_name", ca_name);
		//System.out.println(v);
		request.setAttribute("list_option", list_option);
		RequestDispatcher dis = request.getRequestDispatcher("/include/modal_result2.jsp");
		dis.forward(request, response);
	}

}
