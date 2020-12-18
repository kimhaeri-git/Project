<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

code = request.getParameter("code");
String uid = request.getParameter("uid");
String comment = request.getParameter("comment");

//년,월,일 시분초
java.util.Date today = new java.util.Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String signdate = cal.format(today);

String sql="insert into comment (tb_table,tb_uid,tb_id,tb_name,tb_comment,tb_date) values ('"+code+"',"+uid+",'"+session_id+"','"+session_name+"','"+comment+"','"+signdate+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);

%>

<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>
