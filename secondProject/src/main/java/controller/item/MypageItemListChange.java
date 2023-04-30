package controller.item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;
import model.Item;


@WebServlet("/item/item_ch")
public class MypageItemListChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MypageItemListChange() {
        super();
    
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		String option = request.getParameter("option");
		//System.out.println(option);
		ItemDAO dao = new ItemDAO();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(option);
		
	

	}

}
