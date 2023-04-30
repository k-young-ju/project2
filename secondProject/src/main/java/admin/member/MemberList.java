package admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.Member;


@WebServlet("/admin/member/list")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberList() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao =  new MemberDAO();
		
		int pageSize = 10; //한 페이지당 출력할 게시물 수
		int pageNum = 1; //현재 페이지 값
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} 
		int count = dao.memberCount();
		int number = count - (pageNum-1) * pageSize;
		
		//limit 첫번째 항목 처리
		int startRow = (pageNum -1) * pageSize;
		int endRow = pageSize;
		
		ArrayList<Member> v = dao.listAllMember(startRow,endRow);
		request.setAttribute("v", v);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("count", count);
		
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
