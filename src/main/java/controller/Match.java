package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import command.match.*;
import common.CommonExecute;
import common.CommonUtil;
import dao.MessageDao;

@WebServlet("/Match")
public class Match extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MessageDao messageDao = new MessageDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String gubun = request.getParameter("t_gubun");
        if (gubun == null) gubun = "main";

        String viewPage = "";

        if (gubun.equals("main")) {
            CommonExecute myInfo = new MatchMyInfo();
            myInfo.execute(request);

            CommonExecute interestList = new command.member.InterestList();
            interestList.execute(request);

            CommonExecute myInterest = new command.match.InterestList();
            myInterest.execute(request);

            viewPage = "match/match_main.jsp";

        } else if (gubun.equals("list")) {
            // 나의 정보
            CommonExecute myInfo = new MatchMyInfo();
            myInfo.execute(request);

            // 관심사 목록
            CommonExecute interestList = new command.member.InterestList();
            interestList.execute(request);

            // 매치 리스트
            CommonExecute match = new MatchList();
            match.execute(request);

         // 이미 메시지를 보낸 대상 ID 리스트 DB에서 가져오기
            String senderId = CommonUtil.getSessionInfo(request, "id");
            List<String> sentMessageList = messageDao.getSentMessageReceiverIds(senderId);
            request.setAttribute("sentMessageList", sentMessageList);

            System.out.println(sentMessageList.size());
            viewPage = "match/match_main.jsp";
        }

        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
