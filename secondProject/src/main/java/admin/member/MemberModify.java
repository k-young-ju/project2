package admin.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.Request;

import dao.MemberDAO;
import model.Member;


@WebServlet("/admin/member/modify")
public class MemberModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberModify() {
        super();
     
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		
		m.setId(request.getParameter("m_id"));
		m.setPass(request.getParameter("m_pass"));
		m.setName(request.getParameter("m_name"));
	
		String birth1 = request.getParameter("birth1");
		int idx1 = birth1.indexOf("년");
		//System.out.println(idx1);
		m.setBirth1(birth1.substring(0,idx1));
		
		String birth2 =request.getParameter("birth2");
		int idx2 = birth2.indexOf("월");
		//System.out.println(idx2);
		m.setBirth2(birth2.substring(0,idx2));
		
		String birth3 =request.getParameter("birth3");
		int idx3 = birth3.indexOf("일");
		//System.out.println(idx3);
		m.setBirth3(birth2.substring(0,idx3));
		
		String gender = request.getParameter("gender");
		if(gender.equals("남성")) {
			m.setGender("M");
		}else {
			m.setGender("F");
		}
		m.setLevel(request.getParameter("level"));
		m.setEmail1(request.getParameter("email1"));
		m.setEmail2(request.getParameter("email2"));
		m.setPhone1(request.getParameter("phone1"));
		m.setPhone2(request.getParameter("phone2"));
		m.setPhone3(request.getParameter("phone3"));
		m.setZipcode(request.getParameter("zipcode"));
		m.setZipcode1(request.getParameter("zipcode1"));
		m.setZipcode2(request.getParameter("zipcode2"));
		m.setZipcode3(request.getParameter("zipcode3"));
		m.setZipcode4(request.getParameter("zipcode4"));
		
		MemberDAO dao = new MemberDAO();
		
		int num = dao.updateMember(m);
				
		response.setContentType("text/html; charset=utf-8");
		
		
		PrintWriter out = response.getWriter();
		
		//
		if(num == 1) {
					
			out.print("<script>");
			out.print("alert('회원수정되었습니다');");
			out.print("history.go(-1);");
			out.print("</script>");
				
		}else {
						
			out.print("<script>");
			out.print("alert('회원수정에 실패했습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}	
		
		
	}

}
