package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import dao.ComuPostDao;
import dto.ComuPostDto;

@WebServlet("/Community")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 10 * 1024 * 1024,
    maxRequestSize = 50 * 1024 * 1024
)
public class CommunityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "upload";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        String gubun = request.getParameter("t_gubun");
        if (gubun == null) gubun = "list";
        
        String viewPage = "";

        if (gubun.equals("list")) {
        	listPosts(request, response);
        	viewPage = "Community/comu_list.jsp";
        } else if (gubun.equals("write")) {
        	viewPage = "Community/comu_write.jsp";
        } else if ("insert".equals(gubun)) {
            insertPost(request, response);
            viewPage = "common_alert.jsp";
        } else if (gubun.equals("view")) {
        	viewPost(request, response);
        	viewPage = "Community/comu_view.jsp";
        } else if ("delete".equals(gubun)) {   // ✅ 게시글 삭제 추가
            deletePost(request, response);
            viewPage = "common_alert.jsp";
        }  else if ("update".equals(gubun)) {
            updatePost(request, response);
            viewPage = "Community/comu_update.jsp";
        }  else if ("updateProc".equals(gubun)) {
            updatePostProc(request, response);
            viewPage = "Community/comu_alert_view.jsp";
        }  
        
        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // 게시글 리스트
    private void listPosts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ComuPostDao dao = new ComuPostDao();
        
        String select = request.getParameter("t_select");
        String search = request.getParameter("t_search");
        
		if(select == null) {
			select = "title";
			search = "";
		}
		request.setAttribute("t_select", select);
		request.setAttribute("t_search", search);
		
		/* paging 설정 start*/
		int totalCount = dao.getTotalCount(select, search);
		int list_setup_count = 5; // 한 페이지당 출력 행수 
		int pageNumber_count = 3; // 한 페이지당 출력 페이지 갯수
		
		String nowPage = request.getParameter("t_nowPage"); // 현재 클릭한 페이지 번호
		int current_page = 0; // 현재페이지 번호
		int total_page = 0; // 전체 페이지 수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; // null => 1로 초기화
		else current_page = Integer.parseInt(nowPage);
		
		total_page = totalCount / list_setup_count; // 몫 : 2
		int rest = 	totalCount % list_setup_count; // 나머지 : 1
		if(rest !=0) total_page = total_page + 1; // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/
		
		request.setAttribute("totalCount", totalCount);
        
        List<ComuPostDto> postList = dao.getPostList(select, search, start, end);
        
        request.setAttribute("postList", postList);
        
        String pageDisplay = CommonUtil.getComuPageDisplay(current_page, total_page, pageNumber_count);
		request.setAttribute("pageDisplay", pageDisplay);
        
    }

    // 게시글 상세보기
    private void viewPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String postIdParam = request.getParameter("post_id");
        
        int post_id = Integer.parseInt(postIdParam);
        ComuPostDao dao = new ComuPostDao();
        
        //조회수 증가
        dao.increaseHit(post_id);
        
        ComuPostDto post = dao.getPostById(post_id);
       
        request.setAttribute("post", post);

	}
    

    // 게시글 작성 처리
    private void insertPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ComuPostDao dao = new ComuPostDao();
        
        int no = dao.getComuNo();
        String m_id = (String) CommonUtil.getSessionInfo(request, "id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        ComuPostDto dto = new ComuPostDto();
        dto.setPost_id(no);
        dto.setM_id(m_id);
        dto.setTitle(title);
        dto.setContent(content);

        int result = dao.insertPost(dto); // 게시글 DB 저장
        
        String msg = result == 1 ? "게시글 등록성공." : "게시글 등록 실패.";
        request.setAttribute("t_msg", msg);
        request.setAttribute("t_url", "Community");
        
    }
        
        // ✅ 게시글 삭제 처리 (POST 방식)
        private void deletePost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String postIdParam = request.getParameter("post_id");

            int post_id = Integer.parseInt(postIdParam);

            ComuPostDao dao = new ComuPostDao();
            boolean isDeleted = dao.deletePost(post_id);

            String msg = isDeleted == true ? "게시글 삭제성공." : "게시글 삭제 실패";
            request.setAttribute("t_msg", msg);
            request.setAttribute("t_url", "Community");
            
    }
        
        //게시글 업데이트 열기
        private void updatePost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String idParam = request.getParameter("post_id");

            int postId = Integer.parseInt(idParam);
            ComuPostDao dao = new ComuPostDao();
            ComuPostDto post = dao.getPostById(postId);

            request.setAttribute("post", post);
        }
        
        private void updatePostProc(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            int postId = Integer.parseInt(request.getParameter("post_id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            ComuPostDao dao = new ComuPostDao();
            boolean result = dao.updatePost(postId, title, content); // ✅ DB 실제 수정 호출
            
            String msg = result == true? "게시글 수정완료." : "게시글 수정실패.";
            request.setAttribute("t_msg", msg);
            request.setAttribute("t_url", "Community");
            request.setAttribute("post_id", postId);
            request.setAttribute("t_gubun", "view");

        }



}
