package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccesorDAO;
import dao.MemberDAO;
import model.Member;


@WebServlet("/member/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		
		MemberDAO dao = new MemberDAO();
		String delete  = dao.idCheck(id);
		int num2 = dao.loginCheck(id,pass);
		
		PrintWriter out = response.getWriter();
		if(num2== 0) {
			if(delete.equals("n")) {
				out.print("<script>");
				out.print("alert('비밀번호가 맞지않습니다. 다시 확인해주세요.');");
				out.print("location.href='login'");
				out.print("</script>");
			}else if(delete.equals("y")) {
				out.print("<script>");
				out.print("alert('탈퇴한 회원입니다.');");
				out.print("location.href='login'");
				out.print("</script>");
			}else {
				out.print("<script>");
				out.print("alert('존재하지않는 회원입니다.');");
				out.print("location.href='login'");
				out.print("</script>");
			}
		}
	
		//아이피
		String cip = request.getRemoteAddr();
		//접속시간
		Date today = new Date();		
		SimpleDateFormat sdd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sdd.format(today);
		
//		System.out.println(id);
//		System.out.println(cip);
//		System.out.println(signdate);
		
		
		Member m = dao.memberLogin(id, pass);
		
		AccesorDAO dao2 = new AccesorDAO();
		dao2.insertAccesor(id,cip,signdate);
		
		
		
		HttpSession session = request.getSession();
		session.setAttribute("m_id",m.getId());
		session.setAttribute("m_name", m.getName());
		session.setAttribute("m_level", m.getLevel());
		
		out.print("<script>");
		out.print("location.href='/'");
		out.print("</script>");
		
		
		
		
	}

}
