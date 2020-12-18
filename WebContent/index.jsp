<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>
<style>
	.con{
		padding-top:250px ;
		width:100%;
		height:auto;
		background-image: url("/upload/bgimg.png");
		background-repeat: no-repeat;
		background-size: cover;
		font-family: 'Nanum Pen Script', cursive;
		font-size: 25px;

	}
	h2{
		text-align:center;
	}
	.sg{
		width:300px;
		height:200px;
	}
	.sm{
		width:300px;
		height:20px;
	}
	/*--메일상담전화상담--*/
	.tk{
		width:600px;
		height:200px;
		margin:5% 20% 5%;
		padding:30px;
		background:	#d7ecff	url("upload/BoKaap3.jpg") no-repeat;
		background-size:	cover;
		border:3px solid white;
		font-size:50px;
		font-weight: bolder;
		color: #0000d5;
	}
	.im{
		width:80px;
		height:80px;		
	}
	/*--게시글--*/
	.gj{
		width:100%;
		height:100%;
		frameborder:"0";
		font-weight: bolder;
		}
	.op{
		 background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.5 );
        font-weight: bolder;
        flex-wrap: wrap;
	}
	.hri{
		border-style: solid;
	}
	.lt{
		background-color: #ffffff;
		background-color: rgba( 255, 255, 255, 0.5 );
		width:500px;
		height: auto;
		/* margin-left: -200px; */
	}
	.gjsh{
		font-size: 20px;
		align: center;
		padding-left: 20px;
		border: 1px solid black;
	}
	.container {
	flex-wrap: wrap;
}
</style>

   	<table border=0 class="con op" >
   		<tr>
   			<td colspan=3 ><h2>인기 여행지 TOP3</h2></td>
   		</tr>
		  <tr>
			    <td align="center" ><a href="javascript:void(window.open('https://www.waterfront.co.za/the-va/facilities-services/visitor-information/', 'waterfront','width=500px, height=500px'))"><img src="/upload/waterfront.png" class="sg" ></a></td>
			    <td align="center" ><a href="javascript:void(window.open('https://www.capetown.travel/getting-to-know-the-bo-kaap/', 'waterfront','width=500px, height=500px'))"><img src="/upload/BoKaap1.jpg"  class="sg"></a></td>
			    <td align="center" ><a href="javascript:void(window.open('https://wineflies.co.za/', 'waterfront','width=500px, height=500px'))"><img src="/upload/WineTours.png"  class="sg"></a></td>
		  </tr>
		  <tr>
			    <td align="center"  class="lt"><b>Waterfront Tour</b></td>
			    <td align="center"   class="lt"><b>Bokaap Tour</b></td>
			    <td align="center"   class="lt"><b>Winery Tour</b></td>
		  </tr>
		  <tr>
			    <td align="center"  class="lt">현대적인 쇼핑센터와 백화점, 레스토랑, 카페 등이<br> 항구를 따라 곳곳에 들어서 있어 케이프타운에서<br> 가장 세련된 모습이 펼쳐진다.</td>
			    <td align="center"  class="lt">보캅은 인종차별정책 폐지를 기념하며<br> 집집마다 페인트로 색을 칠한 것이 오늘날 케이프타운의<br> 명소가 되었다.</td>
			    <td align="center"  class="lt">남아공 웨스턴 케이프 주의 와인의 세계를 <br>만나 보는 멋진 시간을 가져봅시다.</td>
		  </tr>
		  <tr>
			    <td align="center"><hr class="hri"></td>
			    <td align="center"><hr class="hri"></td>
			    <td align="center"><hr class="hri"></td>
		  </tr>
		  <tr>
			    <td align="center">VIEW</td>
			    <td align="center">VIEW</td>
			    <td align="center">VIEW</td>
		  </tr>
		  <tr>
			    <td colspan="2">
			    	<table border=1 class="tk">
			    		<tr>
			    			<td align="center"><a href="/inform/email.jsp"><img src="/upload/mail_icon.png" class="im">메일 상담</td>
			    			<td align="center"><a href="/inform/phone.jsp"><img src="/upload/ico_phone.png" class="im">전화상담</a></td>
			    		</tr>
			    	</table>
			    </td>
			    <td >
					<table width=100% class="lt container" >
						<tr><td colspan=5 style="border-top:3px solid black"></td></tr>
						<caption style="font-weight: bolder;font-size: 30px;;">공지사항 목록</caption>
						<thead>
							<tr >
								<th >제목</th>
								<th >조회수</th>
								<th >작성일</th>
							</tr>
						</thead>
						<% 
						String sql="select * from community limit 5 ";
						
						Connection conn = DriverManager.getConnection(url, user, password);
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(sql);

							while(rs.next()){
								String uid = rs.getString("uid");
								String id = rs.getString("id");
								String subject = rs.getString("subject");
								String name = rs.getString("name");
								String signdate = rs.getString("signdate");
								String ref = rs.getString("ref");
								String gongji = rs.getString("gongji");
								String level = rs.getString("level");
								
							%>
								<tr >
									<td class="gjsh">
									<%if(level.equals("10")) {%>
										<a href="/bbs2/view.jsp?code=community&uid=<%=uid%>"><%=subject %>[공지]<br></a>
										<%}else{ %>
											<a href="/bbs2/view.jsp?code=community&uid=<%=uid%>"><%=subject %><br></a>
										<%} %>
									</td>
									<td class="gjsh"><%=ref %></td>
									<td class="gjsh"><%=signdate %></td>
								</tr>
								<%
							}
								%>
						</table>
				</td>
		  </tr>
		  <tr>
			    <td colspan="3"></td>
		  </tr>
	</table>
<%@ include file="/include/footer.jsp" %>
	 