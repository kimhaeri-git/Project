<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<style>
	.pi{
		padding:400px 500px 300px;
	}

</style>
  <%
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
  
  String sql = "select * from member where id = '"+id+"'";
		  
Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
  
  String mem_id="";
  String mem_pass="";
  String mem_level="";
  
  if(rs.next()){
	 mem_id = rs.getString("id");
	 mem_pass = rs.getString("passwd");
	 mem_level = rs.getString("level");
  }
  if(id.equals(mem_id)&&pass.equals(mem_pass)){
	  session.setAttribute("id", mem_id);
	  session.setAttribute("level", mem_level);
	  
  }else{
	  %>
	  <script>
	  		alert("존재하지 않은 아이디이거나 비밀번호가 틀립니다.");
	  		location.href="/member/login.jsp";
	  </script>
	  <% 
  }
%>

 <script>
 		location.href="/";
 </script>
<table class="pi">
  <tr>
   	<th><%=id %>님 환영합니다.  </th>
  </tr>
</table>

  
  <%@ include file="/include/footer.jsp" %>