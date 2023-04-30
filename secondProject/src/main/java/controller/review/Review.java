package controller.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dao.ReviewDAO;
import model.Item;
import model.Member;
import model.Review2;

@WebServlet("/board/review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Review() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
			
    	int uid = Integer.parseInt(request.getParameter("tb_uid"));
   
    	ItemDAO dao = new ItemDAO(); 		
    	Item i = dao.oneList(uid);
    	
		request.setAttribute("mList", i);
    	String tb_id = request.getParameter("tb_id");
    	String tb_name = request.getParameter("tb_name");    	
    	String scor = request.getParameter("reviewStar");	
     	
    	int score = 5;
    	if(scor != null) {
    	score = Integer.parseInt(request.getParameter("reviewStar"));
    	}
    	
    	Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
    	
//		System.out.println(score);
		Review2 rv = new Review2();
		rv.setTb_uid(uid);
		rv.setTb_id(tb_id);
		rv.setTb_name(tb_name);
		rv.setTb_review(request.getParameter("reviewContents"));
		rv.setTb_review_score(score);
    	rv.setTb_date(signdate);
    	
//    	System.out.println(rv);
    	
    	ReviewDAO dao2 = new ReviewDAO();
		dao2.insertReview(rv);
			
    	response.setContentType("text/html; charset=utf-8");
    	PrintWriter out = response.getWriter();     	
    	int count = dao2.reviewAllCount(uid);
    	int sum = dao2.reviewSum(uid);
    	

//    	페이징처리처리시작
    	
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
		
//		페이징끝
    
    	ArrayList<Review2> list = dao2.listReview(uid,startRow,endRow);
    	request.setAttribute("rvList", list);
    	request.setAttribute("count", count);
    	request.setAttribute("sum", sum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("uid", uid);
    	
//		System.out.println(list);
//    	System.out.println(count);
//		System.out.println(sum);
    	
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp?uid="+uid+"#review");
		dis.forward(request, response);
		
		
	}
	
	

}
