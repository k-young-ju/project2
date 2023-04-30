package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ItemDAO;
import dao.ReviewDAO;
import model.Cart;
import model.Item;
import model.Review2;


@WebServlet("/board/view")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public View() {
        super();
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("m_id");		
			
			String list_option= request.getParameter("list_option");
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			ItemDAO dao = new ItemDAO();
			Item i = dao.oneList(uid);
			dao.updateRef(uid);
			
			java.util.Date today = new java.util.Date(); //현재 날짜
			java.util.Date day = new java.util.Date(today.getTime()); //현재 날짜 
			SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //년-월-일 변경
			String todays = bbb.format(day); //2일전 날짜를 문자열 변수에 대입

			java.util.Date today2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(todays); //현재날짜 산술 가능하게 변환
			
			java.util.Date signdate2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(i.getSigndate()); //작성일 산술 변환
			//System.out.println("오늘날짜:"+today2);
			//System.out.println("등록날짜:"+signdate2);
						
			long diffTime = (long)(today2.getTime() - signdate2.getTime());
			//System.out.println("날짜 차이"+diffTime);	
			String diffTimeMessage= "";
			if(diffTime < (60*1000)) {
				diffTimeMessage ="방금전";
			}else if(diffTime >=(60*1000) && diffTime < (60*60*1000)) {
				diffTimeMessage =(diffTime/(60*1000)) +"분 전";
			}else if(diffTime >=(60*60*1000) && diffTime < 60*60*1000*24) {
				diffTimeMessage =(diffTime/(60*1000*60)) +"시간 전";
			}else if(diffTime >=(60*60*1000*24) && diffTime < (60*60*1000*24*365)){
				diffTimeMessage =(diffTime/(60*60*1000*24)) +"일 전";
			}else {
				diffTimeMessage =(diffTime/(60*60*1000*24*365))+"년 전";
			}
			
			//System.out.println(diffTimeMessage);
			
			request.setAttribute("mList", i);
			
			/////리뷰시작
			
			ReviewDAO dao2 = new ReviewDAO();
	    	int count = dao2.reviewAllCount(uid);
	    	int sum = dao2.reviewSum(uid);
	    	
	    	//리뷰페이징처리처리시작

			//get방식으로 넘어온 값들
			int pageSize = 5; //한 페이지당 출력할 댓글 수
			int pageNum = 1; //현재 페이지 값
			if(request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			
			//넘버링
			int number = count - (pageNum-1) * pageSize;
			
			//limit 첫번째 항목 처리
			int startRow = (pageNum -1) * pageSize;
			int endRow = pageSize;	
	        //리뷰페이징끝
			
			//상품의 찜 개수
	    	CartDAO daoc = new CartDAO();
	    	int jjimNum = daoc.countjjim(uid);
	    	
	    	int jjimcount = daoc.jjimCount(uid, id);
			
	    	ArrayList<Review2> list = dao2.listReview(uid,startRow,endRow);
	    	request.setAttribute("jjimcount", jjimcount);
	    	request.setAttribute("jjimNum", jjimNum); 	
	    	request.setAttribute("mList", i);
	    	request.setAttribute("list_option", list_option);
	    	request.setAttribute("diffTimeMessage", diffTimeMessage);
	       	request.setAttribute("rvList", list);
	    	request.setAttribute("count", count);
	    	request.setAttribute("sum", sum);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("uid", uid);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("view.jsp?uid="+uid);
			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String o_id = (String)session.getAttribute("cart");
				
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String order = request.getParameter("order");
		String option = request.getParameter("option");
		int qty = Integer.parseInt(request.getParameter("qty"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		String list_option = request.getParameter("list_option");
//		아이템 재고수량보다 많이 주문하는지 체크한다.
		ItemDAO daoQty = new ItemDAO();
		int stock = daoQty.selectQty(uid);

		String seller = request.getParameter("id");
		
		
		if(list_option.equals("3")) {//중고 물품 바로 구매
			int price = Integer.parseInt(request.getParameter("price1"));
			int total = qty * price; 
			
			Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);
						
			
			
			Cart c = new Cart();
			
			c.setO_id(o_id);
			c.setM_id(id);
			c.setId(request.getParameter("id"));
			c.setUid(uid);
			c.setPrice1(Integer.parseInt(request.getParameter("price1")));
			c.setImage(request.getParameter("image"));
			c.setCt_date(signdate);
			c.setSubject(request.getParameter("subject"));
			c.setCt_status("바로");
			c.setQty(qty);
			c.setCt_order_status("중고");
						
			
			
			CartDAO dao = new CartDAO();
			int count = dao.countCart(id,uid,o_id);
			
			if(count == 0) {
				dao.insertCartUsed(c);
			}
			
			
			response.sendRedirect("/order/list?option=c&uid="+uid+"&totals="+total);
			
		}else {
		//뷰에서 장바구니추가이동
		if(order.equals("c")) {
			
			if(qty > stock) {
				out.print("<script>");
				out.print("alert('담은 수량 : "+qty+"\\n현재 재고 : "+stock+"\\n재고 부족');");
				out.print("history.go(-1)");
				out.print("</script>");
			
			}else{
		 	Date today = new Date();
	
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);
			
					
			Cart c = new Cart();
			c.setO_id(o_id);
			c.setM_id(id);
			c.setId(seller);
			c.setUid(uid);
			c.setPrice1(Integer.parseInt(request.getParameter("price1")));
			c.setImage(request.getParameter("image"));
			c.setMileage(Integer.parseInt(request.getParameter("mileage")));
			c.setCt_date(signdate);
			c.setSubject(request.getParameter("subject"));
			c.setCt_status("준비");
			c.setQty(qty);
			c.setCt_order_status("신품");
			
			
//			System.out.println(c);
			
			CartDAO dao = new CartDAO();
			int countCart = dao.cartCheck(uid,id,o_id);
//			System.out.println(countCart);
			
			if(countCart ==0) {
			
				dao.insertCart(c);
			}else {
				dao.updateCart(c);
			}
			
			if(option.equals("1")) {
				response.sendRedirect("/cart/list");
			}else {
				response.sendRedirect("/board/view?uid="+uid);
			}	
			
			}
		}
		
		//뷰에서  바로구매 이동
		if(order.equals("d")) {
			int uid2 = Integer.parseInt(request.getParameter("uid")); 
			request.setAttribute("uid2", uid2);
		
			
			int price = Integer.parseInt(request.getParameter("price1"));
			int total = qty * price; 
//			System.out.println(total);
			
		 	Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);			
//			System.out.println(uid);
			
			

			if(qty > stock) {
				out.print("<script>");
				out.print("alert('주문 수량 : "+qty+"\\n현재 재고 : "+stock+"\\n재고 부족');");
				out.print("history.go(-1)");
				out.print("</script>");
			
			}else{
			Cart c = new Cart();
			c.setO_id(o_id);
			c.setM_id(id);
			c.setId(seller);
			c.setUid(uid);
			c.setPrice1(Integer.parseInt(request.getParameter("price1")));
			c.setImage(request.getParameter("image"));
			c.setMileage(Integer.parseInt(request.getParameter("mileage")));
			c.setCt_date(signdate);
			c.setSubject(request.getParameter("subject"));
			c.setCt_status("바로");
			c.setQty(qty);
			c.setCt_order_status("신품");
			
			
			CartDAO dao = new CartDAO();
			
			int countCart = dao.cartCheckk(uid,id,o_id);
		
			if(countCart == 0) {
				dao.insertCart(c);
			}else {
				dao.updateCartt(c);
			}
			response.sendRedirect("/order/list?option=b&uid="+uid2+"&totals="+total);
			}
		}	
		
				

	}
	}
}
