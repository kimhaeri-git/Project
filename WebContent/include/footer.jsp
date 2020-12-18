<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	 .font{
	  font-size: medium;
	 }
</style> 
 <div><hr></div>  
   <div align="center" class="font">
		<span>© 2020 Tour in Capetown LLC All rights reserved.</span>
	
		<span>&nbsp<a href="https://iamaileen.com/top-instagram-spots-in-cape-town-south-africa-instagrammable/"><img src="/upload/instargram.png" style="width:20px;height:20px;" alt ="instagram_capetown_spot"></a>&nbsp</span>
	
		<span>&nbsp<a href="https://www.facebook.com/CapeTownEtc/"><img src="/upload/ico_face.png" style="width:20px;height:20px;" alt ="facebook_capetown_inform">&nbsp</span>
	
		<span>&nbsp<a href="https://www.youtube.com/watch?v=sQPXvtJQ9p4"><img src="/upload/youtube.png" style="width:20px;height:20px;" alt ="youtube_capetown_inform">&nbsp</span>
	
		<span>&nbsp<a href="https://twitter.com/vandawaterfront"><img src="/upload/ico_twitter.png" style="width:20px;height:20px;" alt ="twitter_capetown_inform">&nbsp</span>
	</div>
	<div align="center" class="font">
		<script>
			document.write('GMT (남아프리카 공화국 시간 ): ',	getWorldTime(+2),	'<br /><br />' )
			
			function getWorldTime(tzOffset){//24시간제
				var now = new Date();
				var tz = now.getTime() + (now.getTimezoneOffset() * 60000) + (tzOffset * 3600000);
				now.setTime(tz);
				
				var s = 
					leadingZeros(now.getFullYear(),4) + '-' +
					leadingZeros(now.getMonth() + 1,2) + '-' +
					leadingZeros(now.getDate(),2) + '' +
					
					leadingZeros(now.getHours(), 2) + ':' +
					leadingZeros(now.getMinutes(), 2) + ':' +
					leadingZeros(now.getSeconds(), 2);
					
					return s;
			}
			
			function leadingZeros(n, digits){
				var zero = '';
				n = n.toString();
				
				if(n.length < digits){
					for (i = 0; i<digits - n.length; i++)
						zero += '0';
				}
				return zero + n;
			}
		</script>
    </div>
  </body>
  </html>