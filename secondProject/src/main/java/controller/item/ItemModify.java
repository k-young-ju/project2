package controller.item;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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


@WebServlet("/item/modify")
public class ItemModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ItemModify() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		
		ItemDAO dao = new ItemDAO();
		LinkedList<Category> v = dao.categoryBig();
		
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		
		
		
		String year = signdate.substring(0,4);		
		Item it = dao.oneItem(uid);
		
		Category cb = dao.categoryKindBig(it.getKind_big());
		//System.out.println(it);
		String pudate1 = it.getPudate().substring(0,4);
		
		String pudate2 = it.getPudate().substring(5,7);
		String pudate3 = it.getPudate().substring(it.getPudate().length()-2,it.getPudate().length());
				
		int pudate22 = Integer.parseInt(pudate2);
		int pudate33 =Integer.parseInt(pudate3);
				
		//System.out.println(pudate1);
		//System.out.println(pudate2);
		//System.out.println(pudate3);
		
		request.setAttribute("year", year);
		request.setAttribute("pudate1", pudate1);
		request.setAttribute("pudate22", pudate22);
		request.setAttribute("pudate33", pudate33);
		
		request.setAttribute("v", v);		
		request.setAttribute("it", it);
		request.setAttribute("cb", cb);
			
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				HttpSession session = request.getSession();
				String session_id = (String)session.getAttribute("m_id");
				
				
			
				
				
				
				String imagePath = "C:\\jsp\\secondProject\\WebContent\\upload";		
				int size = 1*1024*1024 ;
				String filename="";
				
				MultipartRequest multi = new MultipartRequest(request, imagePath , size, "utf-8",new DefaultFileRenamePolicy());			
				
				Enumeration files=multi.getFileNames();
				String image = (String)files.nextElement();
				String image_re = multi.getFilesystemName(image);
				String image_sm = "";
				
				String image2 = (String)files.nextElement();
				String image_re2 = multi.getFilesystemName(image2);
				String image_sm2 = "";
				System.out.println(image_re);
				System.out.println(image_re2);
//				if(image!= null && ){ 
//					
//				}else{ 
//					image = "";
//					image_re = "";
//				}
		
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
		
				String prices = multi.getParameter("price1");
				
				
				  String[] price_ch = prices.split(","); 
				  String priceValue = ""; 
				  for(int i=0;i<price_ch.length;i++) { 
					  priceValue += price_ch[i]; 
				}
				  
				 //System.out.println("================:"+priceValue); 
				 
				 String qtym = multi.getParameter("qty");
					
					
				  String[] qty_ch = qtym.split(","); 
				  String qtyValue = ""; 
				  for(int i=0;i<qty_ch.length;i++) { 
					  qtyValue += qty_ch[i]; 
				} 
				 
				int a = Integer.parseInt(priceValue);
				//System.out.println(a);
	
	
				double b = a * 0.9;
				double c = b * 0.01;
			
	
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
				
				int uid = Integer.parseInt(multi.getParameter("uid"));
				
				String kind_big = multi.getParameter("kind_big");
				String kind_big2 = "";
				if(kind_big.equals("신간")) {
					kind_big2 = "10";
				}	
				
				it.setKind_big(kind_big2);
				
				String kind_middle =multi.getParameter("kind_middle");
				it.setKind_middle(kind_middle);
				
				String kind_small = multi.getParameter("kind_small");
				it.setKind_small(kind_small);
				
				it.setN_book(multi.getParameter("n_book"));
				it.setQty(Integer.parseInt(qtyValue));
				it.setComment(multi.getParameter("comment"));
				it.setImage(image_re);
				it.setId(session_id);
				it.setPrice1(a);	
				it.setPrice2((int)b);
				it.setMileage((int)c);
				it.setN_publisher(multi.getParameter("n_publisher"));
				it.setN_writer(multi.getParameter("n_writer"));
				it.setPudate(p);
				it.setImage2(image_re2);
				it.setCmt_main(multi.getParameter("cmt_main"));
				it.setCmt_sub(multi.getParameter("cmt_sub"));
				it.setCmt_writer(multi.getParameter("cmt_writer"));
				it.setCmt_index(multi.getParameter("cmt_index"));
						
				ItemDAO dao = new ItemDAO();
				dao.updateItem(it,uid,image_re,image_re2);
				
				
				Category cb = dao.categoryKindBig(kind_big2);
				
				
				
				
				request.setAttribute("cb", cb);
				
				response.sendRedirect("modify?uid="+uid);


}

}
