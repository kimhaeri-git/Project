<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*"%>
    <%@ include file="/include/header.jsp" %>
<style>
	body{
		font-family:'Britannic Bold';
		}
	table{
		padding:10px;
		border-spacing:10px;
		margin:0px;
		text-align:center;
		width:100%;
		
	}
	.ab{
	 color:white;
	 background-image:url("/upload/BoKaap4.jpg") ;
	 background-size: cover;
	 font-size:100px;
	 font-weight:bold;
	 font-style:normal;
	 height:300px;
	 padding-top:350px;
	}
	.b{
		width:500px;
		height:100px;
		font-weight:bold;
		font-size:20px;
	}
	.c{
		background-color:#134d95;
		color:white;
		border:1px solid ##134d95
		
	}
	.d{
		 color:#134d95;
		 font-size:60px;
		 font-weight:bold;
		 font-style:normal;
	}
</style>
	<table class="ab">

		<form name="login_ok" action="login_ok.jsp" method="post">
				<tr>
					<td><input type="text" name="id" id="id"   class="b" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="password" name="pass" id="pass"  class="b"   placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인" class="b c" style="font-size:30px" onclick="send()"></td>
				</tr>
			</form>
	</table>
	<table>
				<tr>
					<td class="d">Tour in CapeTown&nbsp<img src="/upload/BoKaapCapeTown2.png" width=50 height=50></td>
				</tr>
				<tr>
					<td height="500px";></td>
				</tr>
			
	</table>
	<script type="text/javascript">
	function send(){
		var mi = login_ok;
		if(mi.id.value==""){
			alert("아이디를 입력 하세요.");
			mi.id.focus();
			return;
		}
		if(mi.pass.value==""){
			alert("비밀번호를 입력 하세요.");
			mi.pass.focus();
			return();
		}
		mi.submit();
		
	}
</script>
	    <%@ include file="/include/footer.jsp" %>
