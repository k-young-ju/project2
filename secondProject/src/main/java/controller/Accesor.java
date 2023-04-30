package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccesorDAO;

@WebServlet("/accesor")
public class Accesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Accesor() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
//			int date = Integer.parseInt(signdate);
//			int y_date = date-1;
		
			AccesorDAO dao = new AccesorDAO();
			int t_day = dao.countTodayAccesor();
			int total_day = dao.countAccesor();
			int yester_day = dao.countYesterdayAccesor();
			
			PrintWriter out = response.getWriter();
			out.print(t_day+",");
			out.print(total_day+",");
			out.print(yester_day);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
