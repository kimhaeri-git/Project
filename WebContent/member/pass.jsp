<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<style>
	.ps{
		height:200px;
		
	}
	.te{
		text-align: center;
		background-color: #ecf0f7; 
		font-size: 20px;
		margin: 100px 500px 100px 700px; 
	}
	.idsk{
		text-align: center;
		height: 50px;
		font-size: 25px;
		font-weight: bold;
	}
</style>
<script>
	function idok(){
		var mi = idsearch;
		if(mi.name.value == ""){
			alert("이름을 입력하세요");
			mi.name.focus();
			return;
		}
		if(!mi.email.value){
			alert("이메일을 입력하세요");
			mi.email.focus();
			return;
		}if(!mi.phone.value){
			alert("연락처를 입력하세요");
			mi.phone.focus();
			return;
		}
		mi.submit();
	}
	out.print(idok());
</script>

<table  class="ps" border=1 >
  <tr>
	    <td></td>
  </tr>
</table>
	
<table  width=800px; border=0 class="te">
	<form name="idsearch" method="get">
	<tr>
		<td align=center colspan=2 height="100px" >아이디 찾기</td>
	</tr>
	<tr>
		<td height="80px">이름</td>
		<td><input id="name" name="name"></td>
	</tr>
	<tr>
		<td height="80px">이메일</td>
		<td><input id="email" name="email"></td>
	</tr>
	<tr>
		<td height="80px">연락처</td>
		<td><input id="phone" name="phone"></td>
	</tr>
	</form>
	<tr>
		<td height="80px"></td>
		<td><button onclick="idok()">아이디 찾기</button></td>
	</tr>
</table>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");


String sql = "select * from member where name='"+name+"' and email='"+email+"' and phone='"+phone+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	id = rs.getString("id");
	password = rs.getString("passwd");
} 
%>
<table border=0 width=100% class="idsk" >
	<tr>
		<td>당신의 아이디는 <%=id %>입니다.</td>
		<td>당신의 비밀번호는 <%=password %>입니다.</td>
	</tr>
</table> 

<%@ include file="/include/footer.jsp" %>