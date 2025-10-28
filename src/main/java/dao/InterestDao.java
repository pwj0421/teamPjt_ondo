package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConnection;
import dto.InterestDto;

public class InterestDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//카테고리 별 묶는 map 생성
	public Map<String, List<InterestDto>> getInterestMap() {
		Map<String, List<InterestDto>> interestMap = new HashMap<>();
		
		 Map<String, String> iconMap = new HashMap<>();
	        iconMap.put("C001", "💬");
	        iconMap.put("C002", "🎮");
	        iconMap.put("C003", "✈️");
	        iconMap.put("C004", "👥");
	        iconMap.put("C005", "💼");
	        iconMap.put("C006", "❤️");
	        iconMap.put("C007", "📍");
	        iconMap.put("C008", "🧩");
	        
		String sql = "select c.category_code, c.category_name, i.item_id, i.item_name\n"
				+ "from ondo_interest_category c\n"
				+ "join ondo_interest_item i on c.category_code = i.category_code\n"
				+ "order by c.category_code, i.item_id";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String category_name = rs.getString("category_name");
				String category_code = rs.getString("category_code");
				String icon = iconMap.getOrDefault(category_code, "❔");
				int item_id = rs.getInt("item_id");
				String item_name = rs.getString("item_name");
				
				InterestDto dto = new InterestDto(item_id, category_code, category_name, item_name, icon);
				//Map에 카테고리별로 그룹화
				interestMap.computeIfAbsent(category_name, k -> new ArrayList<>()).add(dto);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getInterestMap() 오류" + sql);
		} finally {
			DBConnection.closeDB(conn, pstmt, rs);
		}
		return interestMap;
	}
}
