package admin.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;


@WebServlet("/admin/member/level_ch")
public class MemberLevelChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemberLevelChange() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String levels = request.getParameter("levels");
		String ids = request.getParameter("ids");
		//System.out.println(levels);
		String[] level_ch = levels.split(",");
		String[] id_ch = ids.split(",");
		for(int i=0; i<level_ch.length;i++) {
			MemberDAO dao = new MemberDAO();
			//System.out.println(id_ch[i]);
			dao.levelChange(level_ch[i],id_ch[i]);
		}
	}

}
