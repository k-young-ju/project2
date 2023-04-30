package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/item/month_ch")
public class MonthChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MonthChange() {
        super();
        
    }

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int month = Integer.parseInt(request.getParameter("month"));
		//System.out.println(month);
				
		
		request.setAttribute("month", month);
		RequestDispatcher dis = request.getRequestDispatcher("day_ch.jsp");
		dis.forward(request, response);
	}

}
