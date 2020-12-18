<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 동의</title>
<style type="text/css">
	input[type=checkbox].css-checkbox{
		border:none; background:none;
		position:absolute; left:10px;
	}
	input[type=checkbox].css-checkbox + label{
		display:inline-block;
		padding: 0 0 0 30px;
		height:20px; line-height:20px;
		background: url(img/bg_checkbox.png) no-repeat 0 0;
		background-size:20px 40px;
		vertical-align:middle;
	}
	input[type=checkbox].css-checkbox:checked + label {
		background-position:0  -20px;
	}
	p{
		font-size:13px;
	}
	.a{
		float:right;
		padding: 30px;
	}
</style>
</head>
<body>
	<form action="#">
		<fieldset>
			<legend>이용약관</legend>
			<p>제1조 (목적)</p>
			<p>본 약관은 회원(본 약관에 동의한 자를 말하며 이하 "회원"이라고 합니다)이 주식회사 카카오(이하 "회사"라고 합니다)가 <br>
			제공하는 티스토리(Tistory) 서비스(이하 "서비스"라고 합니다)를 이용함에 있어 
			회사와 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</p>
			<p>제2조 (약관의 명시, 효력 및 개정)</p>
			<p>(1) 회사는 본 약관의 내용을 회원이 알 수 있도록 서비스 화면(www.tistory.com)에 게시함으로써 이를 공지합니다.</p>
			<p>(2) 회사는 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, <br>
					소비자기본법 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</p>
			<p>(3) 회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 
					그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 개정 내용이 회원에게 불리한 경우에는 
					그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 회사가 부여한 이메일 
					주소로 약관 개정 사실을 발송하여 고지합니다.</p>
			<p>(4) 회사가 전항에 따라 회원에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 <br>
					아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 불구하고 거부의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. <br>
					회원이 개정약관에 동의하지 않을 경우 회원은 제14조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p>
			<p>제10조 (회사의 의무)</p>
			<p>(1) 회사는 회사의 서비스 제공 및 보안과 관련된 설비를 지속적이고 안정적인 서비스 제공에 적합하도록 유지, 점검 또는 복구 등의 조치를 성실히 이행하여야 합니다.</p>
			<p>(2) 회사는 회원이 원하지 아니하는 영리 목적의 광고성 전자우편을 발송하지 아니합니다.</p>
			<p>(3) 회사는 서비스의 제공과 관련하여 알게 된 회원의 개인정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않고, 이를 보호하기 위하여 노력합니다. <br>
			회원의 개인정보보호에 관한 기타의 사항은 정보통신망 이용촉진 및 정보보호등에 관한 법률 등 관계법령 및 회사가 별도로 정한 “개인정보처리방침”에 따릅니다.
			<p>제11조 (회원의 의무)</p>
			<p>(1) 회원은 아래 각 호의 1에 해당하는 행위를 하여서는 안됩니다.</p>
			<p>①회원정보에 허위내용을 등록하는 행위</p>
			<p>②회사의 서비스에 게시된 정보를 변경하거나 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 영리 또는 비영리의 목적으로 복제, 출판, 방송 등에 사용하거나
			 제3자에게 제공하는 행위</p>
			<p>③회사가 제공하는 서비스를 이용하여 제3자에게 본인을 홍보할 기회를 제공 하거나 제3자의 홍보를 대행하는 등의 방법으로 금전을 수수하거나 서비스를 이용할 권리를 <br>
			양도하고 이를 대가로 금전을 수수하는 행위</p>
			<p>④회사 기타 제3자의 명예를 훼손하거나 지적재산권을 침해하는 등 회사나 제3자의 권리를 침해하는 행위<p>
			<p>⑤다른 회원의 이메일주소 및 비밀번호를 도용하여 부당하게 서비스를 이용한 경우</p>
			
			<p>제14조 (이용계약의 해지)</p>
			<p>회원은 서비스 이용계약을 해지하고자 하는 때에는 회사가 제공하는 서비스 내의 회원탈퇴 기능을 이용하여 탈퇴를 요청할 수 있습니다. <br>
					회사는 탈퇴를 요청한 시점에서 제8조 제(1)항의 각호에 해당하는 범위 외 불가피한 사정이 없는 한 즉시 탈퇴요청을 처리합니다.</p>
			<p>회원이 제11조의 규정을 위반한 경우 회사는 일방적으로 본 계약을 해지할 수 있고, 이로 인하여 서비스 운영에 손해가 발생한 경우 이에 대한 민∙형사상 책임도 물을 수 있습니다.<br>
			<p>회원이 서비스를 이용하는 도중, 연속하여 일(1)년 동안 서비스를 이용하기 위해 회사의 서비스에 log-in한 기록이 없는 경우 회사는 회원의 회원자격을 상실시킬 수 있습니다.<br>
					본 이용 계약이 해지된 경우 회원의 게시물 등 일체는 삭제됩니다. 단, 제9조 제(4)항의 경우에는 그러하지 않습니다.</p>
		</fieldset>
	</form>
			
	<input type="checkbox" class="css-check" id="chk1">
	<label for="chk1">서비스 이용약관 동의</label><br>
	<input type="checkbox" class="css-checkbox" id="chk2" checked>
	<label for="chk2">개인정보 취급방침 동의</label><br>
	<input type="checkbox" class="css-checkbox" id="chk3">
	<label for="chk3">위치정보 활용 동의</label>
	<br>
	<div class="a"><input type="submit" value="가입" onclick="join()"></div>
</body>
<script>
		function join(){
			location.href="/member/join.jsp";
		}
</script>
</html>