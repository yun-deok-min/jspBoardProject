<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
<%
 	request.setCharacterEncoding("UTF-8"); 
	String mem_id = "";
	
 	// CheckId.jsp 에게 값을 받지 않은 경우(=처음 페이지를 열었을 때)
 	if(request.getParameter("dupChecked") == null){ 
%>
  		<script type="text/javascript">
  			var dupChecked = false;  // 아이디 중복 확인 버튼을 눌렀는지
  		 	var isDuplicateId = true; // 아이디가 중복인지 아닌지 
  		</script>
<%
 	}
 	// CheckId.jsp 에게 값을 받을 때
 	else{
 		mem_id = request.getParameter("mem_id");
 		
 		// 이미 db에 있는 아이디일 경우
 		if(request.getParameter("isDuplicateId").equals("true")){
%>
 			<script type="text/javascript">
 				var isDuplicateId = true;
 			</script>
 <% 
  		}
 		// db에 없어서 사용가능한 아이디일 경우, isDuplicateId = false
 		else{
 %>
 			<script type="text/javascript">
 				var isDuplicateId = false;
 			</script>
 <% 
 		}
 		
 		// 아이디 중복 체크 버튼을 클릭해서 확인 했음을 저장
  		if(request.getParameter("dupChecked").equals("true")){
 %>
  			<script type="text/javascript">
  				var dupChecked = true;
  			</script>
 <%   		
  		}
 	} // CheckId.jsp에게 값을 받은경우를 처리하는 else문 종료
 %>
 
 <script type="text/javascript">
	//아이디 중복 확인 버튼 눌렀을 때, 실행될 함수 
	function CheckIdDup(){
		// 아이디를 입력하지 않고 중복 검사 버튼을 누를 경우
		if(document.getElementById("mem_id").value == ""){ 
			alert("아이디를 입력해주세요");
		}
		else{
			location.href = "CheckId.jsp?mem_id=" + document.getElementById("mem_id").value;
		}
	}
	
 	// 회원가입 눌렀을 때, 유효성 검사할 함수
 	function CheckForm(){
 		var basicInfo = document.join.basicInfo;  // 필수 입력 fieldset
 		var cnt = basicInfo.elements.length;      // 필수 입력 fieldset의 input 태그 갯수
 		// alert(basicInfo.elements.length);
 		
 		for(i=0; i<cnt; i++){
 	 		if(basicInfo.elements[i].type =="text" || 
 	 				basicInfo.elements[i].type =="password" || 
 	 				basicInfo.elements[i].type =="email" ){
 	 			if(basicInfo.elements[i].value == ""){ // 값이 비어있을 경우
 	 				alert("기본 정보는 모두 입력해야 합니다");
 	 				basicInfo.elements[i].focus();
 	 				return;
 	 			}
 	 			// 값이 비어있지 않다면, 처음 입력값과 확인값이 같은지 확인
 	 			else{  
 	 				// 비밀번호에 입력한 내용과 비밀번호 확인에 입력한 내용이 다른 경우
 	 				if(basicInfo.elements[i].type == "password"){
 	 					if(document.getElementById("mem_pw").value !=
 	 							document.getElementById("mem_pw2").value){
 	 						alert("비밀번호가 다릅니다. 확인해주세요");
 	 						document.getElementById("mem_pw").focus();
 	 	 	 				return;
 	 					}
 	 				}
 	 				// 이메일에 입력한 내용과 이메일 확인에 입력한 내용이 다른 경우
 	 				else if(basicInfo.elements[i].type == "email"){
 	 					if(document.getElementById("mem_email").value !=
 	 							document.getElementById("mem_email2").value){
 	 						alert("이메일이 다릅니다. 확인해주세요");
 	 						document.getElementById("mem_email").focus();
 	 	 	 				return;
 	 					}
 	 				}
 	 			}
 	 		} // input태그의 타입이 텍스트, 패스워드, 이메일인 경우 종료
 	 		else{
 	 			if(!dupChecked){ // 아이디 중복 체크 실시 여부
 	 				alert("아이디 중복 검사를 해주세요");
 	 				basicInfo.elements[i].focus();
 	 				return;
 	 			}
 	 			// input태그의 타입이 버튼인 경우(=아이디 중복 체크 버튼)
 	 			else{ // 아이디 중복 체크를 한적은 있지만
 	 				  // 중복으로 판명되었고 수정하지 않은 상태에서 회원가입 버튼을 누른 경우
 	 				if(isDuplicateId){
 	 		 			alert("중복된 아이디 입니다. 아이디를 변경해주세요");
 	 		 			return;
 	 		 		}
 	 			}
 	 		}
 		} // for문 종료
 		
 		document.join.submit();  // 조건을 모두 만족해서 return문을 만나지 않은경우, 회원가입 처리
 	}
 </script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="join_pro.jsp" id="join" name="join">
<fieldset name="basicInfo">
<legend>Basic Info</legend>
<label>아이디</label>
<input type="text" name="mem_id" id="mem_id" class="id" value="<%=mem_id%>">
<input type="button" value="아이디 중복 체크" class="dup" onclick="CheckIdDup()"><br>
<label>비밀번호</label>
<input type="password" name="mem_pw" id="mem_pw"><br>
<label>비밀번호 확인</label>
<input type="password" name="mem_pw2" id="mem_pw2"><br>
<label>이름</label>
<input type="text" name="mem_name"><br>
<label>이메일</label>
<input type="email" name="mem_email" id="mem_email"><br>
<label>이메일 확인</label>
<input type="email" name="mem_email2" id="mem_email2"><br>
</fieldset>

<!-- 

<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소">
<input type="text" id="sample6_address2" placeholder="상세주소">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

 -->

<fieldset>
<legend>Optional</legend>
<label>주소</label>
<input type="text" name="mem_addr"><br>
<label>집 전화</label>
<input type="text" name="mem_tel"><br>
<label>휴대폰</label>
<input type="text" name="mem_phone"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<!-- <input type="submit" value="회원가입" class="submit"> -->
<input type="button" value="회원가입" class="submit" onclick="CheckForm()"> 
<input type="reset" value="취소" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>