<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="书理" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- Custom Theme files -->
	<link href="<%=path %>/css/loginstyle.css" rel="stylesheet" type="text/css" media="all" />
	<!-- //Custom Theme files -->
	<!-- web font -->
	<link href="//fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- //web font -->
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
	<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
  	<script type="text/javascript" src="<%=path %>/dwr/interface/reg.js"></script>
 
	<script type="text/javascript">
		function formSubmit(){
			    var pass2=document.getElementById("password2").value;
				var pass1=document.getElementById("password1").value;
				var s1 = document.getElementById("s1").style.display;
				if(s1=="inline"){
				}
			    else if(pass1!=pass2){
				  	document.getElementById("s2").style.display="inline";
				}
				else{
					document.getElementById("myForm").submit();		
				}
		}
	</script>
	<script type="text/javascript">
		function check(v){
			reg.getRegBool(v,function(bool){
				if(bool){
					document.getElementById("s1").style.display="inline";
				}else{
					document.getElementById("s1").style.display="none";
				}
			});
		}
	</script>
  </head>
  <body>
   <h1 class="torecommend"><a href="recommend">书理</a></h1>
   <div class="main-agileits">
		<div class="right-map-w3-agile">
		<h3>注册<a href="login.jsp"><span class="login">使用已有账号登录</span></a></h3>
			<form id="myForm" action="reg" method="post">
			<div class="inputs-w3ls">
				<input type="text" id="Name" name="Name" placeholder="请输入用户名" onblur="check(this.value)"/>
				<c:if test="${param.err!=null }">
				<span id="s" style="Color:red;position:relative;bottom:17px;">此用户已注册</span>
				</c:if>				
				<span id="s1" style="Color:red;position:relative;bottom:17px;display:none;">此用户已注册</span>
			</div>			
			<div class="inputs-w3ls">
				<a class="fa fa-key" aria-hidden="true"></a>
				<input type="password" class="password" name="Password" id="password1" placeholder="请输入密码"/>
			</div>
			<div class="inputs-w3ls">
				<a class="fa fa-key" aria-hidden="true"></a>
				<input type="password" class="password" name="Confirm Password" id="password2" placeholder="请确认密码" onblur="formSubmit();"/>
				<span id="s2" style="Color:red;position:relative;bottom:17px;display:none;">确认密码与之前不一致</span>			
			</div>	
			<div>
				<input class="register" type="button" onclick="formSubmit()" value="注册">  
			</div>
			</form> 
		</div>
<div class="clear"></div>
</div>
  </body>
</html>
