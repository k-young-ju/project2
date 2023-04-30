package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.MemberDAO;
import model.Member;


@WebServlet("/member/modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Modify() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		MemberDAO dao = new MemberDAO();
		Member m = dao.oneMember(session_id);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session_id == null) {
			out.print("<script>");
			out.print("alert('회원이 아닙니다.');");
			out.print("location.href='/'");
			out.print("</script>");
		}else {
		
		request.setAttribute("modify", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("m_id");
		Member m = new Member();
		
		m.setId(request.getParameter("m_id"));
		m.setPass(request.getParameter("m_pass"));
		m.setName(request.getParameter("m_name"));
		m.setBirth1(request.getParameter("birth1"));
		m.setBirth2(request.getParameter("birth2"));
		m.setBirth3(request.getParameter("birth3"));
		m.setGender(request.getParameter("gender"));
		m.setPhone1(request.getParameter("phone1"));
		m.setPhone2(request.getParameter("phone2"));
		m.setPhone3(request.getParameter("phone3"));
		m.setEmail1(request.getParameter("email1"));
		m.setEmail2(request.getParameter("email2"));
		
		m.setZipcode(request.getParameter("zipcode"));
		m.setZipcode1(request.getParameter("zipcode1"));
		m.setZipcode2(request.getParameter("zipcode2"));
		m.setZipcode3(request.getParameter("zipcode3"));
		m.setZipcode4(request.getParameter("zipcode4"));
		
		MemberDAO dao = new MemberDAO();
		
		int num = dao.updateMember(m);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		 if(num == 1) { 
		 out.print("<script>"); 
		 out.print("alert('수정되었습니다.');");
		 out.print("location.href='modify';"); 
		 out.print("</script>"); 
		 }else {
		 out.print("<script>"); 
		 out.print("alert('수정실패');");
		 out.print("location.href='modify';"); 
		 out.print("</script>"); 
		 }
		 
				
		
		
		
		
	}

}
