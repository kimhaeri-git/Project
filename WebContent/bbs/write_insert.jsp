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
String code = request.getParameter("code");
//첨부파일
String file1 = "";
String file1_name = "";
String file1_rename = "";
String file1_small = "";

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

String code1 = mult.getParameter("code"); 

String subject = mult.getParameter("subject");
String comment = mult.getParameter("comment");
String gongji = mult.getParameter("gongji");

Enumeration files = mult.getFileNames();

file1 = (String)files.nextElement();
file1_name = mult.getOriginalFileName(file1);//사용자 파일명
file1_rename = mult.getFilesystemName(file1);//시스템으로 인해 변경된 파일명

String sql="insert into "+code1+" (id,name,subject,comment,signdate,gongji,file1,file1_o) values ('"+session_id+"','"+session_name+"','"+subject+"','"+comment+"','"+signdate+"','"+gongji+"','"+file1_rename+"','"+file1_name+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);

stmt.close();
conn.close();
%>

<script>
	location.href="list.jsp?code=<%=code1%>";
</script>
