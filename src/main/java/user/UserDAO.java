package user;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn; // DB 연결
    private PreparedStatement pstmt; //쿼리문 대기 및 설정
    private ResultSet rs; //결과값

    //기본 생성자
    //UserDAO가 실행되면 자동으로 생성
    public UserDAO() {
        try {
            String dbURL = "jdbc:mariadb://localhost:3306/jsp_board";
            String dbID = "root";
            String dbPassword = "root506";
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (ClassNotFoundException e) {
            System.out.println("----- 드라이버 로드 실패 -----");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("----- DB 접속 실패 -----");
            e.printStackTrace();
        }
    }
    
    // 로그인 기능
    public int login(String userID, String userPassword) {
        String sql = "select userPassword from user where userID = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 넣음
            rs = pstmt.executeQuery(); //쿼리 결과를 rs에 저장
            if(rs.next()) {
                if(rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                }else
                    return 0; //비밀번호 틀림
            }
            return -1; //아이디 없음
        }catch (Exception e) {
            e.printStackTrace();
        }
        return -2; //오류
    }

    // 회원가입 기능
    public int join(User user) {
        String sql = "insert into user values(?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
}