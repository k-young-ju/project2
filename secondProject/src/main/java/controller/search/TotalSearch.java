package controller.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dao.NoticeDAO;
import model.Item;
import model.Notice;


@WebServlet("/t_search")
public class TotalSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TotalSearch() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String t_search=request.getParameter("t_search");
		
		int pageSize = 5; //한 페이지당 출력할 게시물 수
		
		int pageNum = 1; //신간 상품 현재 페이지 값
		int pageNum2 = 1; //중고상품 현재 페이지 값
		int pageNum3 = 1;//공지사항 현재 페이지 값
		int pageNum4 = 1;//자주 묻는 질문 현재페이지 값
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("pageNum2") != null) {
			pageNum2 = Integer.parseInt(request.getParameter("pageNum2"));
		}
		if(request.getParameter("pageNum3") != null) {
			pageNum3 = Integer.parseInt(request.getParameter("pageNum3"));
		}
		if(request.getParameter("pageNum4") != null) {
			pageNum4 = Integer.parseInt(request.getParameter("pageNum4"));
		}
		
		int startRowNew = (pageNum -1) * pageSize;
		int endRowNew = pageSize;
		
		int startRowUsed = (pageNum2 -1) * pageSize;
		int endRowUsed = pageSize;
		
		int startRowNoticeg1 = (pageNum3 -1) * pageSize;
		int endRowNoticeg1 = pageSize;
		
		int startRowNoticeg3 = (pageNum4 -1) * pageSize;
		int endRowNoticeg3 = pageSize;
		ItemDAO dao = new ItemDAO();
		NoticeDAO daon = new NoticeDAO();
		
		
		
		//신간 상품 출력
		ArrayList<Item> v = dao.totalSearchNewItem(startRowNew, endRowNew,t_search);
		int countNewItem = dao.searchCountNewItem(t_search);
		int numberNew = countNewItem - (pageNum-1) * pageSize;
		//중고상품 출력
		ArrayList<Item> v2 = dao.totalSearchUsedItem(startRowUsed, endRowUsed,t_search);
		System.out.println(v2);
		int countUsedItem = dao.searchCountUsedItem(t_search);
		int numberUsed = countUsedItem - (pageNum2-1) * pageSize;
		//공지사항
		ArrayList<Notice> v3 =daon.totalSearchgongji1Notice(startRowNoticeg1, endRowNoticeg1,t_search);
		int countgongji1Notice = daon.searchCountgongji1Notice(t_search);
		int numberNoticeGongji1 = countgongji1Notice - (pageNum3-1) * pageSize;
		//자주묻는 질문
		ArrayList<Notice> v4 =daon.totalSearchgongji3Notice(startRowNoticeg3, endRowNoticeg3,t_search);
		int countgongji3Notice = daon.searchCountgongji3Notice(t_search);
		int numberNoticeGongji3 = countgongji3Notice - (pageNum4-1) * pageSize;
		
		System.out.println(countNewItem);
		System.out.println(countUsedItem);
		System.out.println(countgongji1Notice);
		System.out.println(countgongji3Notice);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageNum3", pageNum3);
		request.setAttribute("pageNum4", pageNum4);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("numberNew", numberNew);
		request.setAttribute("numberUsed", numberUsed);
		request.setAttribute("numberNoticeGongji1", numberNoticeGongji1);
		request.setAttribute("numberNoticeGongji3", numberNoticeGongji3);
		request.setAttribute("t_search", t_search);
		request.setAttribute("LF", "\n");
		request.setAttribute("countNewItem", countNewItem);
		request.setAttribute("countUsedItem", countUsedItem);
		request.setAttribute("countgongji1Notice", countgongji1Notice);
		request.setAttribute("countgongji3Notice", countgongji3Notice);
		request.setAttribute("t_search", t_search);
		request.setAttribute("v", v);
		request.setAttribute("v2", v2);
		request.setAttribute("v3", v3);
		request.setAttribute("v4", v4);
		
		RequestDispatcher dis = request.getRequestDispatcher("/total_search/list.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
