<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
 <script type="text/javascript">
 	var dupChecked = false;  // ���̵� �ߺ� Ȯ�� ��ư�� ��������
 	var isDuplicateId = true; // ���̵� �ߺ����� �ƴ��� 
 
 	// ���̵� �ߺ� Ȯ�� ��ư ������ ��, ����� �Լ� 
 	function CheckIdDup(){
 		// ���̵� �Է����� �ʰ� �ߺ� �˻� ��ư�� ���� ���
 		if(document.getElementById("mem_id").value == ""){ 
 			alert("���̵� �Է����ּ���");
 		}
 		else{
 			location.href = "CheckId.jsp?mem_id=" + document.getElementById("mem_id").value;
 		}
 	}
 </script>
 
 <%
 	request.setCharacterEncoding("UTF-8"); 
 	if(request.getParameter("isDuplicateId") != null){
  		if(request.getParameter("isDuplicateId").equals("true")){
 %>
 			<script type="text/javascript">
 				isDuplicateId = true;
 			</script>
 <% 
  		}
 	}
 	if(request.getParameter("dupChecked") != null){
  		if(request.getParameter("dupChecked").equals("true")){
 %>
 			<script type="text/javascript">
 				dupChecked = true;
 			</script>
 <% 
  		}
 	}
 %>
 
 <script type="text/javascript">
 	// ȸ������ ������ ��, ��ȿ�� �˻��� �Լ�
 	function CheckForm(){
 		var basicInfo = document.join.basicInfo;  // �ʼ� �Է� fieldset
 		var cnt = basicInfo.elements.length;      // �ʼ� �Է� fieldset�� input �±� ����
 		// alert(basicInfo.elements.length);
 		
 		for(i=0; i<cnt; i++){
 	 		if(basicInfo.elements[i].type =="text" || 
 	 				basicInfo.elements[i].type =="password" || 
 	 				basicInfo.elements[i].type =="eamil" ){
 	 			if(basicInfo.elements[i].value == ""){ // ���� ������� ���
 	 				alert("�⺻ ������ ��� �Է��ؾ� �մϴ�");
 	 				basicInfo.elements[i].focus();
 	 				return;
 	 			}
 	 			// ���� ������� �ʴٸ�, ó�� �Է°��� Ȯ�ΰ��� ������ Ȯ��
 	 			else{  
 	 				// ��й�ȣ�� �Է��� ����� ��й�ȣ Ȯ�ο� �Է��� ������ �ٸ� ���
 	 				if(basicInfo.elements[i].type == "password"){
 	 					if(document.getElementById("mem_pw").value !=
 	 							document.getElementById("mem_pw2").value){
 	 						alert("��й�ȣ�� �ٸ��ϴ�. Ȯ�����ּ���");
 	 						document.getElementById("mem_pw").focus();
 	 	 	 				return;
 	 					}
 	 				}
 	 				// �̸��Ͽ� �Է��� ����� �̸��� Ȯ�ο� �Է��� ������ �ٸ� ���
 	 				else if(basicInfo.elements[i].type == "email"){
 	 					if(document.getElementById("mem_email").value !=
 	 							document.getElementById("mem_email2").value){
 	 						alert("��й�ȣ�� �ٸ��ϴ�. Ȯ�����ּ���");
 	 						document.getElementById("mem_email").focus();
 	 	 	 				return;
 	 					}
 	 				}
 	 			}
 	 		} // input�±��� Ÿ���� �ؽ�Ʈ, �н�����, �̸����� ��� ����
 	 		else{
 	 			if(!dupChecked){ // ���̵� �ߺ� üũ �ǽ� ����
 	 				alert("���̵� �ߺ� �˻縦 ���ּ���");
 	 				basicInfo.elements[i].focus();
 	 				return;
 	 			}
 	 			else{ // ���̵� �ߺ� üũ�� ������ ������
 	 				  // �ߺ����� �Ǹ�Ǿ��� �������� ���� ���¿��� ȸ������ ��ư�� ���� ���
 	 				if(isDuplicateId){
 	 		 			alert("�ߺ��� ���̵� �Դϴ�. ���̵� �������ּ���");
 	 		 			return;
 	 		 		}
 	 			}
 	 		}
 		} // for�� ����
 		
 		document.join.submit();  // ������ ��� �����ؼ� return���� ������ �������, ȸ������ ó��
 	}
 </script>
</head>
<body>
<div id="wrap">
<!-- ������� �� -->
<jsp:include page="../inc/top.jsp" />
<!-- ������� �� -->

<!-- �������� �� -->
<!-- ���������̹��� -->
<div id="sub_img_member"></div>
<!-- ���������̹��� -->
<!-- ���ʸ޴� -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- ���ʸ޴� -->
<!-- �������� -->
<article>
<h1>Join Us</h1>
<form action="join_pro.jsp" id="join" name="join">
<fieldset name="basicInfo">
<legend>Basic Info</legend>
<label>���̵�</label>
<input type="text" name="mem_id" id="mem_id" class="id" required="required">
<input type="button" value="���̵� �ߺ� üũ" class="dup" onclick="CheckIdDup()"><br>
<label>��й�ȣ</label>
<input type="password" name="mem_pw" id="mem_pw"><br>
<label>��й�ȣ Ȯ��</label>
<input type="password" name="mem_pw2" id="mem_pw2"><br>
<label>�̸�</label>
<input type="text" name="mem_name"><br>
<label>�̸���</label>
<input type="email" name="mem_email" id="mem_email"><br>
<label>�̸��� Ȯ��</label>
<input type="email" name="mem_email2" id="mem_email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>�ּ�</label>
<input type="text" name="mem_addr"><br>
<label>�� ��ȭ</label>
<input type="text" name="mem_tel"><br>
<label>�޴���</label>
<input type="text" name="mem_phone"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<!-- <input type="submit" value="ȸ������" class="submit"> -->
<input type="button" value="ȸ������" class="submit" onclick="CheckForm()"> 
<input type="reset" value="���" class="cancel">
</div>
</form>
</article>
<!-- �������� -->
<!-- �������� �� -->

<div class="clear"></div>
<!-- Ǫ�͵��� �� -->
<jsp:include page="../inc/bottom.jsp" />
<!-- Ǫ�͵��� �� -->
</div>
</body>
</html>