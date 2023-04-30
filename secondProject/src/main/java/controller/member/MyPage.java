package controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ItemDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import model.Cart;
import model.Item;
import model.Member;
import model.Order;


@WebServlet("/member/my_page")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyPage() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		
		MemberDAO daom = new MemberDAO();
		Member m = daom.oneMember(session_id);
		String list_option = request.getParameter("list_option");
		String option = request.getParameter("option");
		if(request.getParameter("option") == null) {
			option ="";
		}
		String option2 =request.getParameter("option2");
		ItemDAO dao = new ItemDAO();
		CartDAO dao2 = new CartDAO();
		OrderDAO dao3 = new OrderDAO();
		
		//페이징시작
		int pageSize = 5; //한 페이지당 출력할 게시물 수
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String pageName=request.getParameter("pageName");

		String saleId = dao2.selectSaleId(session_id);
		String subject = dao2.selectSubject(session_id);
		
		request.setAttribute("subject", subject);
		request.setAttribute("saleId", saleId);
		request.setAttribute("list_option", list_option);
		request.setAttribute("option", option);
		request.setAttribute("option2", option2);
		request.setAttribute("m", m);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageName", pageName);		
		
		RequestDispatcher dis = request.getRequestDispatcher("my_page.jsp");
		dis.forward(request, response);
		
	}

}
