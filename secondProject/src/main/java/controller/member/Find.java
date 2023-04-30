package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.Member;


@WebServlet("/member/find")
public class Find extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Find() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis  = request.getRequestDispatcher("find_inp.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		Member m = new Member();
		String id = request.getParameter("f_id");
		String option = request.getParameter("option");
		//System.out.println(id);
		if(option.equals("1")) {//아이디 찾기
			
			m.setPhone1(request.getParameter("phone1"));
			m.setPhone2(request.getParameter("phone2"));
			m.setPhone3(request.getParameter("phone3"));
			m.setEmail1(request.getParameter("email1"));
			m.setEmail2(request.getParameter("email2"));
			m.setBirth1(request.getParameter("birth1"));
			m.setBirth2(request.getParameter("birth2"));
			m.setBirth3(request.getParameter("birth3"));
			
			MemberDAO dao =  new MemberDAO();
			
			Member m2 = dao.find(m);
			request.setAttribute("m2", m2);
			//System.out.println(m2);
		
		}else { //비밀번호 찾기
			m.setId(request.getParameter("m_id"));
			m.setPhone1(request.getParameter("phone1"));
			m.setPhone2(request.getParameter("phone2"));
			m.setPhone3(request.getParameter("phone3"));
			m.setEmail1(request.getParameter("email1"));
			m.setEmail2(request.getParameter("email2"));
			m.setBirth1(request.getParameter("birth1"));
			m.setBirth2(request.getParameter("birth2"));
			m.setBirth3(request.getParameter("birth3"));
			
			MemberDAO dao =  new MemberDAO();
			
			Member m2 = dao.find(m);
			//System.out.println(m2);
			request.setAttribute("m2", m2);
		}
		
		request.setAttribute("option", option);
		RequestDispatcher dis = request.getRequestDispatcher("find_inp.jsp");
		dis.forward(request, response);
		
	
	}

}
