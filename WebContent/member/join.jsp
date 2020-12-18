<%@ include file = "/include/dbconnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<style>
	body{
		padding:0;
		border-spacing:0;
		margin:0;
	}
	.a{
	font-family: cursive;
	text-align:center;
	}
	table{
		border:0px solid black;
	}
	.b{
		background-color:#99BCDC;
		width:100%;
		height:80px;
		border:1px solid #93C1E3;
	}
	.c{
		font-size:13px;
	}
	.bt{
		border:0px solid black;
		text-align:center;
	}
	.bt2{
		width:100px;
		height: 60px;
		background-color:#99bcdc;
		border:1px solid #99bcdc;
	}
</style>
<%request.setCharacterEncoding("utf-8");%>
<script type="text/javascript">
	function send(){
		var mi=member_insert;
		if(mi.id.value == ""){
			alert("아이디를 입력 하세요.");
			mi.id.focus();
			return ;
		}
		if(mi.pInput.value == "n"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if(!mi.pass.value ){
			alert("비밀번호를 입력 하세요.");
			mi.pass.focus();
			return ;
		}
		if(mi.pass.value !== mi.pass2.value){
			alert("비밀번호를 동일하게 입력하세요.");
			mi.pass.focus();
			return ;
		}
		if( isNaN(mi.name.value == false )){
			alert("이름은 문자만 입력 가능합니다.");
			mi.name.focus();
			return false;
		}
		/*if(!mi.zip.value ){
			alert("주소를 입력 하세요.");
			mi.zip1.focus();
			return;
		}
		if(!mi.zip1.value ){
			alert("주소를 입력 하세요.");
			mi.zip2.focus();
			return;
		}*/
		mi.submit();
	}
	/* 아이디 중복체크 화면 오픈 */
	function openIdChk(){
		window.name = "parentForm";
		var id2 = member_insert.id.value;
		window.open("IdCheckForm.jsp?id_value='"+id2+"'","chkForm","width=500, height=300, resizable = no, scrollbars = no");
	}
	/* 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 
	다시 중복체크를 하도록 한다.*/
	function inputIdChk(){
		document.userInfo.id_check_val.value = "idUncheck";
	}
</script>

<body>

<table class="b">
	<tr>
		<td></td>
	</tr>
</table>

<h1 class="a">Join<h1>


<table width=1000 height=800 align=center class="c">
	<form name="member_insert" action="join_insert.jsp" method="get">
	<input type = "hidden" id="pInput" name="pInput" value="n">
	<tr>
		<td><input type="hidden" id="id_check_val" name="id_check_val"></td>
		<td></td>
	</tr>
	<tr>
		<td style="border-top:1px" >&nbsp&nbsp회원구분<font color=red>&bull;<font></td>
		<td  colspan=3><input type="radio" name="회원" value="1" checked >
		개인회원</input></td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!------------------기본정보------------------->
	<tr>
		<td colspan=4>&nbsp&nbsp기본정보</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<tr >
		<td  >&nbsp&nbsp아이디<font color=red>&bull;</font></td>
		<td colspan=3>
		<input  type="text" id="id" name="id" maxlength="50" onkeydown="inputIdChk()"></input>
		<!-- 중복체크를 하지 않은 것으로 처리 - onkeydown  -->
		<input type = "button" value="중복확인" onclick="openIdChk()">
		<input type = "hidden" name="id_check_val" value="id_check_val"><!-- 중복체크 했는지 판단 -->
		(영문 대소문자/숫자 4자~16자)</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!-------------아이디----------------->
	<tr>
		<td>&nbsp&nbsp비밀번호<font color=red>&bull;</font></td>
		<td colspan=3><input  value="" id="pass" name="pass"></input>
		(영문 대소문자/숫자 4자~16자)</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--------------비밀번호------------------------->
	<tr>
		<td>&nbsp&nbsp비밀번호 확인<font color=red>&bull;</font></td>
		<td  colspan=3><input value=""id="pass2"></input></td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--------------비밀번호 확인----------------------->
	<tr>
		<td>&nbsp&nbsp이름<font color=red>&bull;</font></td>
		<td colspan=3><input  value="" id="name" name="name"></input></td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>

	<!----------------------이름------------------------>
	<tr>
		<td>&nbsp&nbsp성별<font color=red></font></td>
		<td >
		
		<label><input type="radio" value="male" id="gender" name="gender">남자</input></label><label>
		<input type="radio" value="female"id="gender" name="gender">여자</input></label>
		
		</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--------------성별----------------------->
	<tr>
		<td>&nbsp&nbsp주소<font color=red></font></td>
		<td colspan=3>
			<table width=700 border="0px solid #C0D5E9">
				<tr>
					
					<td width=200px;><input  value=""  id="sample6_postcode" name="zipcode" placeholder="우편번호"></input>-
					<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
				</tr>
				<tr>
					<td><input value="" id="sample6_address" name="zip"></input></td>
					<td colspan=2>기본주소</td>
				</tr>
				<tr>
					<td><input value=""id="sample6_detailAddress" name="zip1" placeholder="상세주소"></input></td>
					<td><input type="text" id="sample6_extraAddress" name="zip3" placeholder="참고항목"></input></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--주소-->

	<tr>
		<td>&nbsp&nbsp일반전화</td>
		<td colspan=3>
			<select name="일반전화">
			<option value="1">02</option>
			<option value="2">052</option>
			<option value="3">011</option>
			<option value="4">010</option>
			</select>
			-
			<input  value="" id="phone1"></input>
			-
			<input  value="" id="phone2"></input>
		</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>

	<!--일반전화-->
	<tr>
		<td>연락처</td>
		<td><input id="phone" name="phone"></td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--휴대전화-->
	<tr>
		<td>&nbsp&nbspSMS수신여부</td>
		<td colspan=3>
			<table>
				<tr>
					<td><input type="checkbox" value=""></input>동의함</td>
				</tr>
				<tr>
					<td></td>
				</tr>
	</table>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--SMS수신여부-->
	<tr>
		<td>&nbsp&nbsp이메일<font color=red>&bull;<font></td>
		<td colspan=3>
		<input  value=""id="email" name="email"></input>
		<input  value=""id="email2" name="email2"></input>
			<select onchange =email2.value=this.value>
				<option value="@naver.com">@naver.com</option>
				<option value="@hanmail.net">@hanmail.net</option>
				<option value="@gmail.com">@gmail.com</option>
				<option value="@nate.com">@nate.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
	</tr>
	<!--이메일-->
	<tr>
		<td>&nbsp&nbsp이메일 수신여부</td>
		<td colspan=3>
			<table>
				<tr>
					<td><input type="checkbox" value=""></input>동의함</td>
				</tr>
				<tr>
					<td>홈페이지 관련된 유익한 소식을 이메일로 받으실 수 있습니다.</td>
				</tr>
			</table>
		</td>
		</tr>
		<tr>
			<td colspan=4 style="border-top:1px solid #C0D5E9"></td>
		</tr>
		</form>
		<tr>
			<td class="bt" colspan="2"><input type="submit" onclick="send()" class="bt2" value="회원가입"></td>
		</tr>
		<!--이메일 수신여부-->
	</table>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

<%@ include file="/include/footer.jsp" %>