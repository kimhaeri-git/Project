<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/dbconnection.jsp" %>
    
<style>
	
	.ftst{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 25px;
	}
	button {
	width: 180px;
	height: 30px;
	background-color: #f3f6fe;
	border-color: #f3f6fe;
	font-family: monospace;
	font-weight: bolder;
}
</style>
<%
String session_id = (String)session.getAttribute("id");
String session_level = (String)session.getAttribute("level");
String session_name = (String)session.getAttribute("name");
String code2 = request.getParameter("code");
%>
<!-- -id : <%=session_id %><br>
name : <%=session_name %><br>
level : <%=session_level %> <br>
code : <%=code2 %> -->
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   
    <title>WEB PAGE TEMPLATE</title>
    <link rel="stylesheet" href="/css/header.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
</style>
<body>
	<header>
		<table border=0 class="as">
			<tr >
				<td class="mg"><a href="/index.jsp"><img width="120" height="100" src="/upload/logo3.png" ></a>
				</td>
			</tr>
			<tr>
				<td colspan=3>
				<h3>
			<%
			String title="";
			if(code2==null){
			}else{
				if(code2.equals("airport") ){ 
					title="운항 스케쥴 (일별)";
				}else if (code2.equals("community")){
					title="Community&Notice";
				}else if(code2.equals("notice")){
					title="Tour Gallery";
				}else if(code2.equals("hotel")){
					title="HOTEL";
				}else if(code2.equals("information")){
					title="TOUR INFOMATION";
				}else if(code2.equals("bus")){
					title="CITY BUS&RENT";
				}else{
					title="Cape Town";
				}
			}
			%>
			<span class="te"><%=title %></span>
			</h3>
			 </td>
			</tr>
			<tr >
						<td class="lg mg ftst" ><%//=session_id %>
							<%if(session_id==null){ %>
							<button onclick="location.href='/member/pass.jsp'">아이디/비밀번호 찾기</button>
							<button onclick="location.href='/member/login.jsp'">로그인</button>
							<button onclick="location.href='/member/join.jsp'">회원가입</button>
							<%}else{ %>
							<button onclick="location.href='/member/logout.jsp'">로그아웃</button>
							<button onclick="location.href='/member/join_up.jsp'" >회원수정</button>
							<%} %>
						<ul class="a">
							<li><a href="/airport.jsp?code=airport" >AIRPORT</a></li>
							<li><a href="/hotel.jsp?code=hotel">HOTEL</a></li>
							<li><a href="/information.jsp?code=information" >TOUR INFOMATION</a></li>
							<li><a href="/bus.jsp?code=bus">CITY BUS&RENT</a></li>
							<li><a href="/bbs2/list.jsp?code=community">Community&Notice</a></li>
							<li><a href="/bbs/list.jsp?code=notice">Tour Gallery</a></li>
						</ul>
					</td>
				</tr>
			</table>
	</header>
