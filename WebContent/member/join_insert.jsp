<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>
<style>
	.join_ok{
		margin: 300px 50px 200px ;
	}
</style>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String name = request.getParameter("name");
String phone = request.getParameter("phone");

String address = request.getParameter("zipcode")+request.getParameter("zip")+request.getParameter("zip1")+request.getParameter("zip3");
String zipcode = request.getParameter("zipcode");
String zip1 = request.getParameter("zip1");
String zip = request.getParameter("zip");

%>
id : <%=id %><br>
pass : <%=pass %><br>

<%
String sql="insert into member (id,passwd,address,zipcode,zip1,zip, phone,email,gender,name) values ('"+id+"','"+pass+"','"+address+"','"+zipcode+"','"+zip1+"','"+zip+"','"+phone+"','"+email+"','"+gender+"','"+name+"')";
//out.print(sql);

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);

%>
<table width=100% class="join_ok">
	<tr>
		<td align=center><%=id %>님의 회원가입을 축하드립니다.</td>
	</tr>
	<tr>
		<td align=center>
			<a href="/">[메인 페이지 이동]</a>
			<a href="/member/login.jsp">[로그인]</a>
		</td>
	</tr>
</table>

<%@ include file="/include/footer.jsp" %>