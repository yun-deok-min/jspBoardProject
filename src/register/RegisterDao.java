package register;
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
	
	public boolean isDuplicateId(String mem_id){
		try{
			conn = ds.getConnection();
			String sql = "select mem_id from member where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			result = pstmt.executeQuery();
			
			while(result.next()){
				return true; // 중복아이디 있음
			}
		}
		catch(Exception e){
			System.out.println("getAllId 오류");
			e.printStackTrace();
		}
		finally{
			freeResource();
		}
		return false;
	}

	public void registerMember(RegisterDto dto){
		try{
			conn = ds.getConnection();
			String sql = "insert into member(mem_id, mem_pw, mem_name, mem_eamil, mem_addr, mem_phone, mem_tel) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_pw());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getMem_email());
			pstmt.setString(5, dto.getMem_addr());
			pstmt.setString(6, dto.getMem_phone());
			pstmt.setString(7, dto.getMem_tel());

			pstmt.executeUpdate();
		}
		catch(Exception e){
			System.out.println("registerMember, 회원 정보 입력 오류");
			e.printStackTrace();
		}
		finally{
			freeResource();
		}
	}

	public void modifyMemberInfo(RegisterDto dto){
		try{
		}
		catch(Exception e){
			System.out.println("modifyMemberInfo, 회원 정보 생성 오류");
			e.printStackTrace();
		}
	}
}
















