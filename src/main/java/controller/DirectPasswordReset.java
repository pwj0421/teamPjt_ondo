package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

/**
 * Servlet implementation class DirectPasswordReset
 */
@WebServlet("/DirectPasswordReset")
public class DirectPasswordReset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectPasswordReset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String id = request.getParameter("m_id");
		String newPassword = request.getParameter("newPassword");

		PrintWriter out = response.getWriter();

		try {
			MemberDao dao = new MemberDao();
			int result = dao.resetPassword(id, newPassword);

			if (result > 0) {
				out.print("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
			} else {
				out.print("해당 아이디를 찾을 수 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("비밀번호 변경 중 오류가 발생했습니다.");
		} finally {
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
