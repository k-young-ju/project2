package controller.pageMove;

import java.io.IOException;
import java.io.PrintWriter;
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
import dao.OrderDAO;
import model.Cart;
import model.Item;
import model.Order;


@WebServlet("/pageMove/pagemove")
public class PageMove extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PageMove() {
        super();
   
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		
//		String paneNum = request.getParameter("pageNum");
//		System.out.println(paneNum);
		OrderDAO dao = new OrderDAO();
		CartDAO dao2 = new CartDAO();
		ItemDAO dao3 = new ItemDAO();
		
		//페이징시작
		int pageSize = 5; //한 페이지당 출력할 게시물 수
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		System.out.println(pageNum);
		
		int count = 0;
		int number = 0;
		
		//limit 첫번째 항목 처리
		int startRow = (pageNum -1) * pageSize;
		int endRow = pageSize;
		
		String option = request.getParameter("option");
		
		if(option.equals("order")) {
			LinkedList<Order> v7 = dao.listMyOrder(session_id,startRow,endRow);
			request.setAttribute("v7", v7); //주문내역 신품내역
			count = dao.orderCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveOrder.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("orderUsed")) {
			LinkedList<Order> v8 = dao.listMyOrderUsed(session_id,startRow,endRow);
			request.setAttribute("v8", v8); //주문내역 신품내역
			count = dao.orderUsedCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			String saleId = dao2.selectSaleId(session_id);
			String subject = dao2.selectSubject(session_id);
			
			request.setAttribute("subject", subject);
			request.setAttribute("saleId", saleId);
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveOrderUsed.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("product")) {
			ArrayList<Item> v = dao3.listNew(session_id,startRow,endRow);
			request.setAttribute("v", v); //주문내역 신품내역
			count = dao3.productCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveProduct.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("productUsed")) {
			ArrayList<Item> v2 = dao3.listUsed(session_id,startRow,endRow);
			request.setAttribute("v2", v2); //주문내역 신품내역
//			System.out.println(v2);
			count = dao3.productUsedCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveProductUsed.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("sell")) {		
			ArrayList<Cart> v3 = dao2.listSell(session_id,startRow,endRow);
			request.setAttribute("v3", v3); //주문내역 신품내역
			count = dao2.sellCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveSell.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("sellUsed")) {
			ArrayList<Cart> v4 = dao2.listSellUsed(session_id,startRow,endRow);
//			System.out.println(v4);
			request.setAttribute("v4", v4); //주문내역 신품내역
			count = dao2.sellUsedCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count); 
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveSellUsed.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("buy")) {
			ArrayList<Cart> v5 = dao2.listBuy(session_id,startRow,endRow);
			request.setAttribute("v5", v5); //주문내역 신품내역
			count = dao2.buyCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count);	
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveBuy.jsp");
			dis.forward(request, response);
		}
		
		if(option.equals("buyUsed")) {
			ArrayList<Cart> v6 = dao2.listBuyUsed(session_id,startRow,endRow);
			request.setAttribute("v6", v6); //주문내역 신품내역
			count = dao2.buyUsedCount(session_id);
			number = count - (pageNum-1) * pageSize;
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("count", count); 
			
			RequestDispatcher dis = request.getRequestDispatcher("/pageMove/pageMoveBuyUsed.jsp");
			dis.forward(request, response);

		}
				
	}
}
