package controller.item;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
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

import dao.ItemDAO;
import model.Item;


@WebServlet("/item/sell_used")
public class SellUsed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SellUsed() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		
		String imagePath = "C:\\jsp\\secondProject\\WebContent\\upload";		
		int size = 6*1024*1024 ;
		String filename="";
		
				
		
		MultipartRequest multi = new MultipartRequest(request, imagePath , size, "utf-8",new DefaultFileRenamePolicy());
		
		Enumeration files=multi.getFileNames();
			
		String kind_big = multi.getParameter("kind_big");
		String kind_middle = multi.getParameter("kind_middle");
		String kind_small = multi.getParameter("kind_small");
		
		String image = (String)files.nextElement();
		String image_re = multi.getFilesystemName(image);
		String image_sm = "";
		
		String image2 = (String)files.nextElement();
		String image_re2 = multi.getFilesystemName(image2);
		String image_sm2 = "";
		
		String image3 = (String)files.nextElement();
		String image_re3 = multi.getFilesystemName(image3);
		String image_sm3 = "";
		
		String image4 = (String)files.nextElement();
		String image_re4 = multi.getFilesystemName(image4);
		String image_sm4 = "";
		
		String image5 = (String)files.nextElement();
		String image_re5 = multi.getFilesystemName(image5);
		String image_sm5 = "";
		
		
		
		Date today = new Date();

		String location ="";
		if(multi.getParameter("location") != null) {
			location = multi.getParameter("location");
		}
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = sd.format(today);
		
//		String prices =multi.getParameter("price1");
//		
//		 String[] price_ch = prices.split(","); 
//		  String priceValue = ""; 
//		  for(int i=0;i<price_ch.length;i++) { 
//			  priceValue += price_ch[i]; 
//		}
		 
		double price3 = Double.parseDouble(multi.getParameter("price3"));
		int price = (int)Math.floor(price3/1000) * 1000;

		
		double b = price * 0.9;
				
		Item it = new Item();
		
		it.setKind_big(kind_big);
		it.setKind_middle(kind_middle);
		it.setKind_small(kind_small);
		
		it.setN_book(multi.getParameter("n_book"));
		it.setPrice1(price);	
		it.setPrice2((int)b);
		it.setComment(multi.getParameter("comment"));
		it.setImage(image_re);
		it.setImage2(image_re2);
		it.setImage3(image_re3);
		it.setImage4(image_re4);
		it.setImage5(image_re5);
		
		it.setId(session_id);
		it.setSigndate(signdate);
	
		
		ItemDAO dao = new ItemDAO();
		dao.insertUsed(it);
		//System.out.println(it);
		//String option= "product";
		response.setContentType("text/html; charset=utf-8");
		//request.setAttribute("option", option);
		
		if(location.equals("admin")) {
			response.sendRedirect("/admin/item/list?option=used");
		}else {
			response.sendRedirect("/member/my_page?option=product&option2=used");
		}
		
		
	}

}
