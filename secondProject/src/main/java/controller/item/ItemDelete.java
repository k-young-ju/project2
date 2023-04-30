package controller.item;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;


@WebServlet("/item/delete")
public class ItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ItemDelete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid= Integer.parseInt(request.getParameter("uid"));
		String list_option =request.getParameter("list_option");
		String list2_option ="10";
		if(list_option.equals("20")) {
			list2_option ="3";
		}
		ItemDAO dao = new ItemDAO();
		dao.deleteProduct(uid);
		
		response.sendRedirect("/board/list?list_option="+list2_option);
		
	}

	
	
	

}
