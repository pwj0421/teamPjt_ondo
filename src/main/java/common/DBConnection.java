package common;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	
	// 설정 파일 이름 (클래스패스 기준)
    private static final String PROP_FILE = "/db.properties";

    private static String DB_URL;
    private static String DB_USER;
    private static String DB_PW;

    static {
        Properties props = new Properties();

        try (InputStream in = DBConnection.class.getResourceAsStream(PROP_FILE)) {

            if (in == null) {
                throw new IllegalStateException("DB 설정 파일을 찾을 수 없습니다: " + PROP_FILE);
            }

            props.load(in);

            // 설정값 읽기
            String driver = props.getProperty("db.driver", "oracle.jdbc.driver.OracleDriver");
            DB_URL  = props.getProperty("db.url");
            DB_USER = props.getProperty("db.user");
            DB_PW   = props.getProperty("db.password");

            if (DB_URL == null || DB_USER == null || DB_PW == null) {
                throw new IllegalStateException("db.url / db.user / db.password 설정이 누락되었습니다.");
            }

            // 드라이버 로드 (예전 코드와 동일한 역할, 한 번만 실행)
            Class.forName(driver);

        } catch (IOException e) {
            System.out.println("DB 설정 파일을 읽는 중 오류가 발생했습니다.");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        } catch (ClassNotFoundException e) {
            System.out.println("DB 드라이버 클래스를 찾을 수 없습니다.");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        } catch (RuntimeException e) {
            // 위에서 던진 IllegalStateException 등
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("db 연결 종료 오류.");
                e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.out.println("rs 종료 오류.");
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                System.out.println("ps 종료 오류.");
                e.printStackTrace();
            }
        }
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PW);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("db 계정설정 오류");
        }
        return con;
    }
}
