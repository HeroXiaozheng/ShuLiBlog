<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发私信给${receiveusername }</title>
    
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/qq.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/chat.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.sendBtn').on('click',function(){
				var news=$('#dope').val();
				if(news==''){
					alert('不能为空');
				}else{
					$('#dope').val('');
				var str='';
				str+='<li>'+
						'<div class="nesHead"><img src="myimg?userid='+$(".myuserid").val()+'"/></div>'+
						'<div class="news">'+news+'</div>'+
					'</li>';
				$('.newsList').append(str);
				$('.conLeft').find('li.bg').children('.liRight').children('.infor').text(news);
				$('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
				$.post("savemsg",{userid:'${sessionScope.userid}',receiveid:'${receiveid}',scontent:news});
			}
		});
	});
	</script>



  </head>
  
  <body>
    <div class="conRight" style="width:60%;margin-left:250px;margin-top:50px;border:1px solid #ccc;">
			<div class="Righthead">
				<div class="headName">${receiveusername }</div>
			</div>
			<div class="RightCont">
				<ul class="newsList">
				
				</ul>
			</div>
			<div class="RightFoot">
				<div class="emjon">
					<ul>
						<li><img src="images/em_02.jpg"></li>
						<li><img src="images/em_05.jpg"></li>
						<li><img src="images/em_07.jpg"></li>
						<li><img src="images/em_12.jpg"></li>
						<li><img src="images/em_14.jpg"></li>
						<li><img src="images/em_16.jpg"></li>
						<li><img src="images/em_20.jpg"></li>
						<li><img src="images/em_23.jpg"></li>
						<li><img src="images/em_25.jpg"></li>
						<li><img src="images/em_30.jpg"></li>
						<li><img src="images/em_31.jpg"></li>
						<li><img src="images/em_33.jpg"></li>
						<li><img src="images/em_37.jpg"></li>
						<li><img src="images/em_38.jpg"></li>
						<li><img src="images/em_40.jpg"></li>
						<li><img src="images/em_45.jpg"></li>
						<li><img src="images/em_47.jpg"></li>
						<li><img src="images/em_48.jpg"></li>
						<li><img src="images/em_52.jpg"></li>
						<li><img src="images/em_54.jpg"></li>
						<li><img src="images/em_55.jpg"></li>
					</ul>
				</div>
				<div class="footTop">
					<ul>
						<li class="ExP"><img src="images/20170926103645_33.jpg"></li>
					</ul>
				</div>
				<div class="inputBox">
					<textarea id="dope" style="width: 99%;height: 75px; border: none;outline: none;resize:none" name="dope"></textarea>
					<input class="myuserid" type="hidden" value="${sessionScope.userid }">
					<button class="sendBtn">发送(s)</button>
				</div>
			</div>
		</div>
  </body>

</html>
