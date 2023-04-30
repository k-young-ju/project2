package admin.member;

import java.io.IOException;
import java.sql.Array;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.Member;


@WebServlet("/admin/member/delete_select")
public class DeleteSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteSelect() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String ids =  request.getParameter("ids");
		System.out.println(ids);
		
		String[] id_ch = ids.split(",");
						
		for(int i=0 ; i<id_ch.length;i++) {
						
			MemberDAO dao = new MemberDAO();
			dao.deleteMember(id_ch[i]);
			System.out.println(id_ch);
		}
		
		response.sendRedirect("list");
	}
		
}
