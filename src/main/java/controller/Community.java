package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.community.CommunityUpdate;
import common.CommonExecute;

/**
 * Servlet implementation class FreeComu
 */
//@WebServlet("/Community")
public class Community extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Community() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun = "list";
		
		String msg="";
		String viewPage="";
		
		if(gubun.equals("list")) {
			viewPage = "Community/comuList.jsp";
			
		}else if(gubun.equals("view")){
			viewPage = "Community/community_view.jsp";
		
		
		}else if(gubun.equals("write")) {
			viewPage = "Community/community_write.jsp";
		}else if(gubun.equals("updateForm")) {
			viewPage = "Community/community_update.jsp";
		}else if(gubun.equals("DBUpdate")) {
			CommonExecute comu = new CommunityUpdate();
			comu.execute(request);
			viewPage = "common_alert_view.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
