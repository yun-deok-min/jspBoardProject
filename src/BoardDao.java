import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet result;
	private DataSource ds;
	
	public BoardDao(){
		try{
			Context initCtx = new InitialContext();
			ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jsp_beginner");
		}
		catch(Exception e){
			System.out.println("RegisterDao 생성자 오류");
			e.printStackTrace();
		}
	}
	
	public void freeResource(){
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(result != null) result.close();
		}
		catch(Exception e){
			System.out.println("자원 해제 오류");
			e.printStackTrace();
		}
	}
}
















