<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass2 = request.getParameter("pass2");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

String zipcode = request.getParameter("zipcode");
String zip = request.getParameter("zip");
String zip1 = request.getParameter("zip1");

%>
id : <%=id %><br>
pass2 : <%=pass2 %><br>
name : <%=name %><br>
email : <%=email %><br>

<%
String sql = "";
if(pass2.equals("")){//비밀번호 값 없을 경우
	sql="update member set name='"+name+"',email='"+email+"',phone='"+phone+"',zipcode='"+zipcode+"',zip='"+zip+"',zip1='"+zip1+"', where id = '"+session_id+"'";
}else{//비밀번호 값 있을 경우
	sql="update member set name='"+name+"',email='"+email+"',phone='"+phone+"',zipcode='"+zipcode+"',zip='"+zip+"',zip1='"+zip1+"',passwd='"+pass2+"' where id = '"+session_id+"'";
}
//out.print(sql);
Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
%>
<script>
	location.href="/";
</script>

<%@ include file="/include/footer.jsp" %>  