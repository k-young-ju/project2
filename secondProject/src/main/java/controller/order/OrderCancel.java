package controller.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.CartDAO;
import dao.OrderDAO;


@WebServlet("/order/cancel")
public class OrderCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderCancel() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String option="";
		
		if(request.getParameter("order_option") !=null) {
		 option = request.getParameter("order_option");
		}
		
//		String cart_rese = request.getParameter("cart_rese");
		String od_id = request.getParameter("od_id");
		
		
		System.out.println(od_id);
		System.out.println("option="+option);
		
		OrderDAO dao = new OrderDAO();
		CartDAO dao2 = new CartDAO();
		
		
		dao.cancelOrder(od_id);
		dao2.cancelCart(od_id);
	
		if(option.equals("myPage")) {
			out.print("<script>");
			out.print("alert('취소되었습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('취소되었습니다.');");
			out.print("location.href='/';");
			out.print("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
