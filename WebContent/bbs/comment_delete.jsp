<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<%
code = request.getParameter("code");
String uid = request.getParameter("uid");
String m_uid = request.getParameter("m_uid");

String sql="delete from comment where uid="+m_uid+"";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>