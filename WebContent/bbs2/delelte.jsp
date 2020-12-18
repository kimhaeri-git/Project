<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");

String subject = request.getParameter("subject");
String comment = request.getParameter("comment");
String gongji = request.getParameter("gongji");

String sql="delete from "+code+" where uid="+uid+"";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();
%>

<script>
	location.href="list.jsp?code=<%=code%>";
</script>