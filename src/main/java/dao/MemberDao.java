package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.MemberDto;

public class MemberDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int memberSave(MemberDto dto, String[] interestItem) {
	    int result = 0;
	    String currentSql = "";  //현재 실행 중 SQL 추적용
	    String sqlMember = "INSERT INTO ondo_member ("
	        + "m_id, m_password, m_name, m_age, m_gender, m_country, "
	        + "m_zipcode, m_address, m_address_detail, "
	        + "m_tel1, m_tel2, m_tel3, "
	        + "m_email1, m_email2, "
	        + "m_type, m_recommender, "
	        + "m_reg,"
	        + "m_nickname, m_image, m_tel_country_code"
	        + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'),?,?,?)";
	    
	    String sqlInterest = "insert into ondo_member_interest (member_id, item_id) values (?, ?)";
	    try {
	        conn = DBConnection.getConnection();
	        conn.setAutoCommit(false);
	        
	        currentSql = "ondo_member INSERT"; 
	        pstmt = conn.prepareStatement(sqlMember);
	        
	        pstmt.setString(1,  dto.getM_id());
	        pstmt.setString(2,  dto.getM_password());
	        pstmt.setString(3,  dto.getM_name());
	        pstmt.setInt(4,     dto.getM_age());
	        pstmt.setString(5,  dto.getM_gender());
	        pstmt.setString(6,  dto.getM_country());
	        pstmt.setString(7,  dto.getM_zipcode());
	        pstmt.setString(8,  dto.getM_address());
	        pstmt.setString(9,  dto.getM_address_detail());
	        pstmt.setString(10, dto.getM_tel1());
	        pstmt.setString(11, dto.getM_tel2());
	        pstmt.setString(12, dto.getM_tel3());
	        pstmt.setString(13, dto.getM_email1());
	        pstmt.setString(14, dto.getM_email2());
	        pstmt.setString(15, dto.getM_type());
	        pstmt.setString(16, dto.getM_recommender());
	        pstmt.setString(17, dto.getM_reg());      // 문자열 날짜 ("YYYY-MM-DD HH24:MI:SS")
	        pstmt.setString(18, dto.getM_nickname());
	        pstmt.setString(19, dto.getM_image());
	        pstmt.setString(20, dto.getM_tel_country_code());

	        result = pstmt.executeUpdate();
	        pstmt.close();
	        
	     // 관심사 매핑 INSERT (선택된 item_id 개수만큼)
	        currentSql = "ondo_member_interest INSERT";
	        if (interestItem != null && interestItem.length > 0) {
	        	pstmt = conn.prepareStatement(sqlInterest);
	        	for(String itemId : interestItem) {
	        		pstmt.setString(1, dto.getM_id());
	        		pstmt.setInt(2, Integer.parseInt(itemId));
	        		pstmt.addBatch();
	        	}
	        	pstmt.executeBatch();
	        	if (pstmt != null) pstmt.close();
	        }
	        conn.commit();
	        
	    } catch (Exception e) {
	    	 System.out.println("memberSave() 오류 발생!");
	         System.out.println("실패 SQL 단계: " + currentSql);  //어디서 터졌는지
	         e.printStackTrace();
	        try { 
	        	conn.rollback(); 
	        } catch (Exception rollbackEx) { 
	        	rollbackEx.printStackTrace(); 
	        }
	    } finally {
	        DBConnection.closeDB(conn, pstmt, null);
	    }

