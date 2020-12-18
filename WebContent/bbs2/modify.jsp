<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/header.jsp" %>

<style>
/*----테이블----*/	
	.vw {
			text-align:center;
			padding-top:270px;
			text-align:center;
			width:100%;
			height:auto;
			line-height:50px;
		}
/*----목록----*/	
	.ls{
	 width:100px;
	 background-color:#99BCDC;
	}
	.sb{
		width:70%;
	}
	.te{
		width:70%;
		height:300px;
	}

</style>
<script>
function bbs_send(){
	if(bbs_write.subject.value == ""){
		alert("제목을 입력하세요.");
		bbs_write.subject.focus();
		return;
	}
	if(bbs_write.comment.value == ""){
		alert("내용을 입력하세요.");
		bbs_write.comment.focus();
		return;
	}
	bbs_write.submit();
}
</script>
<%
request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
String uid = request.getParameter("uid");

//uid값에 해당하는 내용 출력 구문
String sql = "select * from "+code+" where uid="+uid+"";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);


String name="";
String file="";
String subject="";
String comment="";
String signdate="";
String ref="";
String gongji="";
String gongji_han="";

if(rs.next()){
	name = rs.getString("name");
	subject = rs.getString("subject");
	comment = rs.getString("comment");
	signdate = rs.getString("signdate");
	ref = rs.getString("ref");
	gongji = rs.getString("gongji");
	file= rs.getString("file1");
	
	if(gongji.equals("1")){
		gongji_han="공지";
	}else if(gongji.equals("2")){
		gongji_han="일반";
	}else{
		gongji_han="비밀";
	}
}

%>

<table class="vw">
	<form name="bbs_write" action="modify_update.jsp" method="get">
	<input type="hidden" name="code" value="<%=code%>">
	<input type="hidden" name="uid" value="<%=uid%>">
	<tr>
		<td class="ls">옵션</td>
		<td>
			<%if(session_level != null && session_level.equals("10")){//관리자 %>
			<input type="radio" name="gongji" value="1" <%if(gongji.equals("1")){%>checked<%}%>>공지
			<%}%>
			<input type="radio" name="gongji" value="2" <%if(gongji.equals("2")){%>checked<%}%>>일반 
			<input type="radio" name="gongji" value="3" <%if(gongji.equals("3")){%>checked<%}%>>비밀
			
		</td>
	</tr>
	<tr>
		<td class="ls">제목</td>
		<td><input id="subject" name="subject" value="<%=subject%>" class="sb"></td>
	</tr>
	<tr>
		<td class="ls">내용</td>
		<td><textarea id="comment" name="comment"class="te"><%=comment%></textarea></td>
	</tr>
	<tr>
		<td class="ls" >첨부파일</td>
		<td><input type=file name=file1 class="sb"></td>
	</tr>
	</form>
	<tr>
		<td></td>
		<td><button onclick="bbs_send()">수정하기</button></td>
	</tr>
</table>

<%@ include file="/include/footer.jsp" %>