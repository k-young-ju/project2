package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;


@WebServlet("/admin/noamin")
public class NoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public NoAdmin() {
        super();
     
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String level = (String)session.getAttribute("m_level");
		
		out.print(level);
		
	}	
	

}
