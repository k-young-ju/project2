package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.Member;


@WebServlet("/member/idok")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public IdCheck() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String id = request.getParameter("id");
			
						
			MemberDAO dao = new MemberDAO();
			
			Member m = dao.oneMember(id);
						
			
			response.setContentType("text/html; charset=utf-8");
			
			
			PrintWriter out = response.getWriter();
			
			String str = "";
			if(m.getId() != null && !m.getId().equals("")) {
				str ="<font color=red>존재하는 아이디입니다.</font>";
			}else {
				str ="<font color=blue>사용가능한 아이디입니다.</font>";
			}
			out.print(str);
			
	}

}
