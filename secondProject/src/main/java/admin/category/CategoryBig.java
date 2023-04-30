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


@WebServlet("/item/cate_big")
public class CategoryBig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CategoryBig() {
        super();
      
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String code2 = request.getParameter("code2");
		//System.out.println(code);
	
		//System.out.println(code2);
		
		//System.out.println("===== code : "+code);
		ItemDAO dao = new ItemDAO();
		
		LinkedList<Category> v =  dao.categoryMiddle(code);
				
		request.setAttribute("v", v);
		request.setAttribute("code2", code2);
		
		//System.out.println(v);
		RequestDispatcher dis = request.getRequestDispatcher("cate_middle.jsp");
		dis.forward(request, response);
	}

}