	    return result;
	}
	
	//️⃣ 가입 목적 저장
	public int insertMemberPurpose(String m_id, String purpose_code) {
	    int result = 0;
	    String sql = "INSERT INTO ondo_member_purpose (m_id, purpose_code) VALUES (?, ?)";
	    try {
	        conn = DBConnection.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, m_id);
	        pstmt.setString(2, purpose_code);
	        result = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("insertMemberPurpose() 오류: " + sql);
	    } finally {
	        DBConnection.closeDB(conn, pstmt, null);
	    }
	    return result;
	}

	// 비밀번호 암호화
	   public String encryptSHA256(String value) throws NoSuchAlgorithmException{
	        String encryptData ="";
	        
	        MessageDigest sha = MessageDigest.getInstance("SHA-256");
	        sha.update(value.getBytes());
	 
	        byte[] digest = sha.digest();
	        for (int i=0; i<digest.length; i++) {
	            encryptData += Integer.toHexString(digest[i] &0xFF).toUpperCase();
	        }
	         
	        return encryptData;
	    }

	   public String memberLogin(String id, String password) {
		   String name = "";
		   String sql = "select m_name from ondo_member\n"
		   		+ "where m_id = ?\n"
		   		+ "and m_password = ?\n"
		   		+ "and m_quit is null";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, password);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   name = rs.getString("m_name");
			   }
		   } catch (Exception e) {
			   e.printStackTrace();
			   System.out.println("memberLogin() 오류" + sql);
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   return name;
	   }

	   public int memberCheckId(String id) {
		   int count = 0;
		   String sql = "select count(*) as count\n"
		   		+ "from ondo_member\n"
		   		+ "where m_id = ?";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   count = rs.getInt("count");
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("memberCheckId() 오류 : " + sql);
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   return count;
	   }
	   //내정보
	   public MemberDto getMemberInfo(String id) {
		   MemberDto dto = null;
		   String sql = "SELECT m_id, m_type, m_age, m_password, m_nickname, m_image, m_name, m_gender, m_country,\n" +
	                 "m_zipcode, m_address, m_address_detail, m_email1, m_email2,\n" +
	                 "m_tel_country_code, m_tel1, m_tel2, m_tel3,\n" +
	                 "m_purpose,\n" +
	                 "m_recommender, TO_CHAR(m_reg, 'YYYY-MM-DD hh24:mi:ss') AS m_reg,\n" +
	                 "TO_CHAR(m_updated, 'YYYY-MM-DD hh24:mi:ss') AS m_updated\n" +
	                 "FROM ondo_member " +
	                 "WHERE m_id = ?";;
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   if (rs.next()) {
				    String m_id = rs.getString("m_id");
		            String m_name = rs.getString("m_name");
		            String m_nickname = rs.getString("m_nickname");
		            String m_image = rs.getString("m_image");
		            String m_gender = rs.getString("m_gender");
		            String m_country = rs.getString("m_country");
		            String m_zipcode = rs.getString("m_zipcode");
		            String m_address = rs.getString("m_address");
		            String m_address_detail = rs.getString("m_address_detail");
		            String m_tel_country_code = rs.getString("m_tel_country_code");
		            String m_tel1 = rs.getString("m_tel1");
		            String m_tel2 = rs.getString("m_tel2");
		            String m_tel3 = rs.getString("m_tel3");
		            String m_email1 = rs.getString("m_email1");
		            String m_email2 = rs.getString("m_email2");
		            String m_type = rs.getString("m_type");
		            String m_recommender = rs.getString("m_recommender");
		            String m_reg = rs.getString("m_reg");
		            String m_updated = rs.getString("m_updated");
		            int m_age = rs.getInt("m_age");

		            //회원이 선택한 가입 목적 불러오기
		            String sqlPulpose = "select purpose_code\n"
		            		+ "from ondo_member_purpose\n"
		            		+ "where m_id = ?";
		            PreparedStatement pstmt2 = conn.prepareStatement(sqlPulpose);
		            pstmt2.setString(1, id);
		            ResultSet rs2 = pstmt2.executeQuery();
		            List<String> purposeList = new ArrayList<>();
		            while(rs2.next()) {
		            	purposeList.add(rs2.getString("purpose_code"));
		            }
		            
		            dto = new MemberDto(
		                    m_id, m_name, m_nickname, m_image, m_gender,
		                    m_country, m_zipcode, m_address, m_address_detail,
		                    m_tel1, m_tel2, m_tel3, m_email1, m_email2,
		                    m_type, m_recommender,
		                    m_reg, m_updated, m_age, m_tel_country_code
		            );
		            dto.setPurposeCode(purposeList);
			   }
		   } catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("getMemberInfo() 오류 : " + sql); 
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		return dto;
	   }
	   public MemberDto getMemberInfo(String id, String password) {
		    MemberDto dto = null;
		    String sql = "SELECT m_id, m_name, m_password, m_type, m_quit, m_image "
		               + "FROM ondo_member "
		               + "WHERE m_id = ? AND m_password = ?";

		    try {
		        conn = DBConnection.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, id);
		        pstmt.setString(2, password);
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            // ✅ 1️⃣ 결과값 먼저 꺼내기
		            String m_id = rs.getString("m_id");
		            String m_name = rs.getString("m_name");
		            String m_password = rs.getString("m_password");
		            String m_type = rs.getString("m_type");
		            String m_quit = rs.getString("m_quit");
		            String m_image = rs.getString("m_image");

		            dto = new MemberDto(m_id, m_name, m_password, m_type, m_quit, m_image);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("getMemberInfo(id, pw) 오류: " + sql);
		    } finally {
		        DBConnection.closeDB(conn, pstmt, rs);
		    }

		    return dto;
		}
	   public int memberUpdate(MemberDto dto) {
		   int result = 0;
		   String sql = "UPDATE ondo_member SET "
			        + "m_name=?, m_age=?, m_gender=?, m_country=?, m_zipcode=?, m_address=?, m_address_detail=?, "
			        + "m_tel1=?, m_tel2=?, m_tel3=?, m_tel_country_code=?, "
			        + "m_email1=?, m_email2=?, m_type=?, m_image=?, m_updated=to_date(?, 'yyyy-MM-dd HH24:mi:ss') "
			        + "WHERE m_id=?";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, dto.getM_name());
			   pstmt.setInt(2, dto.getM_age());
			   pstmt.setString(3, dto.getM_gender());
			   pstmt.setString(4, dto.getM_country());
			   pstmt.setString(5, dto.getM_zipcode());
			   pstmt.setString(6, dto.getM_address());
			   pstmt.setString(7, dto.getM_address_detail());
			   pstmt.setString(8, dto.getM_tel1());
			   pstmt.setString(9, dto.getM_tel2());
			   pstmt.setString(10, dto.getM_tel3());
			   pstmt.setString(11, dto.getM_tel_country_code());
			   pstmt.setString(12, dto.getM_email1());
			   pstmt.setString(13, dto.getM_email2());
			   pstmt.setString(14, dto.getM_type());
			   pstmt.setString(15, dto.getM_image());
			   pstmt.setString(16, dto.getM_updated());
			   pstmt.setString(17, dto.getM_id());
			   
			   result = pstmt.executeUpdate();
			   pstmt.close();
			   
			   //가입목적 갱신
			   String sqlDelete ="delete from ondo_member_purpose where m_id=?";
			   pstmt = conn.prepareStatement(sqlDelete);
			   pstmt.setString(1, dto.getM_id());
			   pstmt.executeUpdate();
			   pstmt.close();
			   
			   if(dto.getPurposeCode() != null && !dto.getPurposeCode().isEmpty()) {
				   String sqlInsert = "insert into ondo_member_purpose (m_id, purpose_code) values (?, ?)";
				   pstmt = conn.prepareStatement(sqlInsert);
				   for (String code : dto.getPurposeCode()) {
					   pstmt.setString(1, dto.getM_id());
					   pstmt.setString(2, code);
					   pstmt.addBatch();
				   }
				   pstmt.executeBatch();
				   pstmt.close();
			   }
			   conn.commit();
			   
		   } catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("memberUpdate() 오류 : " + sql);
		   } finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   return result;
	   }

	   public int memberDeleteAccount(String id, String exit_date) {
		   int result = 0;
		   String sql = "update ondo_member\n"
		   		+ "set m_quit = TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS')\n"
		   		+ "where m_id = ?";
		   try {
			   conn = DBConnection.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, exit_date);
			   pstmt.setString(2, id);
			   result = pstmt.executeUpdate();
		   }catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("memberDeleteAccount() 오류" + sql);
		   }finally {
			   DBConnection.closeDB(conn, pstmt, rs);
		   }
		   
		return result;
	   }

	   public boolean isQuitMember(String id) {
		    boolean result = false;
		    String sql = "SELECT m_quit FROM ondo_member WHERE m_id = ?";
		    try {
		        conn = DBConnection.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, id);
		        rs = pstmt.executeQuery();
		        if (rs.next()) {
		            String quitDate = rs.getString("m_quit");
		            if (quitDate != null && !quitDate.isEmpty()) {
		                result = true; 
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("isQuitMember() 오류: " + sql);
		    } finally {
		        DBConnection.closeDB(conn, pstmt, rs);
		    }
		    return result;
		}

	   
	   
}
