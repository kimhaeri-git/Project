<%@page import="java.sql.*"%>
    <%@ include file="/include/dbconnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 		.msg1{
 			color:blue;
 		}
 		.msg2{
 			color:red;
 		}
   </style>
   <%
   request.setCharacterEncoding("utf-8");
   String id2 = request.getParameter("id_value");
 
   String sql = "select count(*) as cnt from member where id = "+id2+"";
   
   Connection conn = DriverManager.getConnection(url, user, password);
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery(sql);

   
   int count=0;
   if(rs.next()){
	   count = rs.getInt("cnt");
   }
   %>

<script type="text/javascript">
	function can_join(){
		opener.pInput.value = "y";
		window.close();
		document.getElementById("pInput").value = opener.document.getElementById("pInput").value;
		
	}
	function no_join(){
		opener.pInput.value = "n";
		window.close();
	}

	$(function (){
			$("#id").blur(function(){
				/* AJAX */
				$.ajax({
					url:"id-check.me",
					type:"post",
					data: {"id":$("id").val()	},
					success:	function(result){}
				});
			});
	});	
	
</script>

<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form >
			<!-- <input type="text" name="userid" id="userid" maxlength="10" autofocus>
			<input type="submit" value="중복확인" onclick="idCheck()"> -->
			<div >
			<%if(count == 0){ %>	
			<!-- <script>alert("중복아이디가 없습니다.");</script> -->
			<font class="msg1">멋진 아이디네요! <br></br></font>
			<button onclick="can_join()">확인</button>
			<%}else {%>
			<!-- <script>alert("중복아이디가 있습니다.");</script> -->
			<font class="msg2">사용중이거나 휴면 상태입니다.<br></br></font>
			<button onclick="no_join()">확인</button>
			<%} %>
			</div >
	</form>
</div>


</body> 