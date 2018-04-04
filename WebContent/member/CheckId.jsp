<%@page import="register.RegisterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String mem_id = request.getParameter("mem_id");
	
	RegisterDao dao = new RegisterDao();
	
	boolean isDuplicateId = dao.isDuplicateId(mem_id);
%>

<form action="join.jsp" id="return" method="post">
	<input type="hidden" name="dupChecked" value="true">
	<input type="hidden" name="isDuplicateId" value="<%=isDuplicateId%>">
	<input type="hidden" name="mem_id" value="<%=mem_id %>">
</form>

<script type="text/javascript">
	document.getElementById("return").submit();
</script>

