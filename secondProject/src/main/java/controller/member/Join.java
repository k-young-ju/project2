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

import dao.MemberDAO;
import model.Member;


@WebServlet("/member/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Join() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("join.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 	Date today = new Date();

			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = sd.format(today);
		
		Member m = new Member();
		String id = request.getParameter("m_id");
		
		m.setId(id);
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
		m.setLevel("1");
		m.setZipcode(request.getParameter("zipcode"));
		m.setZipcode1(request.getParameter("zipcode1"));
		m.setZipcode2(request.getParameter("zipcode2"));
		m.setZipcode3(request.getParameter("zipcode3"));
		m.setZipcode4(request.getParameter("zipcode4"));
		m.setSigndate(signdate);
		m.setDelete_id("n");
		m.setMileage(0);
		m.setIncome(0);
		
		
		MemberDAO dao = new MemberDAO();
		String id_count = dao.idCheck(id);
		
		if(id_count.equals("")) {//아이디가 없다면
		
				int num = dao.insertMember(m);
					
				response.setContentType("text/html; charset=utf-8");
				
				PrintWriter out = response.getWriter();
				//System.out.println(m);
				if(num == 1) {
					
					out.print("<script>");
					out.print("alert('회원가입 되셨습니다. 환영합니다.');");
					out.print("location.href='/';");
					out.print("</script>");
					
				}else {
					
					out.print("<script>");
					out.print("alert('회원가입에 실패했습니다. 이전페이지로 돌아갑니다.');");
					out.print("location.href='join';");
					out.print("</script>");
				}	
			
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('존재하는 아이디입니다.');");
			out.print("location.href='join';");
			out.print("</script>");
			
		}
		
	}

}
