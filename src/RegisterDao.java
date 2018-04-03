import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RegisterDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet result;
	private DataSource ds;
	
	public RegisterDao(){
		try{
			Context initCtx = new InitialContext();
			ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jsp_beginner");
		}
		catch(Exception e){
			System.out.println("RegisterDao ������ ����");
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
			System.out.println("�ڿ� ���� ����");
			e.printStackTrace();
		}
	}
	
	public boolean isDuplicateId(String mem_id){
		try{
			conn = ds.getConnection();
			String sql = "select mem_id from member where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			result = pstmt.executeQuery();
			
			while(result.next()){
				return true; // �ߺ����̵� ����
			}
		}
		catch(Exception e){
			System.out.println("getAllId ����");
			e.printStackTrace();
		}
		finally{
			freeResource();
		}
		return false;
	}
}
















