package controller.item;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.LinkedList;

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

import dao.ItemDAO;
import model.Category;
import model.Item;


@WebServlet("/item/sell")
public class Sell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Sell() {
        super();     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String location= "";
		if(request.getParameter("location") != null) {
			location= request.getParameter("location");
		}
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session_id == null) {
			out.print("<script>");
			out.print("alert('회원이 아닙니다.');");
			out.print("location.href='/'");
			out.print("</script>");
		}else {
		
		String year = signdate.substring(0,4);
		ItemDAO dao = new ItemDAO();
		LinkedList<Category> v = dao.categoryBig();
		//System.out.println(year);
		
		request.setAttribute("location", location);
		request.setAttribute("year", year);
		request.setAttribute("v", v);
		//System.out.println(v);
		RequestDispatcher dis = request.getRequestDispatcher("sell.jsp");
		dis.forward(request, response);
		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		
		PrintWriter out = response.getWriter();
		//첨부 관련
				String imagePath = "C:\\jsp\\secondProject\\WebContent\\upload";		
				
				int size = 1*1024*1024 ;
				String filename=""; //파일 첨부 시스템적으로 리네임 처리
				
				MultipartRequest multi = new MultipartRequest(request, imagePath , size, "utf-8",new DefaultFileRenamePolicy());			
				
				Enumeration files=multi.getFileNames();
				String image = (String)files.nextElement();
				String image_re = multi.getFilesystemName(image);
				String image_sm = "";
				
				String image2 = (String)files.nextElement();
				String image_re2 = multi.getFilesystemName(image2);
				String image_sm2 = "";
				
				//썸네일 생성
				if(image_re != null && image_re != "") {
					ParameterBlock pb=new ParameterBlock();
					pb.add(imagePath+"/"+image_re);
					RenderedOp rOp=JAI.create("fileload",pb);
					BufferedImage bi= rOp.getAsBufferedImage();
					BufferedImage thumb=new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
					Graphics2D g=thumb.createGraphics();
					g.drawImage(bi,0,0,100,100,null);
					image_sm = "sm_"+image_re;
					File file=new File(imagePath+"/"+image_sm);
					ImageIO.write(thumb,"jpg",file);
				}		
			
			
		
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		int qty = Integer.parseInt(multi.getParameter("qty"));
		
		String location ="";
		if(multi.getParameter("location") != null) {
			location = multi.getParameter("location");
		}
		
		//System.out.println("location="+location);

		
		double price1 = Double.parseDouble(multi.getParameter("price1"));
		int price= (int)Math.floor(price1/1000) * 1000;
		
		double b = price * 0.9;
		double c = price * 0.01;		
		
		Item it = new Item();
		
		String p1 = multi.getParameter("pudate1");
		String p2 = multi.getParameter("pudate2"); 
		String p3 = multi.getParameter("pudate3");
		if(p2.length() == 1) {
			p2 = "0"+p2;
		}
		if(p3.length() == 1) {
			p3 = "0"+p3;
		}
		String p = p1 +"-"+ p2 +"-"+ p3;	
		
		
		it.setKind_big(multi.getParameter("kind_big"));
		it.setKind_middle(multi.getParameter("kind_middle"));
		it.setKind_small(multi.getParameter("kind_small"));
		it.setN_book(multi.getParameter("n_book"));
		it.setPrice1(price);	
		it.setPrice2((int)b);
		it.setMileage((int)c);
		it.setQty(qty);
		it.setComment(multi.getParameter("comment"));
		it.setImage(image_re);
		it.setImage2(image_re2);
		it.setId(session_id);
		it.setSigndate(signdate);
		it.setN_writer(multi.getParameter("n_writer"));
		it.setN_publisher(multi.getParameter("n_publisher"));
		it.setPudate(p);
		it.setCmt_main(multi.getParameter("cmt_main"));
		it.setCmt_sub(multi.getParameter("cmt_sub"));
		it.setCmt_writer(multi.getParameter("cmt_writer"));
		it.setCmt_index(multi.getParameter("cmt_index"));
		
//		System.out.println(it);
//		System.out.println(it);
		
		ItemDAO dao = new ItemDAO();
		dao.insertItem(it);
		response.setContentType("text/html; charset=utf-8");
		if(location.equals("admin")) {
			response.sendRedirect("/admin/item/list?option=new");
		}else {
			response.sendRedirect("/member/my_page?option=product&option2=new");
		}

//		response.sendRedirect("/");


	}
}
