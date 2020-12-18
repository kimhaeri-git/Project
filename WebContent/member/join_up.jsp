<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<style>
	.jump{
		padding-top:210px ;
		margin:0;
		width:100%;
		height:50px;
	}
	.mem7{
		height:70px;
		background-color:#99BCDC;
	}
	.mem1{
		border:0px solid black;
		width:100%;
		padding:20px;
		line-height:300%;
	}
	.bt3{
		width:100px;
		height: 60px;
		background-color:#99bcdc;
		border:1px solid #99bcdc;
		font-weight:bold;
	}
	.line{
		height:150px;
		text-align:center;
		border:0px solid black;
	}
</style>
<script>
	function send(){
		var mi = member_insert;
		if(mi.id.value == ""){
			alert("아이디를 입력하세요");
			mi.id.focus();
			return;
		}
		if(!mi.email.value){
			alert("이메일을 입력하세요");
			mi.email.focus();
			return;
		}
		if(mi.pass2.value != mi.pass3.value){
			alert("비밀번호를 다시 확인하세요");
			mi.pass2.focus();
			return;
		}
		mi.submit();
	}
</script>

<%
String sql = "select * from member where id = '"+session_id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String id = "";
String pass = "";
String name = "";
String email = "";
String phone = "";
String zipcode = "";
String zip = "";
String zip1 = "";

if(rs.next()){
	id = rs.getString("id");
	pass = rs.getString("passwd");
	name = rs.getString("name");
	email = rs.getString("email");
	phone = rs.getString("phone");
	zipcode = rs.getString("zipcode");
	zip = rs.getString("zip");
	zip1 = rs.getString("zip1");
}
%>
<table class="jump" border=0 >
	<form name="member_insert" action="join_update.jsp" method="get">
	<tr>
		<td align=center colspan=2 class="mem7"> 회원수정</td>
	</tr>
</table>
<table class="mem1">
	<tr>
		<td>아이디</td>
		<td><input id="id" name="id" value="<%=id%>" readonly></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input id="pass" name="pass"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input id="pass2" name="pass2"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input id="name" name="name" value="<%=name%>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input id="email" name="email" value="<%=email%>"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input id="phone" name="phone" value="<%=phone%>"></td>
	</tr>
	<tr>
		<td rowspan=3>주소</td>
		<td>
			<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="<%=zipcode%>">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="zip" name="zip" placeholder="주소" value="<%=zip%>">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" id="zip1" name="zip1" placeholder="상세주소" value="<%=zip1%>">
		</td>
	</tr>
	<tr>
		<td class="line" colspan=2><button onclick="send()" class="bt3">회원수정</button></td>
	</tr>
	</form>
</table>
 <%@ include file="/include/footer.jsp" %>  