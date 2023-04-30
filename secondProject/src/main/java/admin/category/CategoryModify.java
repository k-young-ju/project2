package admin.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;


@WebServlet("/admin/category/modify")
public class CategoryModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CategoryModify() {
        super();
        
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Category c = new Category();
		c.setCode(request.getParameter("code"));
		c.setCa_name(request.getParameter("ca_name"));
		c.setUseyn(request.getParameter("useyn"));
		
		CategoryDAO dao = new CategoryDAO();
		dao.updateCategory(c);
		
		response.sendRedirect("list");
	}

}
