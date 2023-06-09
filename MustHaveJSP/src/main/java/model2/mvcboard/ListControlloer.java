package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

@WebServlet("/mvcboard/list.do")
public class ListControlloer extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		
		MVCBoardDAO dao = new MVCBoardDAO();
		
			Map<String, Object> map = new HashMap<String, Object>();
			
			String searchField = req.getParameter("searchField");
			String searchWord = req.getParameter("searchWord");
			
			if(searchWord != null) {
				map.put("searchField", searchField);
				map.put("searchWord", searchWord);
			}
			
			int totalCount = dao.selectCount(map);
			
			//페이지 처리 시작
			ServletContext application = getServletContext();
			int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
			int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
			
			//현재 페이지 값
			int pageNum = 1;
			String pageTemp = req.getParameter("pageNum");
			if(pageTemp != null && !pageTemp.equals("")) {
				pageNum = Integer.parseInt(pageTemp);
			}
			
			//목록에 출력할 게시물 범위 계산
			int start = (pageNum - 1) * pageSize;
			int end = pageNum * pageSize;
			map.put("start", start);
			map.put("pageSize", pageSize);
			//페이지 처리 end
			
			List<MVCBoardDTO> boardLists = dao.selectListPage(map);
			
			dao.close();
			
			String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
			
			map.put("pagingImg", pagingImg);
			map.put("totalCount", totalCount);
			map.put("pageSize", pageSize);
			map.put("pageNum", pageNum);
			
			req.setAttribute("boardLists", boardLists);
			req.setAttribute("map", map);
			req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
			
			
	}
}
