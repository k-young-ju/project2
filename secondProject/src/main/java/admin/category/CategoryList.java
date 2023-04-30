package admin.category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.Request;

import dao.CategoryDAO;
import dao.MemberDAO;
import model.Category;
import model.Member;


@WebServlet("/admin/category/list")
public class CategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CategoryList() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pageSize = 10; //한 페이지당 출력할 게시물 수

		
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		//검색어
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		String level = request.getParameter("level");
		String age1 = request.getParameter("age1");
		String age2 = request.getParameter("age2");
		
		
			//limit 첫번째 항목 처리

		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
					
		CategoryDAO dao =  new CategoryDAO();
		
		ArrayList<Category> v =  dao.listAll(startRow, endRow);
		int count = dao.getAllCount(); 
		int number = count - (pageNum - 1) * pageSize;
		//System.out.println(v);
		
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("v", v);		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
