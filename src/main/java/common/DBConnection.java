package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	
	public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("db 연결 종료 오류.");
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("rs 종료 오류.");
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("ps 종료 오류.");
				e.printStackTrace();
			}
		}
		
	}

	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이브가 없습니다.");
		}
		//2.database 접속
		
		//ip
		String db_url = "jdbc:oracle:thin:@1.245.91.203:1521:xe";
		//local
		//String db_url = "jdbc:oracle:thin:@jsl-704:1521:xe";
		String db_user = "track23_pjt";
		String db_pw = "5678";
		
		try {
			con = DriverManager.getConnection(db_url, db_user, db_pw);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db 계정설정 오류");
		}
		
		return con;
		
	}
}
