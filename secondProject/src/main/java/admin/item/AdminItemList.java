package admin.item;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import model.Item;


@WebServlet("/admin/item/list")
public class AdminItemList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminItemList() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
					
			ItemDAO dao = new ItemDAO();
			
			String option ="";
			if(request.getParameter("option") != null) {
				option = request.getParameter("option");
			}
			//System.out.println("option="+option);
			int pageSize = 5; //한 페이지당 출력할 게시물 수
			int pageNum = 1; //신간 부분 현재 페이지 값
			if(request.getParameter("pageNum") != null) {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}
			
			int pageNum2 = 1; //중고부분 현재 페이지 값
			if(request.getParameter("pageNum2") != null) {
				pageNum2 = Integer.parseInt(request.getParameter("pageNum2"));
			}
			 
//			System.out.println(pageSize +"========");
//			System.out.println(pageNum +"========");
			
			int countNew = dao.itemNewCount();
			int numberNew = countNew - (pageNum-1) * pageSize;
			//System.out.println("신간 개수="+countNew);
			
			int countUsed = dao.itemUsedCount();
			//System.out.println("중고개수="+countUsed);
			int numberUsed = countUsed - (pageNum2-1) * pageSize;
//			System.out.println(count +"========");
//			System.out.println(number +"========");
			
			//limit 첫번째 항목 처리
			int startRowNew = (pageNum -1) * pageSize;
			int endRow = pageSize;
			
			int StartRowUsed = (pageNum2 -1) * pageSize;
			
			ArrayList<Item> itemNewlist = dao.adminNewItemAll(startRowNew,endRow);
						
			ArrayList<Item> itemUsedlist = dao.adminUsedItemAll(StartRowUsed,endRow);
//			System.out.println(itemlist);
				
			request.setAttribute("option", option);
			request.setAttribute("itemNewlist", itemNewlist);
			request.setAttribute("itemUsedlist", itemUsedlist);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageNum2", pageNum2);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("numberNew", numberNew);
			request.setAttribute("countNew", countNew);
			request.setAttribute("numberUsed", numberUsed);
			request.setAttribute("countUsed", countUsed);
			//System.out.println("====list post====");
			RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
			dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
