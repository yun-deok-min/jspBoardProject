<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	
	RegisterDao dao = new RegisterDao();
	
	if(dao.isDuplicateId(mem_id)){
		response.sendRedirect("join.jsp?dupChecked=true");
	}
	else{
		response.sendRedirect("join.jsp?dupChecked=false");
	}
%>