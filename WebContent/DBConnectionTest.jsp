<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet result = null;
	
	String url = "jdbc:mysql://localhost:3306/jsp_beginner";
	String user = "master";
	String pw = "master";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		System.out.println("연결 성공");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(conn != null){
%>
		<h1>접속 성공</h1>
<% 		
	}
	else{
%>
		<h1>접속 실패</h1>
<% 
	}

%>

</body>
</html>



