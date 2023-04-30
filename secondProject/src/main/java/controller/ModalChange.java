package controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ItemDAO;
import model.Category;


@WebServlet("/modal_ch")
public class ModalChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ModalChange() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modal_option = request.getParameter("modal_option");
		//System.out.println(option);
		String list_option="";
		if(request.getParameter("list_option") != null) {
			list_option=request.getParameter("list_option");
		}
		String code ="10";
		
		if(request.getParameter("modal_option").equals("book2")) {
			code ="20";
		}
		
		//System.out.println(list_option);
		//System.out.println(code);
		//CategoryDAO dao = new CategoryDAO();
		ItemDAO dao =  new ItemDAO();
		LinkedList<Category> vm1 = dao.categoryMiddle(code);
				
		request.setAttribute("vm1", vm1);
		request.setAttribute("code", code);
		request.setAttribute("list_option", list_option);
		
		RequestDispatcher dis = request.getRequestDispatcher("/include/modal_result.jsp");
		dis.forward(request, response);
	}

}
