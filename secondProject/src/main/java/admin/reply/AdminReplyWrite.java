package admin.reply;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import dao.ReplyDAO;
import model.Notice;


@WebServlet("/admin/reply/write")
public class AdminReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminReplyWrite() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		
		NoticeDAO dao = new NoticeDAO();
		Notice n =dao.oneNotice(uid);
		//System.out.println(n.toString());
		request.setAttribute("n", n);
		
		RequestDispatcher dis = request.getRequestDispatcher("write.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
				
		String gongji = request.getParameter("gongji");
		String subject=request.getParameter("subject");
						
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		
		Notice n = new Notice();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		String m_name =(String)session.getAttribute("m_name");
		
		ReplyDAO dao = new ReplyDAO();
		
		int fid = Integer.parseInt(request.getParameter("fid"));
		String thread = request.getParameter("thread");
		
		String o_thread = "";
		String new_thread = "";
			
		
		o_thread = dao.threadCount(fid);
		
				new_thread = o_thread + "A";
		
		
		if(request.getParameter("option").equals("delivery")) {
			n.setOption("배송/수령일 안내");
		}else if(request.getParameter("option").equals("order")) {
			n.setOption("주문/결제");
		}else if(request.getParameter("option").equals("cart")) {
			n.setOption("반품/교환/환불");
		}else if(request.getParameter("option").equals("item")) {
			n.setOption("도서/상품정보");
		}else if(request.getParameter("option").equals("member")) {
			n.setOption("회원정보 서비스");
		}else if(request.getParameter("option").equals("member")) {
			n.setOption("웹사이트 이용 관련");
		}else if(request.getParameter("option").equals("gps")) {
			n.setOption("매장 관련");
		}else if(request.getParameter("option").equals("used")){
			n.setOption("중고 거래 관련");
		}else {	
			n.setOption("");
		}
		
					
		n.setId(id);
		n.setName(m_name);
		n.setGongji(gongji);		
		n.setSubject("[답변]"+subject);
		n.setComment(request.getParameter("comment"));
		n.setRe_date(signdate);
		n.setFid(fid);	
		n.setThread(new_thread);
		n.setStatus("답변완료");
		
		dao.insertReply(n);
		
		dao.updateReply(signdate,fid);
			
		response.sendRedirect("list");
	}

}
