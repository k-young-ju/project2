package admin.account;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.OrderDAO;


@WebServlet("/admin/account/list")
public class AdminAccountList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminAccountList() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		String year = signdate.substring(0,4);
		if(request.getParameter("yearAccount") != null) {
			year = request.getParameter("yearAccount");
		}
		
		String month = signdate.substring(5,7);
		
		//월의 첫자리가 0으로 시작되는지 여부 확인
		boolean monthcheck = month.startsWith("0");
		
		if(monthcheck == true) {
			month = signdate.substring(6,7);
		}else {
			month = signdate.substring(5,7);
		}
		
		if(request.getParameter("monthAccount") != null) {
			month = request.getParameter("monthAccount");
		}
		//System.out.println("년도는"+year);
		//System.out.println("월은"+month);
		//총 매출 가져오기
		OrderDAO dao = new OrderDAO();
		
		int totalSales = dao.allSales(year,month);
		System.out.println("total="+totalSales);
		//주문 개수 조회
		int countOrder = dao.orderAccount(year,month);
		//System.out.println(countOrder);
	
		//순수 판매금액
		int oneSalse = dao.oneSales(year,month);
		System.out.println("pure="+oneSalse);
		
		//지급된 마일리지의 총합
		int totalMileage = dao.odTotalPoint(year,month);
		
		int totalIncome = (int)(oneSalse*0.9);
		//사용포인트 조회
		
		int usePoint = dao.useTotalPoint(year,month);
		
		
		int deliveryFee = countOrder*3000;
		
		int totalSaless = deliveryFee+totalIncome+usePoint;
		int pureSales = totalSales - (totalSaless);
		
		request.setAttribute("totalSaless", totalSaless);
		request.setAttribute("deliveryFee", deliveryFee);
		request.setAttribute("usePoint", usePoint);
		request.setAttribute("totalSales", totalSales);
		request.setAttribute("totalIncome", totalIncome);
		request.setAttribute("totalMileage", totalMileage);
		request.setAttribute("pureSales", pureSales);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		RequestDispatcher dis = request.getRequestDispatcher("/admin/account/list.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String yearAccount = request.getParameter("yearAccount");
		String monthAccount = request.getParameter("monthAccount");
		//System.out.println(monthAccount);
		response.sendRedirect("list?yearAccount="+yearAccount+"&monthAccount="+monthAccount);
	}

}
