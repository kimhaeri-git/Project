<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");


//년,월,일 시분초
java.util.Date today = new java.util.Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String signdate = cal.format(today);

String uploadPath = "C:\\jsp\\project_haeri\\WebContent\\upload";
int size = 10*1024*1024;//10M

MultipartRequest mult = new MultipartRequest(
		request,
		uploadPath,
		size,
		"utf-8",
		new DefaultFileRenamePolicy()		
);

String code = mult.getParameter("code");

String subject = mult.getParameter("subject");
String comment = mult.getParameter("comment");
String gongji = mult.getParameter("gongji");



String sql="insert into "+code+" (id,subject,comment,signdate,gongji) values ('"+session_id+"','"+subject+"','"+comment+"','"+signdate+"','"+gongji+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();
%>

<script>
	location.href="list.jsp?code=<%=code%>";
</script>
