package controller.item;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
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
import model.Category;
import model.Item;


@WebServlet("/item/modify_used")
public class ItemModifyUsed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ItemModifyUsed() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String location= "";
		if(request.getParameter("location") != null) {
			location= request.getParameter("location");
		}
		int uid = Integer.parseInt(request.getParameter("uid"));
		ItemDAO dao = new ItemDAO();
		
		Item it = dao.oneItem(uid);
		
		
		Category cb = dao.categoryKindBig(it.getKind_big());
		
		request.setAttribute("location", location);		
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		request.setAttribute("pageName", request.getParameter("pageName"));
		request.setAttribute("pageNum2", request.getParameter("pageNum2"));
		request.setAttribute("cb", cb);
		request.setAttribute("i", it);
		
		RequestDispatcher dis = request.getRequestDispatcher("modify_used.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		

		
		HttpSession session = request.getSession();
		String session_id = (String)session.getAttribute("m_id");
		
		
		
		
		String imagePath = "C:\\jsp\\secondProject\\WebContent\\upload";		
		int size = 5*1024*1024 ;
		String filename="";
		
		MultipartRequest multi = new MultipartRequest(request, imagePath , size, "utf-8",new DefaultFileRenamePolicy());
		
		Enumeration files=multi.getFileNames();
			
		String kind_big = multi.getParameter("kind_big");
		String kind_big2 = "";
		if(kind_big.equals("중고")) {
			kind_big2 = "20";
		}
		
		
//		 String[] price_ch = prices.split(","); 
//		  String priceValue = ""; 
//		  for(int i=0;i<price_ch.length;i++) { 
//			  priceValue += price_ch[i]; 
//		}
		  
		String pageNum = multi.getParameter("pageNum");
		request.setAttribute(pageNum, "pageNum");
		
		String useyn = multi.getParameter("useyn");
		
		String kind_middle = multi.getParameter("kind_middle");
		String kind_small = multi.getParameter("kind_small");
		
		String image = (String)files.nextElement();
		String image_re = multi.getFilesystemName(image);

		String image2 = (String)files.nextElement();
		String image_re2 = multi.getFilesystemName(image2);

		String image3 = (String)files.nextElement();
		String image_re3 = multi.getFilesystemName(image);

		String image4 = (String)files.nextElement();
		String image_re4 = multi.getFilesystemName(image);

		String image5 = (String)files.nextElement();
		String image_re5 = multi.getFilesystemName(image);
//
		int uid = Integer.parseInt(multi.getParameter("uid"));
		String pageNum2 = multi.getParameter("pageNum2");
		
		String pageName = multi.getParameter("pageName");
		
		request.setAttribute("useyn", useyn);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageName", pageName);
	
		System.out.println("uid="+uid);
		double aa = Double.parseDouble(multi.getParameter("price1"));
		int a= (int)Math.floor(aa/1000) * 1000;
		//System.out.println("a:"+a);	
		double b = a * 0.9;

		Item it = new Item();
		
		it.setKind_big(kind_big2);
		it.setKind_middle(kind_middle);
		it.setKind_small(kind_small);
		
		it.setN_book(multi.getParameter("n_book"));
		it.setPrice1(a);	
		it.setPrice2((int)b);
		it.setComment(multi.getParameter("comment"));
		it.setImage(image_re);
		it.setImage2(image_re2);
		it.setImage3(image_re3);
		it.setImage4(image_re4);
		it.setImage5(image_re5);
		it.setUseyn(useyn);
		
		it.setImage2(image_re2+","+image_re3+","+image_re4+","+image_re5);
		it.setId(session_id);
		//System.out.println(it);
		ItemDAO dao = new ItemDAO();
		dao.updateUsed(uid,it,image_re,image_re2,image_re3,image_re4,image_re5);
		
		response.sendRedirect("modify_used?uid="+uid+"&pageNum="+pageNum+"&pageNum2="+pageNum2+"&pageName="+pageName);
	}

}
