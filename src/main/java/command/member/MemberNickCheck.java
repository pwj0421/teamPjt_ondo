package command.member;

import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import dao.MyInfoUpdateDao;

public class MemberNickCheck implements CommonExecute {
    @Override
    public void execute(HttpServletRequest request) {
        String nick = request.getParameter("nick");
        MyInfoUpdateDao dao = new MyInfoUpdateDao();
        boolean exist = dao.isNickExist(nick);

        // 라이브러리 없이 직접 JSON 문자열 생성
        String json = "{\"result\":\"" + (exist ? "exist" : "available") + "\"}";
        request.setAttribute("json", json);
    }
}
