package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.PurposeDto;

public class PurposeDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<PurposeDto> getPurposeList() {
		List<PurposeDto> dtos = new ArrayList<>();
		String sql = "select purpose_code, purpose_name\n"
				+ 	 "from ondo_purpose_category\n"
				+ 	 "order by purpose_code";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String purpose_code = rs.getString("purpose_code");
				String purpose_name = rs.getString("purpose_name");
				PurposeDto dto = new PurposeDto(purpose_code, purpose_name);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getPurposeList() 오류 :" + sql);
		} finally {
			DBConnection.closeDB(conn, pstmt, rs);
		}
		return dtos;
	}
}
