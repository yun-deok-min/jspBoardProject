<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="register.RegisterDto"></jsp:useBean>    
<jsp:setProperty property="*" name="dto"></jsp:setProperty>

<jsp:useBean id="dao" class="register.RegisterDao"></jsp:useBean>

<%
	dao.registerMember(dto);
	response.sendRedirect("index.jsp");
%>
    