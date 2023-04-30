package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ItemDAO;
import model.Cart;
import model.Item;
import model.Member;




@WebServlet("/board/list")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public List() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//get방식으로 넘어온 값들
		int pageSize = 8; //한 페이지당 출력할 게시물 수
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String list_option = request.getParameter("list_option");
		
		String code_middle="";
		if(request.getParameter("code_middle") != null) {
			code_middle=request.getParameter("code_middle");
		}
		
		String code_small="";
		if(request.getParameter("code_small") != null) {
			code_small=request.getParameter("code_small");
		}
		
		//System.out.println(list_option);
		ItemDAO dao = new ItemDAO();		
				
		int count = dao.bestCount(list_option,code_middle,code_small); 
		
		int number = count - (pageNum-1) * pageSize;
		
		//limit 첫번째 항목 처리
		int startRow = (pageNum -1) * pageSize;
		int endRow = pageSize;
		
		 
		LinkedList<Item> list = dao.bestList(startRow, endRow, list_option,code_middle,code_small);
		
		//System.out.println(list);
		request.setAttribute("list_option", list_option);
		request.setAttribute("code_middle", code_middle);
		request.setAttribute("code_small", code_small);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("count", count);		
		request.setAttribute("list", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp?list_option="+list_option);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		String order = request.getParameter("order");
		String list_option=request.getParameter("list_option");
		String option = request.getParameter("option");
		
		String seller = request.getParameter("id");
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		//System.out.println(order);
		//System.out.println("====option==="+option);
		//System.out.println(uid);
		//System.out.println(seller);

		
		//리스트에서 장바구니추가이동
		if(order.equals("c")) {
			
		 	Date today = new Date();
	
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("m_id");
			String non_id = (String)session.getAttribute("cart");		
			String num = (String)session.getAttribute("cart");		
			Cart c = new Cart();
			c.setO_id(num);
			c.setM_id(id);
			c.setId(seller);
			c.setUid(uid);
			c.setPrice1(Integer.parseInt(request.getParameter("price1")));
			c.setImage(request.getParameter("image"));
			c.setMileage(Integer.parseInt(request.getParameter("mileage")));
			c.setCt_date(signdate);
			c.setSubject(request.getParameter("subject"));
			c.setCt_status("준비");
			c.setCt_order_status("신품");
			c.setQty(1);
			
			
			//System.out.println(c);
			
			CartDAO dao = new CartDAO();
			int countCart = dao.cartCheck(uid,id,non_id);
			//System.out.println(countCart);
			
				if(countCart ==0) {
				
					dao.insertCart(c);
				}else {
					dao.updateCart(c);
				}
				System.out.println(c);
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				if(option.equals("1")) {
					out.print("<script>");
					out.print("location.href='/cart/list';");
					out.print("</script>");
				
				}else {
					out.print("<script>");
					out.print("history.back();");
					out.print("</script>");

				}	
			
			
		}
		
//		리스트에서  바로구매 이동
		if(order.equals("d")) {
			int uid2 = Integer.parseInt(request.getParameter("uid")); 
			request.setAttribute("uid2", uid2);
		
			
			int price = Integer.parseInt(request.getParameter("price1")); 			
		 	Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("m_id");
			
			String num = (String)session.getAttribute("cart");

			Cart c = new Cart();
			c.setO_id(num);
			c.setM_id(id);
			c.setId(seller);
			c.setUid(uid);
			c.setPrice1(Integer.parseInt(request.getParameter("price1")));
			c.setImage(request.getParameter("image"));
			c.setMileage(Integer.parseInt(request.getParameter("mileage")));
			c.setCt_date(signdate);
			c.setSubject(request.getParameter("subject"));
			c.setCt_status("바로");
			c.setCt_order_status("신품");
			c.setQty(1);
			
			CartDAO dao = new CartDAO();
			
			int countCart = dao.cartCheckk(uid,id,num);
		
			if(countCart == 0) {
				dao.insertCart(c);
			}else {
				dao.updateCartt(c);
			}
			response.sendRedirect("/order/list?option=b&uid="+uid2+"&totals="+price);
			
		}
		

	}
}
