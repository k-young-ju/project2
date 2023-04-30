package admin.category;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.Category;


@WebServlet("/admin/category/insert")
public class CategoryInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CategoryInsert() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("insert.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		response.setContentType("text/html; charset=utf-8");
		
		Category c = new Category();
		
		c.setCode(request.getParameter("code"));
		c.setCa_name(request.getParameter("ca_name"));
		c.setUseyn("y");
		
		
		ItemDAO dao = new ItemDAO();
		
		int num = dao.categoryInsert(c);

		if(num ==1) {
		//System.out.println(c.toString());
		
		response.sendRedirect("/admin/category/list");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('존재하는 코드입니다.');");
			out.print("</script>");
		}
	}

}
