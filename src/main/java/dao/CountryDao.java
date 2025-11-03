package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.CountryDto;

public class CountryDao {
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public List<CountryDto> getCountryList() {
    	List<CountryDto> list = new ArrayList<>();
    	String sql = "select country_code, country_name\n"
    			+ "from ondo_country_code\n"
    			+ "order by country_code";
    	try { 
    		conn = DBConnection.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			String country_code = rs.getString("country_code");
    			String country_name = rs.getString("country_name");
    			CountryDto dto = new CountryDto(country_code, country_name);
    			
    			list.add(dto);
    		}
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("getCountryList() 오류" + sql);
    	} finally {
    		DBConnection.closeDB(conn, pstmt, rs);
    	}
    	return list;
    }
}
