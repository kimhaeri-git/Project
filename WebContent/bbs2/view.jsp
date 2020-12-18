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
	.h{
		height:200px;
	}
/*----사진----*/
	.ig{
		width:300px;
		height:100px;
		
	}	
</style>
<%

request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
String uid = request.getParameter("uid");
// 조회수 +1 처리
String sql2 = "update "+code+" set ref=ref+1 where uid="+uid+"";

Connection conn2 = DriverManager.getConnection(url, user, password);
Statement stmt2 = conn2.createStatement();
stmt2.executeUpdate(sql2);

//uid값에 해당하는 내용 출력 구문
String sql = "select * from "+code+" where uid="+uid+"";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String id="";
String name="";
String subject="";
String comment="";
String signdate="";
String ref="";
String gongji="";
String gongji_han="";
String file1="";
String file1_o="";

if(rs.next()){
	id = rs.getString("id");
	name = rs.getString("name");
	subject = rs.getString("subject");
	comment = rs.getString("comment");
	signdate = rs.getString("signdate");
	ref = rs.getString("ref");
	gongji = rs.getString("gongji");
	file1 = rs.getString("file1");
	file1_o = rs.getString("file1_o");
	
	if(gongji.equals("1")){
		gongji_han="공지";
	}else if(gongji.equals("2")){
		gongji_han="일반";
	}else{
		gongji_han="비밀";
	}
	
	//작성자 비교
	if(session_level == null ){
		out.print("<script>alert('회원이 아닙니다.');history.back()</script>");
	}else{
		
	}
}
%>
<table  border=0 class="vw">
	<tr>
		<td colspan=2>
			글쓴이 : <%=id %> 
			작성일 : <%=signdate %> 
			조회수 : <%=ref %>
		</td>
	</tr>
	<tr>
		<td class="ls">옵션</td>
		<td><%=gongji_han %></td>
	</tr>
	<tr>
		<td class="ls">제목</td>
		<td><%=subject %></td>
	</tr>
	<tr>
		<td class="ls h">내용</td>
		<td >
			<table align="center">
				<tr>
					<td align="center"><img src="/upload/penguins.png" class="ig"></td>
				</tr>
				<tr>
					<td><%=comment %></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script>
function send_comment(){
	if(view_comment.comment.value == ""){
		alert("댓글 내용을 작성하세요.");
		view_comment.comment.focus();
		return;
	}
	view_comment.submit();
}
</script>

<table width=700 align=center border-top=1>
	<tr>
		<td valign="top"style="font-size: 20px;font-weight:bold;">comment</td>
		<td>
			<form name="view_comment" action="comment_insert.jsp" method="get">
				<input type="hidden" name="code" value="<%=code%>">
				<input type="hidden" name="uid" value="<%=uid%>">
				<input name="comment" style="width:100%;height:30px;margin:0;padding:0; ">
			</form>
		</td>
		<td valign="top"><button onclick="send_comment()"style="width:100%;height:30px;margin:0;padding:0; " >댓글작성</button></td>
	</tr>
</table>
<%
String sql_comment = "select * from comment where tb_table='"+code+"' and tb_uid="+uid+" order by uid desc";
Connection conn_comment = DriverManager.getConnection(url, user, password);
Statement stmt_comment = conn_comment.createStatement();
ResultSet rs_comment = stmt_comment.executeQuery(sql_comment);
//out.print(sql);
%>
<table width=700 align=center border=0>
<%
while(rs_comment.next()){
	int m_uid = rs_comment.getInt("uid");
	String m_id = rs_comment.getString("tb_id");
	String m_comment = rs_comment.getString("tb_comment");
	String m_date = rs_comment.getString("tb_date");
%>
	<tr>
		<td><%=m_id %></td>
		<td>
			<%=m_comment %>
			<%if(m_id.equals(session_id) || session_level.equals("10")){ %>
				<a href="comment_delete.jsp?code=<%=code%>&uid=<%=uid%>&m_uid=<%=m_uid%>">[삭제]</a>
			<%} %>
		</td>
		<td><%=m_date %></td>
	</tr> 
	<tr><td colspan=3 width=100% height=1 bgcolor=#d4ced2></td></tr>
<%
}
%>
</table>

<table width=700 align=center border=0>
	<tr>
		<td>
			<%if((session_level != null && session_level.equals("10")) || id.equals(session_id)){ %>
			<a href="modify.jsp?code=<%=code%>&uid=<%=uid%>">[수정]</a>
			<a href="delelte.jsp?code=<%=code%>&uid=<%=uid%>">[삭제]</a>
			<%}else{ %>
			<a onclick="alert('작성자만 수정할 수 있습니다.')" style="cursor:pointer">[수정]</a>
			<a onclick="alert('작성자만 삭제할 수 있습니다.')" style="cursor:pointer">[삭제]</a>
			<%} %>
		</td>
	</tr>
</table>
<%@ include file="/include/footer.jsp" %>
