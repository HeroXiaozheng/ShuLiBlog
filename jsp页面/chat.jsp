<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书理——聊天界面</title>
    
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/qq.css">
	
	
	
  </head>
  
  <body>
	<div class="qqBox">
	<div class="context">
		<div class="conLeft">
				<div class="conLeftHead">
					<div class="liLeft"><img src="myimg?userid=${sessionScope.userid }" style="width:50px;height:50px;"><span class="liLeft">${sessionScope.userid }</span></div>
				</div>
				<div class="conLeftHead">
					<form>
						<img src="images/chatsearch.png">
		                <input class="sb-search-input" placeholder="查找联系人" type="search" name="search" id="search">
		            </form>
				</div>
			<div class="conLeftScroll">
			<ul>
				<li>
					<div class="liLeft"><img src="images/20170926103645_04.jpg"></div>
					<div class="liRight">
						<span class="intername">前端交流群</span>
						<span class="infor">厉害了</span>
					</div>
				</li>
				<li>
					<div class="liLeft"><img src="images/20170926103645_27.jpg"></div>
					<div class="liRight">
						<span  class="intername">前端交流群</span>
						<span class="infor">[流泪]</span>
					</div>
				</li>
				<li>
					<div class="liLeft"><img src="images/20170926103645_29.jpg"></div>
					<div class="liRight">
						<span  class="intername">前端交流群</span>
						<span class="infor">[流泪]</span>
					</div>
				</li>
				<li>
					<div class="liLeft"><img src="images/20170926103645_54.jpg"></div>
					<div class="liRight">
						<span  class="intername">前端交流群</span>
						<span class="infor">[流泪]</span>
					</div>
				</li>
			</ul>
			</div>
		</div>
		<div class="conRight">
			<div class="Righthead">
				<div class="headName"></div>
				<div id="headName1" style="display: none;"><a href="javascipt:void(0)"><img src="images/msgfollow.png"></a></div>
				<div id="headName2" style="display: none;"><a href="javascipt:void(0)"><img src="images/msgfollowed.png"></a></div>
				<div id="addfollow"></div>
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
					<textarea id="dope" style="width: 99%;height: 75px; border: none;outline: none;" name="" rows="" cols=""></textarea>
					<button class="sendBtn">发送(s)</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/chat.js"></script>
</div>
</body>
</html>
