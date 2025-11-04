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

import dao.ComuPostDao;
import dao.ComuCommentDao;
import dao.ComuAttachmentDao;
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
        String gubun = request.getParameter("t_gubun");
        if ("insert".equals(gubun)) {
            insertPost(request, response);
        } else {
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
        ComuPostDto post = dao.getPostById(post_id);

        if (post == null) {
            response.sendRedirect("Community?t_gubun=list");
            return;
        }

        // 댓글
       ComuCommentDao cDao = new ComuCommentDao();
       List<ComuCommentDto> commentList = cDao.getCommentsByPostId(post_id);

        // 첨부파일
//        ComuAttachmentDao aDao = new ComuAttachmentDao();
//       List<ComuAttachmentDto> attachments = aDao.getAttachmentsByPostId(post_id);

//        request.setAttribute("post", post);
//        request.setAttribute("commentList", commentList);
//        request.setAttribute("attachments", attachments);

//        RequestDispatcher rd = request.getRequestDispatcher("Community/comu_view.jsp");
//       rd.forward(request, response);
    	}

    // 게시글 작성 처리
    private void insertPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인한 사용자 ID 가져오기
        String m_id = (String) request.getSession().getAttribute("loginId");
        if (m_id == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        ComuPostDto dto = new ComuPostDto();
        dto.setM_id(m_id);
        dto.setTitle(title);
        dto.setContent(content);

        ComuPostDao dao = new ComuPostDao();
        dao.insertPost(dto); // 게시글 DB 저장

        // 첨부파일 처리
        List<Part> parts = (List<Part>) request.getParts();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        ComuAttachmentDao aDao = new ComuAttachmentDao();
        for (Part part : parts) {
            if (part.getName().equals("file") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadPath + File.separator + fileName);

                ComuAttachmentDto aDto = new ComuAttachmentDto();
                aDto.setPost_id(dto.getPost_id()); // 방금 등록된 게시글 ID
                aDto.setFile_path(UPLOAD_DIR + "/" + fileName);
                aDto.setFile_type(fileName.substring(fileName.lastIndexOf(".") + 1));
                aDao.insertAttachment(aDto);
            }
        }

        response.sendRedirect("Community?t_gubun=list");
    }
}
