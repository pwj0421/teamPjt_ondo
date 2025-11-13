package command.member;

import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import dao.MyInfoUpdateDao;

public class MemberNickCheck implements CommonExecute {
    @Override
    public void execute(HttpServletRequest request) {
        String nick = request.getParameter("nick");
        String lang = request.getParameter("lang"); // ✅ 언어 파라미터 받기
        if (lang == null || lang.isEmpty()) lang = "ko";

        MyInfoUpdateDao dao = new MyInfoUpdateDao();
        boolean exist = dao.isNickExist(nick);
     // ✅ 다국어 텍스트 지정
        String resultText;
        if (exist) {
            resultText = lang.equals("ja") ? "使用中" : "사용중"; // 이미 사용 중
        } else {
            resultText = lang.equals("ja") ? "使用可能" : "사용가능"; // 사용 가능
        }

        // ✅ JSON 응답 문자열
        String json = "{\"result\":\"" + resultText + "\"}";
        request.setAttribute("json", json);
    }
}
