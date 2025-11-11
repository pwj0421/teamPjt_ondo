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
 * Servlet implementation class UserCheck
 */
@WebServlet("/UserCheck")
public class UserCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        String name = request.getParameter("m_name");
        String id = request.getParameter("m_id");
        String email = request.getParameter("m_email");

        MemberDao dao = new MemberDao();
        boolean exist = false;

        try {
            if (id != null && !id.isEmpty()) {
                // 비밀번호 찾기용 (아이디 + 이메일)
                exist = dao.checkMemberByIdEmail(id, email);
            } else {
                // 아이디 찾기용 (이름 + 이메일)
                exist = dao.checkMemberByNameEmail(name, email);
            }

            PrintWriter out = response.getWriter();
            out.print(exist ? "EXIST" : "NOT_EXIST");
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("ERROR");
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
