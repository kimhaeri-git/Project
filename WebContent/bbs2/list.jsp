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
		border:0px solid black;
	}
	/*검색*/
	.fd{
		text-align:right;
		height:100px;
	}
	fieldset{
		border:2px solid #d7ecff;
		height:60px;
	}
	.page{
		letter-spacing:2em;
		margin-right:30px;
		width:100%;
		height:50px;
		text-align:center;
	}
	.ls{
		height:50px;
		background-color:#d7ecff;
		font-weight:bold;
	}
	.lt{
		height:30px;
	}
	.gaesi{
		height: 50px;
		font-size: xx-large;
	}
</style>
<br>
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code"); 
String field = request.getParameter("field");
String search = request.getParameter("search");
String uid = request.getParameter("uid");
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String comment = request.getParameter("comment");
String signdate = request.getParameter("signdate");
String ref = request.getParameter("ref");
String gongji = request.getParameter("gongji");


if(search == null){ search = ""; }

String sql_count; 

if(search != ""){//검색이 있다면
	sql_count = "select count(*)as total_count from "+code+" where "+field+" like '%"+search+"%'";
}else{
	sql_count = "select count(*)as total_count from "+code+"" ;	
}

//총 게시물 수 시작
sql_count = "select count(*) as total_count from "+code+"";
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
	sql = "select * from "+code+" where "+field+" like '%"+search+"%' and gongji != 1 order by uid desc limit "+first+","+num_per_page+"";
}else{
	sql = "select * from "+code+" where gongji != 1 order by uid desc limit "+first+","+num_per_page+"";	
}

		%>
<tr>
<table class="center_td">
	<tr><td></td></tr>
</table>
<form action="list.jsp?code=<%=code%>" method="post">
<table width=100% class="lt" border=0 >
	<tr><td colspan=5>Total : <%=total_record %></td></tr>
	<tr><td colspan=5 style="border-top:3px solid black"></td></tr>
	
	<caption class="gaesi">게시글</caption>
	<thead>
		<tr class="ls">
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<!-- 공지 사항 -->
	<tbody >
	<tr>
	<%
	//공지글에 해당하는 리스트
	String sql_notice = "select  * from "+code+" where gongji = 1 order by uid desc";
	Connection conn_notice= DriverManager.getConnection(url,user,password);
	Statement stmt_notice = conn_notice.createStatement();
	ResultSet rs_notice = stmt_notice.executeQuery(sql_notice);
	
	if(page_now == 1){//첫페이지에서만 공지글 출력 하겠다.
		while(rs_notice.next()){
			uid = rs_notice.getString("uid");
			String id = rs_notice.getString("id");
			name = rs_notice.getString("name");
			subject = rs_notice.getString("subject");
			comment = rs_notice.getString("comment");
			signdate = rs_notice.getString("signdate");
			ref = rs_notice.getString("ref");
			gongji = rs_notice.getString("gongji");
			
			//현재 보여질 리스트 갯수
			int pageSize=4;
			
			request.setAttribute("pageSize", pageSize);
			
			//제목 길이 .. 처리
			int len_num = subject.length();
			if(len_num > 24){//24자리 설정
					subject = subject.substring(0,24) + "...";
			}else{
					subject = subject;
			}
			//날짜 년 - 월 - 일 출력 변경 10자리 짜르기 
			signdate = signdate.substring(0,10);
			
			
			
		}
	}
	%>
	<tr style="background-color:#ffffac">
		<td >[공지사항]</td>
		<td>
			<a style="color:red;" href="view.jsp?code=<%=code%>&uid=<%=uid%>"><%=subject %>[공지]<br></a>
		</td>
		<td ><%=ref %></td>
		<td ><%=signdate %></td>
	</tr>
	<tr><td colspan=5 style="border-top:1px solid black"></td></tr>
	</tr>
	</tbody>
<%
	//공지글이 아닌 게시물 리스트
  Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	//넘버링 처리
	int k = total_record - (page_now - 1) * num_per_page;
	int number = 1;
	while(rs.next()){
		uid = rs.getString("uid");
		String id = rs.getString("id");
		name = rs.getString("name");
		subject = rs.getString("subject");
		comment= rs.getString("comment");
		signdate = rs.getString("signdate");
		ref = rs.getString("ref");
		gongji = rs.getString("gongji");
		String file1 = rs.getString("file1");
		String level = rs.getString("level");
		
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
		//날짜 년-월-일 출력 변경 10자리 짜르기
		signdate=signdate.substring(0,10);
		
		//오늘부터 2일전 까지 최신글 처리
		java.util.Date today = new java.util.Date();
		java.util.Date day2 = new java.util.Date(today.getTime()-(long)(1000*60*60*24*2));
		SimpleDateFormat bbb= new SimpleDateFormat("yyyy-MM-dd");
		String day_2 = bbb.format(day2);//2일을 뺀 날짜값
		
		java.util.Date day_22, list_date;
		
		//디비날짜
		list_date = new SimpleDateFormat("yyyy-MM-dd").parse(signdate);
		//2일을 뺀 날짜
		day_22 = new SimpleDateFormat("yyyy-MM-dd").parse(day_2);

		String new_day = "";
		if(day_22.getTime()<list_date.getTime()){
			new_day = "<font color=red>[최신]</font>";
		}
		//비밀글 처리
	%>

		<td class="ls"><%=k %></td>
		<td class="lt"  >
			<a href="view.jsp?code=<%=code%>&uid=<%=uid%>"><%=subject %><br></a>
		</td>
		<td ><%=ref %></td>
		<td ><%=signdate %></td>
	</tr>
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
	<tr><td colspan=5 style="border-top:3px solid black"></td></tr>
	<%		
	}
	%>
</table>

<table width=100% align=center border=0>
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
		<td><a href="list.jsp?code=<%=code%>">[새로고침]</a></td>
		<td></td>
		<td align=right>
			<%if(session_id == null || session_id == ""){%>
				[글쓰기 불가]
			<%}else{ %>
				<a href="write.jsp?code=<%=code%>">[글쓰기]</a>
			<%} %>
		</td>
	</tr>
</table>
<br>

<%@ include file="/include/footer.jsp" %>