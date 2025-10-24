package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBConnection;
import dto.NoticeDto;

public class NoticeDao {
	Connection con 		 = null;
	PreparedStatement ps = null;
	ResultSet rs 		 = null;

	//글번호 생성
	public String getNoticeNo() {
		String no = "";
		String sql="select nvl(max(n_no),'N000') as n_no\r\n"
				+ "from ondo_notice";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getString("n_no");
				no = no.substring(1);
				int ResultNo = Integer.parseInt(no) + 1;
				
				DecimalFormat df = new DecimalFormat("N000");
				no = df.format(ResultNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getNoticeNo() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return no;
	}

	//공지사항 등록
	public int noticeSave(NoticeDto dto) {
		int result=0;
		String sql="insert into ondo_notice\r\n"
				+ "(n_no, n_title, n_content, n_reg_id, n_reg_date, n_important, n_type)\r\n"
				+ "values\r\n"
				+ "('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','user001',to_date('"+dto.getReg_date()+"','yyyy-MM-dd hh24:mi:ss'),'"+dto.getImportant()+"','"+dto.getType()+"')";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("noticeSave() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}

	//목록 --페이징&검색조건시 수정 필요
	public ArrayList<NoticeDto> getNoticeList() {
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		String sql = "select n.n_no, n.n_title, m.m_name, to_char(n.n_reg_date, 'yy-MM-dd') as n_reg_date, \r\n"
				+ "       n.n_hit, n.n_type, n.n_important, n.n_attach_1, n.n_attach_2, n.n_attach_3\r\n"
				+ "    from ondo_notice n, ondo_member m\r\n"
				+ "    where n.n_reg_id = m.m_id\r\n"
				+ "    order by n.n_no desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString("n_no"); 
				String title = rs.getString("n_title"); 
				String name = rs.getString("m_name"); 
				String reg_date = rs.getString("n_reg_date");
				int hit = rs.getInt("n_hit");
				String type = rs.getString("n_type");
				String important = rs.getString("n_important");
				String attach_1 = rs.getString("n_attach_1");
				String attach_2 = rs.getString("n_attach_2");
				String attach_3 = rs.getString("n_attach_3");
				
				NoticeDto dto = new NoticeDto(no, title, name, reg_date, important, type, attach_1, attach_2, attach_3, hit);
				dtos.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getNoticeList() 오류 : "+sql);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}



}
