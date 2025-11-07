package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import command.message.MessageChatContentExecute;
import command.message.MessageChatList;
import command.message.MessageMyRequest;
import command.message.MessageReceiveList;
import command.message.RequestStateCancel;
import command.message.RequestStateUpdate;
import common.CommonExecute;

@WebServlet("/Chat")
public class Chat extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Chat() { super(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String gubun = request.getParameter("t_gubun");
        if (gubun == null) gubun = "chatReceived";
        
        request.setAttribute("response", response);

        
        String viewPage="";
        String menuTap ="chatReceived";
        switch(gubun) {
        case "chatReceived":  //내가 받은 요청 리스트
            CommonExecute msgRequest = new MessageReceiveList();
            msgRequest.execute(request);
            menuTap ="chatReceived";
            viewPage = "Message/message_received.jsp";
            break;

        case "myRequest": //내가 보낸 요청 리스트
            CommonExecute myReq = new MessageMyRequest();
            myReq.execute(request);
            menuTap ="myRequest";
            viewPage = "Message/message_sent.jsp";
            break;

        case "MessageList": //대화방 목록
        	// 1. 친구 리스트
            CommonExecute msgRoom = new MessageChatList();
            msgRoom.execute(request);

            // 2. 첫 번째 방 메시지
            // r_dto에서 첫 번째 방 roomId 가져와서 msg_dto 로 세팅
            Object rObj = request.getAttribute("r_dto");
            if (rObj != null) {
                @SuppressWarnings("unchecked")
                java.util.List<?> rList = (java.util.List<?>) rObj;
                if (!rList.isEmpty()) {
                    String firstRoomId = ((dto.MessageChatDto) rList.get(0)).getRoomId();
                    request.setAttribute("roomId", firstRoomId);

                    CommonExecute chatContent = new MessageChatContentExecute();
                    chatContent.execute(request);
                }
                
             
            }
            
            menuTap = "MessageList";
            viewPage = "Message/message_chat.jsp";
            break;
            
            
        case "stateUpdate":
            CommonExecute state = new RequestStateUpdate();
            state.execute(request);
            viewPage = "common_alert_view.jsp";
            break;

        case "requestCancel":
            CommonExecute cancel = new RequestStateCancel();
            cancel.execute(request);
            viewPage = "common_alert_view.jsp";
            break;
            
        case "messageChatAjax":
            CommonExecute ajax = new command.message.MessageChatAjaxExecute();
            ajax.execute(request);
            return; // 매우 중요: 여기서 메서드 종료해서 rd.forward 하지 않도록

    }
        request.setAttribute("menuTap", menuTap);  
        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
