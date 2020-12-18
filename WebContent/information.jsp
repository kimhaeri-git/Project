<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<style>
 .mapre{
 	overflow:hidden;/*--내용이 넘치면 자름--*/
 	position:relative;
 	width:100%;
 	height:500px;
 	z-index: -1;/*--header 화면 뒤로--*/
 }
 .mapre iframe{
 	left:0;
 	top:0;
 	height:100%;
 	width:100%;
 	position:absolute;

 }
 .em{
 	padding-top: 270px;
 }
 .cn{
 	text-align: center;
 	width: 100%;
 	border:0px solid black;
 }
 .ai{
 	word-break:keep-all;
 	word-wrap:break-word;
 	margin: 10px 450px 10px; 
 	background-color: #d2c9cd;
 }

</style>
<table class="em">
  <tr>
    <td></td>
  </tr>
</table>
<div class="mapre">
		<div>
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d847627.2471124856!2d18.095609696971266!3d-33.91426882093706!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcc500f8826eed7%3A0x687fe1fc2828aa87!2z64Ko7JWE7ZSE66as7Lm0IOqzte2ZlOq1rSDsvIDsnbTtlITtg4DsmrQ!5e0!3m2!1sko!2skr!4v1604016267993!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		</div>
</div>
<table border=0 width=100%>
	<tr>
		<td class="cn">남아프리카 공화국 케이프타운</td>
	</tr>
</table>
<table border=0 width=100%>
	<tr>
	 	<td class="cn">케이프타운에서 반드시 해야할 9가지</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	하나. 케이블카 타고 테이블마운틴 정상에 오르기</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">테이블마운틴은 케이프타운의 상징과도 같은 산입니다. 윗부분이 평평하게 침식되어 멀리서 보면 테이블과 같이 생겼다고 해서 붙은 이름이 케이블 마운틴입니다.테이블마운틴 정상에 올라가면 푸른 대서양과 케이프타운의 CBD(Central Business District)를 한 눈에 담을 수 있습니다. 아프리카에서 케이프타운 같은 대도시는 손으로 꼽을 수 있기 때문에, 대 자연과 도시의 모습을 한 번에 담는 것이 희귀합니다. 
	 				</td>
	 				<td width="300";><img src="/upload/tablemountain.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	둘. 아프리카에 펭귄이? 볼더스 비치</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">아프리카에 가서 사자나 코끼리 같은 동물을 볼 줄은 알고 있었지만, 펭귄을 볼 수 있을줄은 몰랐습니다. 케이프타운의 희망봉 가는 길목 남쪽 끝에 있는 볼더스 비치(Boulders Beach)는 아프리카 펭귄의 집단 서식지로 귀여운 펭귄을 바로 옆에서 볼 수 있는 곳입니다.
	 				</td>
	 				<td width="300";><img src="/upload/boldersbeach.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	셋. 알록달록 빛나는 건물들이 인상적인 보캅(Bo-kaap)</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">원래 이곳은 아프리카의 아픈 역사의 흔적이 깃든 곳입니다. 네덜란드인들에 의해 강제로 노예로 팔려온 동남아시아계 사람들이 몰려살던 곳이었거든요. 하지만 아파르트헤이트 정권 당시 이곳을 해체하려는 정부에 의해 동남아시아계 사람들은 강제로 이주가 되었고, 1900년대 후반이 되어서야 아파르트헤이트 정권이 무너지면서 일부 사람들이 보캅으로 다시 돌아오게 되었습니다. 그리고 다시 찾은 평화와 자유를 기념하기 위해 이렇게 색색깔로 페인팅을 했다고 하네요. 
	 				</td>
	 				<td width="300";><img src="/upload/BoKaap5.jpg" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	넷. 선원들에겐 희망이 되었다는 희망봉</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">올라가서 보면 험난한 바다가 보입니다. 대서양은 우리가 알고 있는 바다 보다 훨씬 격하고 드라마틱합니다. 그래서 그런지 눈에 담기에는 더 좋습니다. 기대한 것 보다는 다소 별 거 없네 하는 느낌도 있었지만, 희망봉을 주위로 이곳저곳 드라이브하기도 좋은 코스가 많아 겸사겸사 들리는 것을 추천합니다.
	 				</td>
	 				<td width="300";><img src="/upload/hope.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	다섯. 아프리카에도 대형몰이 있다. 커널워크와 워터프론트</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">쇼핑몰이 정말 큽니다. 다른 몰들과 달리 고급 상점도 많고 여행자들을 위해 기념품을 살만한 곳들도 많습니다. 맛집도 많아서 한끼 떼우러 오셔도 좋습니다. 대형 공연장과 놀이기구까지 갖춘 곳이며, 가장 안전한 곳으로 꼽히기 때문에 이곳 주위로 숙소를 찾는 관광객들이 참 많죠. 그만큼 비싸기도 하고요.
	 				</td>
	 				<td width="300";><img src="/upload/waterfront.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	여섯. 케이프타운 엽서의 단골 배경이 되는 선셋 비치</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">선셋비치는 말 그대로 선셋이 유명한 곳인데요, 해변을 뒤로 케이프타운의 모습을 담을 수 있는 유일한 곳이라고 합니다.주로 근처에 사는 부유한 백인 가족들이 휴식을 취하러 나오거나 서핑을 하러 오는 곳입니다. 인적이 많은 곳은 아니지만 그렇게 위험하다고 느끼지는 않았어요. 물론 차가 없으면 방문하기 힘든 곳이긴 합니다. 그래도 기회가 되면 꼭 이곳에서 테이블마운틴을 온전히 느끼시길 바랄게요. 
	 				</td>
	 				<td width="300";><img src="/upload/sunset.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	일곱. 거대한 식물원이자 공원 커스텐보쉬 식물원</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">여행을 하면서 식물원에 가보면 종종 예상 보다 감흥이 있을 때가 많더군요. 식물원이라고 접근하면 안되고 큰 공원을 생각하고 가면 좋습니다. 케이프타운에도 아프리카 식생의 자연을 만끽할 수 있는 곳이 있으니 바로 테이블마운틴 산자락 바로 아래에 있는 커스텐보쉬 식물원입니다.
	 				</td>
	 				<td width="300";><img src="/upload/bosh.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	여덟. 인생드라이브 하기</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">케이프타운 중심가에서 희망봉으로 가는 길 중 챕먼스피크(Chapmans Peak)라는 곳이 있습니다. 산과 바다의 가운데에서 굽이굽이 이어진 드라이브코스인데요, 이탈리아 아말피, 포지타노 만큼이나 멋진 드라이브 코스 중 하나입니다.
	 				</td>
	 				<td width="300";><img src="/upload/drive.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
	<tr>
	 	<td class="cn"><img src="/upload/list.png">
	 	아홉. 남아프리카의 신선한 깔라마리 요리 먹방 찍기</td>
	</tr>
	<tr>
		<td>
			<table class="cn">
				<tr>
					<td width="300";></td>
	 				<td class="ai">남아공은 깔라마리가 유명합니다. 깔라마리는 얼핏 보면 오징어 같이 생긴 바다생물인데요, 오징어와는 또 다르다고 하더군요. 오징어, 한치, 깔라마리 좀 헷갈립니다ㅎㅎ 하지만 식감이나 생김새는 오징어와 흡사했어요.
	 				</td>
	 				<td width="300";><img src="/upload/galamari.png" width="100" height="100"></td>
	 			</tr>
	 		</table>
	 	</td>
	</tr>
</table>
<%@ include file="/include/footer.jsp" %>