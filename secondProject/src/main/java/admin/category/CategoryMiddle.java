package admin.category;

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


@WebServlet("/item/cate_middle")
public class CategoryMiddle extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CategoryMiddle() {
        super();
      
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code2= request.getParameter("code2");
		String code3 = request.getParameter("code3");
		
		//System.out.println("코드2:"+code2);
		//System.out.println("코드3:"+code3);
		
		ItemDAO dao =  new ItemDAO();
		LinkedList<Category> v = dao.categorySmall(code2);
		//System.out.println(v);
		request.setAttribute("v", v);
		request.setAttribute("code2", code2);
		request.setAttribute("code3", code3);
		RequestDispatcher dis = request.getRequestDispatcher("cate_small.jsp");
		dis.forward(request, response);
		
		
	}

}
