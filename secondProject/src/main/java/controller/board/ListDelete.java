package controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;


@WebServlet("/board/delete")
public class ListDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListDelete() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		ItemDAO dao = new ItemDAO();
		
		dao.listDelete(uid);
		
		response.sendRedirect("/member/my_page");
		
		
	}


}
