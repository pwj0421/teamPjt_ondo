package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

/**
 * Servlet implementation class MemberCheckId
 */
@WebServlet("/MemberCheckId")
public class MemberCheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		MemberDao dao = new MemberDao();
		String id = request.getParameter("m_id");
		String lang = request.getParameter("lang");
		int count = dao.memberCheckId(id);
		
		String result;
		if ("ja".equalsIgnoreCase(lang)) {
			// 🇯🇵 일본어 버전
			result = (count == 0) ? "使用可能" : "使用中";
		} else {
			// 🇰🇷 한국어 기본
			result = (count == 0) ? "사용가능" : "사용중";
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
