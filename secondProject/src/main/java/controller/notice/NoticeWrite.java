package controller.notice;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.NoticeDAO;
import model.Notice;


@WebServlet("/notice/write")
public class NoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public NoticeWrite() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("write.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		String  uploadPath= "C:\\jsp\\secondProject\\WebContent\\upload";		
		int size = 1*1024*1024 ;
		
		String file1 = "";
		String file1_name ="";
		String file1_rename = "";
		
		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		
		
		String gongji = multi.getParameter("gongji");
		
		
		Enumeration files=multi.getFileNames();
		
		file1 = (String)files.nextElement();
		file1_name = multi.getOriginalFileName(file1);
		file1_rename = multi.getFilesystemName(file1);
		
		if(file1_name != null){
			
		}else{
			file1_name ="";
			file1_rename = "";
		}
		
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		
		Notice n = new Notice();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		
		String m_name =(String)session.getAttribute("m_name");
		
		NoticeDAO dao = new NoticeDAO();
		int fid = 1;
		int num = dao.checkFid(fid);
		n.setFid(num);
			
		n.setId(id);
		n.setName(m_name);
		
		if(multi.getParameter("option").equals("delivery")) {
			n.setOption("배송/수령일 안내");
		}else if(multi.getParameter("option").equals("order")) {
			n.setOption("주문/결제");
		}else if(multi.getParameter("option").equals("cart")) {
			n.setOption("반품/교환/환불");
		}else if(multi.getParameter("option").equals("item")) {
			n.setOption("도서/상품정보");
		}else if(multi.getParameter("option").equals("member")) {
			n.setOption("회원정보 서비스");
		}else if(multi.getParameter("option").equals("member")) {
			n.setOption("웹사이트 이용 관련");
		}else if(multi.getParameter("option").equals("gps")) {
			n.setOption("매장 관련");
		}else if(multi.getParameter("option").equals("used")){
			n.setOption("중고 거래 관련");
		}else {	
			n.setOption("");
		}
		
		n.setSubject(multi.getParameter("subject"));
		n.setComment(multi.getParameter("comment"));
		n.setSigndate(signdate);
		n.setGongji(gongji);
		n.setFile1(file1_rename);
		n.setThread("A");
		//System.out.println(n.toString());		
		int checkInsert = dao.insertNotice(n);
		response.setContentType("text/html; charset=utf-8");
		if(checkInsert ==1) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('접수되었습니다.');");
			out.print("</script>");
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('문의 접수에 실패했습니다 다시 문의해주세요.');");
			out.print("location.href='write'");
			out.print("</script>");
		}
		
		response.sendRedirect("list?gongji="+gongji);
	}

}
