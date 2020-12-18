<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<style>
	.center_td {
		text-align:center;
		padding-top:300px;
		border:1 solid black;
	}
	.pt{
		width:200px;
		height:200px;

	}
	/*글쓰기,새로고침*/
	.gul{
		border:0px solid black;
		border-spacing: 20px;
		height:150px;
	}
	/* 버튼 */
	.btt{
		width:100px;
		height:50px;
	}
</style>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String field = request.getParameter("field");
String search = request.getParameter("search");

//총 게시물 수 시작
String sql_count = "select count(*) as total_count from "+code+"";
Connection conn_count = DriverManager.getConnection(url, user, password);
Statement stmt_count = conn_count.createStatement();
ResultSet rs_count = stmt_count.executeQuery(sql_count);


int total_record = 0;
while(rs_count.next()){
	total_record = rs_count.getInt("total_count");
}

rs_count.close();
stmt_count.close();
conn_count.close();
//총 게시물 수 끝

//필요한 변수들
int num_per_page = 10;//한 페이지당 출력할 게시물 수
int page_per_block = 5;//한 블럭당 출력할 링크 수
int total_page = 0;//총 페이지 수 초기화
int first = 0;//limit 0,5 시작 값

//현재 페이지 구하기
int page_now;

if(request.getParameter("page_now") != null){
	page_now = Integer.parseInt(request.getParameter("page_now"));
}else{
	page_now = 1;
}

//총 페이지 수
total_page = (int)Math.ceil(total_record / (double)num_per_page);

first = num_per_page * (page_now - 1);

//검색 부분
String sql;

if(search == null){ search = ""; }
if(search != ""){//검색이 있다면
	sql = "select * from "+code+" where "+field+" like '%"+search+"%' order by uid desc limit "+first+","+num_per_page+"";
}else{
	sql = "select * from "+code+" order by uid desc limit "+first+","+num_per_page+"";	
}


Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<table width=1400 align=center border=0 class="center_td">
	<tr><td colspan=5>Total : <%=total_record %></td></tr>
	<tr><td colspan=5 style="border-top:3px solid black"></td></tr>
	
<%

	//넘버링 처리
	int k = total_record - (page_now - 1) * num_per_page;
	int number = 1;
	while(rs.next()){
		String uid = rs.getString("uid");
		String id = rs.getString("id");
		String subject = rs.getString("subject");
		String name = rs.getString("name");
		String signdate = rs.getString("signdate");
		String ref = rs.getString("ref");
		String gongji = rs.getString("gongji");
		String file1 = rs.getString("file1");
		
		//제목 길이 ... 처리
		int len_num = subject.length();
		if(len_num > 24){//24자리 설정
			subject = subject.substring(0,24) + "...";
		}else{
			subject = subject;
		}
				
		//tr 처리
		if(number%4 == 1){
			out.print("<tr>");
		}
		%>
		<td>
		<a href="view.jsp?code=<%=code%>&uid=<%=uid%>">
		<%if(file1.equals("")){ %>
		<img src="/upload/flowerxbox.jpg" class="pt">
		<%}else{ %>
			<img src="/upload/<%=file1 %>" class="pt"><br>
			<%=subject %></a>
		<%} %>
		</td>
	<%
		if(number%4 == 0){
			out.print("</tr>");
		}
	
		number++;
		k--;
	}
	
rs.close();
stmt.close();
conn.close();

	if(total_record == 0){
	%>
	<tr><td colspan=5 height=200 align=center>작성한 게시물이 없습니다.</td></tr>
	<tr><td colspan=5 style="border-top:0px solid black"></td></tr>
	<%		
	}
	%>
</table>

<table width=700 align=center border=0>
	<tr>
		<td align=center>
<%
//페이징 처리 변수 초기화
int total_block = 0;
int block = 0;
int first_page = 0;
int last_page = 0;
int direct_page = 0;
int my_page = 0;

//총 블럭수
total_block = (int)Math.ceil(total_page / (double)page_per_block);

block = (int)Math.ceil(page_now / (double)page_per_block);
first_page = (block - 1) * page_per_block;
last_page = block * page_per_block;

if(total_block <= block){
	last_page = total_page;
}

//이전 블럭 처리
if(block == 1){
	
}else{
	my_page = first_page;
%>
	<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>&field=<%=field%>&search=<%=search%>">&lt;&lt;</a>
<%	
}

//블럭당 페이징 5(num_per_page)개씩 출력
for(direct_page = first_page + 1; direct_page <= last_page; direct_page++){
	if(page_now == direct_page){
%>
	<font color=red><b>[<%=direct_page %>]</b></font>
<%		
	}else{
%>
	<a href="list.jsp?code=<%=code%>&page_now=<%=direct_page%>&field=<%=field%>&search=<%=search%>">[<%=direct_page %>]</a>
<%		
	}
}

//다음 블럭 처리
if(block < total_block){
	my_page = last_page + 1;
%>
	<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>&field=<%=field%>&search=<%=search%>">&gt;&gt;</a>
<%
}else{
	
}
%>		
		</td>
	</tr>
</table>

<table width=100% align=center border=0>
	<form action="list.jsp?code=<%=code%>" method="post">
	<tr>
		<td align=right>
			<select name="field">
				<option value="subject" <%if(field != null && field.equals("subject")){%>selected<%}%>>제목</option>
				<option value="comment" <%if(field != null && field.equals("comment")){%>selected<%}%>>내용</option>
				<option value="name" <%if(field != null && field.equals("name")){%>selected<%}%>>글쓴이</option>
			</select>
		</td>
		<td width=120><input name="search" value="<%=search%>"></td>
		<td><input type="submit" value="검색"></td>
	</tr>
	</form>
	<tr>
		<td class="gul" align="right">
		<button onclick="location.href='list.jsp?code=<%=code%>'"class="btt">새로고침</button>
		</td>
		<td></td>
		<td class="gul">
			<%if(session_id == null || session_id == ""){%>
				[글쓰기 불가]
			<%}else{ %>
				<button onclick="location.href='write.jsp?code=<%=code%>'"class="btt">글쓰기</button>
			<%} %>
		</td>
	</tr>
</table>
<br>

<%@ include file="/include/footer.jsp" %>