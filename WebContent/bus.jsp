<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<style>
	.slides {
	    padding: 0;
	    width: 609px;
	    height: 420px;
	    display: block;
	    margin: 0 auto;
	    position: relative;
	}
	
	.slides * {
	    user-select: none;
	    -ms-user-select: none;
	    -moz-user-select: none;
	    -khtml-user-select: none;
	    -webkit-user-select: none;
	    -webkit-touch-callout: none;
	}
	
	.slides input { display: none; }
	
	.slide-container { display: block; }
	
	.slide {
	    top: 0;
	    opacity: 0;
	    width: 609px;
	    height: 420px;
	    display: block;
	    position: absolute;
	    transform: scale(0);
	    transition: all .7s ease-in-out;
	}
	
	.slide img {
	    width: 100%;
	    height: 100%;
	}
	
	.nav label {
	    width: 200px;
	    height: 100%;
	    display: none;
	    position: absolute;
	
	    opacity: 0;
	    z-index: 9;
	    cursor: pointer;
	
	    transition: opacity .2s;
	
	    color: #FFF;
	    font-size: 156pt;
	    text-align: center;
	    line-height: 380px;
	    font-family: "Varela Round", sans-serif;
	    background-color: rgba(255, 255, 255, .3);
	    text-shadow: 0px 0px 15px rgb(119, 119, 119);
	}
	
	.slide:hover + .nav label { opacity: 0.5; }
	
	.nav label:hover { opacity: 1; }
	
	.nav .next { right: 0; }
	
	input:checked + .slide-container  .slide {
	    opacity: 1;
	
	    transform: scale(1);
	
	    transition: opacity 1s ease-in-out;
	}
	
	input:checked + .slide-container .nav label { display: block; }
	
	.nav-dots {
	    width: 100%;
	    bottom: 9px;
	    height: 11px;
	    display: block;
	    position: absolute;
	    text-align: center;
	}
	
	.nav-dots .nav-dot {
	    top: -5px;
	    width: 11px;
	    height: 11px;
	    margin: 0 4px;
	    position: relative;
	    border-radius: 100%;
	    display: inline-block;
	    background-color: rgba(0, 0, 0, 0.6);
	}
	
	.nav-dots .nav-dot:hover {
	    cursor: pointer;
	    background-color: rgba(0, 0, 0, 0.8);
	}
	
	input#img-1:checked ~ .nav-dots label#img-dot-1,
	input#img-2:checked ~ .nav-dots label#img-dot-2,
	input#img-3:checked ~ .nav-dots label#img-dot-3,
	input#img-4:checked ~ .nav-dots label#img-dot-4,
	input#img-5:checked ~ .nav-dots label#img-dot-5,
	input#img-6:checked ~ .nav-dots label#img-dot-6 {
	    background: rgba(0, 0, 0, 0.8);
	}
	.gan{
		font-family: 'Nanum Pen Script', cursive;
		padding-top: 250px;
		font-size : 30px;
		text-align: center;
	}
	.car{
		font-size: 30px;
		text-align: center;
	}
</style>
<div class="gan">
	<b>케이프타운: 시티투어 버스</b>
</div>
<div >
	<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
        <div class="slide">
            <img src="/upload/bus1.png" />
        </div>
        <div class="nav">
            <label for="img-6" class="prev">&#x2039;</label>
            <label for="img-2" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="/upload/bus2.png" />
        </div>
        <div class="nav">
            <label for="img-1" class="prev">&#x2039;</label>
            <label for="img-3" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="/upload/bus3.png" />
        </div>
        <div class="nav">
            <label for="img-2" class="prev">&#x2039;</label>
            <label for="img-4" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="/upload/bus4.png" />
        </div>
        <div class="nav">
            <label for="img-3" class="prev">&#x2039;</label>
            <label for="img-5" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="/upload/bus5.png" />
        </div>
        <div class="nav">
            <label for="img-4" class="prev">&#x2039;</label>
            <label for="img-6" class="next">&#x203a;</label>
        </div>
    </li>
    
    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="/upload/bus6.png" />
        </div>
        <div class="nav">
            <label for="img-5" class="prev">&#x2039;</label>
            <label for="img-1" class="next">&#x203a;</label>
        </div>
    </li>
	    <li class="nav-dots">
	      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
	      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
	      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
	      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
	      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
	      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    	</li>
	</ul>
	</div>
	<div>
		<fieldset><legend>City Bus</legend>
			<ul>
				<li>케이프타운의 상징, 테이블 마운틴 (Table Mountain) 을 방문해보세요.</li>
				<li>캠프스 베이와 클리프톤의 장엄한 해안선을 목동하세요!</li>
				<li>활기찬 번화가 V&A 워터프론트에서 쇼핑하고 저녁식사를 먹어보세요.</li>
				<li>커스텐보시 국립식물원 (Kirstenbosch National Botanical Garden) 에 방문하세요!</li>
				<li>코스탄티아 골짜기 (Constantia Valley) 에서 와인 투어를 즐겨보세요!</li>
			</ul>
			<ul>
				<p><b>[레드 시티 투어 The Red City Tour]</b></p>
				<li>1 V&A 워터프론트 Waterfont</li>
				<li>2 클락 타워 The Clock tower</li>
				<li>3 케이프타운 컨벤션센터 Cape Town Convention Centre</li>
				<li>4 포쇼어 Foreshore</li>
				<li>5 롱스트리트 81 Long Street</li>
				<li>6 쥬얼 아프리카Jewel Africa</li>
				<li>7 케이블웨이 Cableway</li>
				<li>8 캠프스 베이 Camps Bay</li>
				<li>9 프레지던트 호텔 President Hotel</li>
				<li>10 세인트 존스 로드 St John's Road</li>
			</ul>
		</fieldset>
	</div>
	<div align="center"><img src="/upload/line1.png" width="1100px" height="40px"></div>
	<div class="car">
	<b> 카렌트 정보 </b>
	</div>
	<div align="center">
		<tr>
			<td>
				<img src="/upload/car0.png" >
			</td>
		</tr>
		<tr>
			<td>
				<a href="https://aviscarsales.co.za/vehicle-details/volkswagen/2019/polo-vivo-1.4-trendline-(5dr)/sil/mol06821_u12azvwpr00000111/" target="_blank"><img src="/upload/car1.png"></a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="https://aviscarsales.co.za/vehicle-details/suzuki/2019/celerio-1.0-ga/whi/mol06821_u12azsuzr00000028/" target="_blank"><img src="/upload/car2.png"></a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="https://aviscarsales.co.za/vehicle-details/suzuki/2019/celerio-1.0-ga/whi/mol06821_u12azsuzr00000028/" target="_blank"><img src="/upload/car3.png"></a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="https://aviscarsales.co.za/vehicle-details/toyota/2019/fortuner-2.8gd-6-r(b-(2016-3)---(2020-3)/whi/mol00118_u33aztoyr00000043/" target="_blank"><img src="/upload/car4.png">
			</td>
		</tr>
	</div>

<%@ include file="/include/footer.jsp" %>