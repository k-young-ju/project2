package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;


@WebServlet("/admin")
public class AdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminIndex() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		String level = (String)session.getAttribute("m_level");
		String id = (String)session.getAttribute("m_id");
		System.out.println(level);
		System.out.println(id);
		
		PrintWriter out = response.getWriter();
		
		if(!level.equals("10")){
		out.print("<script>");
		out.print("alert('꺼져');");
		out.print("history.go(-1)");
		out.print("</script>");
		return;
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("/admin/index.jsp");
		dis.forward(request, response);
	}

}
