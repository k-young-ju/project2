package controller.board;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ItemDAO;
import model.Category;
import model.Item;


@WebServlet("/board/modify")
public class ListModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ListModify() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String location= "";
		if(request.getParameter("location") != null) {
			location= request.getParameter("location");
		}
		int uid = Integer.parseInt(request.getParameter("uid"));
		//System.out.println(uid);
		
		ItemDAO dao = new ItemDAO();
		LinkedList<Category> v = dao.categoryBig();
		
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
		String pageNum = request.getParameter("pageNum"); 
		String pageName = request.getParameter("pageName"); 
		
		
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
		
		request.setAttribute("location", location);
		request.setAttribute("year", year);
		request.setAttribute("pudate1", pudate1);
		request.setAttribute("pudate22", pudate22);
		request.setAttribute("pudate33", pudate33);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageName", pageName);
		request.setAttribute("v", v);		
		request.setAttribute("it", it);
		request.setAttribute("cb", cb);
			
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
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
		String image_re2 = multi.getFilesystemName(image);
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
		
		int uid2 = Integer.parseInt(multi.getParameter("uid"));
		int uid = Integer.parseInt(multi.getParameter("uid"));
		
		double aa = Double.parseDouble(multi.getParameter("price1"));
		int a= (int)Math.floor(aa/1000) * 1000;
		
		double b = a * 0.1;
		double c = b * 0.1;
		
		Item i = new Item();
		
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
		
		//System.out.println(p);
		String kind_big = multi.getParameter("kind_big");
		
		String kind_big2 = "";
		if(kind_big.equals("신간")) {
			kind_big2 = "10";
		}
			
		
		i.setKind_big(kind_big2);
		String kind_middle =multi.getParameter("kind_middle");
		i.setKind_middle(kind_middle);	
		String kind_small = multi.getParameter("kind_small");
		i.setKind_small(kind_small);
		
	
		i.setPudate(p);
		i.setN_book(multi.getParameter("n_book"));
		i.setN_writer(multi.getParameter("n_writer"));
		i.setN_publisher(multi.getParameter("n_publisher"));
		i.setPrice1(a);
		i.setQty(Integer.parseInt(multi.getParameter("qty")));
		i.setUseyn(multi.getParameter("useyn"));
		i.setImage(image_re);
		i.setUid(uid2);
		i.setComment(multi.getParameter("comment"));
		i.setPrice2((int)b);
		i.setMileage((int)c);
		i.setCmt_main(multi.getParameter("cmt_main"));
		i.setCmt_sub(multi.getParameter("cmt_sub"));
		i.setCmt_writer(multi.getParameter("cmt_writer"));
		i.setCmt_index(multi.getParameter("cmt_index"));
		
		//System.out.println(i);
		
		ItemDAO dao = new ItemDAO();
		dao.updateItem(i,uid,image_re,image_re2);
		
		Category cb = dao.categoryKindBig(kind_big2);
		request.setAttribute("cb", cb);
		
		String pageNum = multi.getParameter("pageNum");
		System.out.println(pageNum);
		request.setAttribute("pageNum",pageNum);
		
		response.sendRedirect("modify?uid="+uid+"&pageNum="+pageNum);
		
		
	}

}
