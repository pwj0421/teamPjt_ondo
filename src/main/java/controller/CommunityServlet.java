package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.CommonUtil;
import dao.ComuPostDao;
import dao.ComuCommentDao;

import dto.ComuPostDto;
import dto.ComuCommentDto;
import dto.ComuAttachmentDto;

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

        switch (gubun) {
            case "list":
                listPosts(request, response);
                break;
            case "view":
                viewPost(request, response);
                break;
            case "write":
                RequestDispatcher rd = request.getRequestDispatcher("Community/comu_write.jsp");
                rd.forward(request, response);
                break;
            default:
                listPosts(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String gubun = request.getParameter("t_gubun");
        if ("insert".equals(gubun)) {
            insertPost(request, response);
        } else if ("delete".equals(gubun)) {   // ✅ 게시글 삭제 추가
            deletePost(request, response);
        }  else if ("update".equals(gubun)) {
            updatePost(request, response);
        }  else if ("updateProc".equals(gubun)) {
            updatePostProc(request, response);
        }  else {
            doGet(request, response);
        }
    }

    // 게시글 리스트
    private void listPosts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ComuPostDao dao = new ComuPostDao();
        List<ComuPostDto> postList = dao.getPostList();
        
        System.out.println("게시글 수: " + postList.size());
        
        request.setAttribute("postList", postList);

        RequestDispatcher rd = request.getRequestDispatcher("Community/comu_list.jsp");
        rd.forward(request, response);
    }

    // 게시글 상세보기
    private void viewPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String postIdParam = request.getParameter("post_id");
        
        if (postIdParam == null) {
            response.sendRedirect("Community?t_gubun=list");
            return;
        }

        int post_id = Integer.parseInt(postIdParam);
        ComuPostDao dao = new ComuPostDao();
       
        
            dao.increaseHit(post_id);
           
        
        ComuPostDto post = dao.getPostById(post_id);
       
        if (post == null) {
            response.sendRedirect("Community?t_gubun=list");
            return;
        }
        
        request.setAttribute("post", post);


       	  RequestDispatcher rd = request.getRequestDispatcher("Community/comu_view.jsp");
          rd.forward(request, response);
    	
    	}
    

    // 게시글 작성 처리
    private void insertPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인한 사용자 ID 가져오기
        String m_id = (String) CommonUtil.getSessionInfo(request, "id");
        if (m_id == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        ComuPostDao dao = new ComuPostDao();
        
        
        int no = dao.getComuNo();
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        ComuPostDto dto = new ComuPostDto();
        dto.setPost_id(no);
        dto.setM_id(m_id);
        dto.setTitle(title);
        dto.setContent(content);

        dao.insertPost(dto); // 게시글 DB 저장

        

        RequestDispatcher rd = request.getRequestDispatcher("Community/comu_list.jsp");
        rd.forward(request, response);
    }
        
        // ✅ 게시글 삭제 처리 (POST 방식)
        private void deletePost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            request.setCharacterEncoding("UTF-8");

            String postIdParam = request.getParameter("post_id");
            if (postIdParam == null || postIdParam.isEmpty()) {
                response.sendRedirect("Community?t_gubun=list");
                return;
            }

            int post_id = Integer.parseInt(postIdParam);

            ComuPostDao dao = new ComuPostDao();
            boolean isDeleted = dao.deletePost(post_id);

            if (isDeleted) {
                System.out.println("게시글 삭제 성공: " + post_id);
                response.sendRedirect("Community?t_gubun=list");
            } else {
                System.out.println("게시글 삭제 실패: " + post_id);
                response.sendRedirect("Community?t_gubun=view&post_id=" + post_id + "&error=delete_failed");
            }
    }
        
        //게시글 업데이트 열기
        private void updatePost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String idParam = request.getParameter("post_id");
            if (idParam == null || idParam.isEmpty()) {
                // post_id 안 넘어오면 리스트로 돌려보내기
                response.sendRedirect("Community?t_gubun=list");
                return;
            }

            int postId = Integer.parseInt(idParam);
            ComuPostDao dao = new ComuPostDao();
            ComuPostDto post = dao.getPostById(postId);

            request.setAttribute("post", post);
            RequestDispatcher rd = request.getRequestDispatcher("Community/comu_update.jsp");
            rd.forward(request, response);
        }
        
        private void updatePostProc(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            request.setCharacterEncoding("UTF-8");

            int postId = Integer.parseInt(request.getParameter("post_id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            ComuPostDao dao = new ComuPostDao();
            boolean result = dao.updatePost(postId, title, content); // ✅ DB 실제 수정 호출

            System.out.println("update result: " + result); // 로그 찍기 (true/false 확인)

            response.sendRedirect("Community?t_gubun=view&post_id=" + postId);
        }



}
