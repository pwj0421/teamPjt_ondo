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
			try {
				MemberDao dao = new MemberDao();
				
				String name = request.getParameter("m_name");
				String email = request.getParameter("m_email");
				
				boolean exist = dao.checkUserMatch(name, email);
				
				    
				//응답 본문에 텍스트를 직접 쓰기 위한 도구입니다.
		        PrintWriter out = response.getWriter();
		        out.print(exist ? "EXIST" : "NOT_EXIST");
		        out.close();
			} catch (Exception e) {
	            e.printStackTrace();
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
