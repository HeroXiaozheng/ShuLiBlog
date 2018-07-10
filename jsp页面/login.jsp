<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Splendid Bifold Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- Custom Theme files -->
  <link href="css/loginstyle.css" rel="stylesheet" type="text/css" media="all" />
  <!-- //Custom Theme files -->
  <!-- web font -->
  <link href="//fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- //web font -->	
  <script src="<%=path %>/js/jquery.js"></script>
  
  
  
  
  </head>
  
  <body>
    <h1 class="torecommend"><a href="recommend" style="text-decoration: none;color:#fff;cursor:pointer;">书理</a></h1>
	<div class="main-agileits">
	<!--form-stars-here-->
		<div class="left-form-w3-agile">
			<h2>登录<a href="reg.jsp"><span class="reg">注册新用户</span></a></h2>
				<form action="login" method="post">		
				<div class="inputs-w3ls-left">
					<a class="fa fa-envelope-o" aria-hidden="true"></a>
					<input type="text" class="email" name="Email" id="userid" value="${cookie.userid.value }" placeholder="用户名" required=""/>
				</div>
				<div class="inputs-w3ls-left">
					<a class="fa fa-key" aria-hidden="true"></a>
					<input type="password" class="password" name="Password" id="password" value="${cookie.pwd.value }" placeholder="密码" onblur="check();"/>
				</div>
				<c:if test="${param.err!=null }">
				<div>
					<span id="s" style="Color:red;">账户或密码错误</span>
				</div>
				</c:if>
					<div class="wthree-text"> 
						<ul> 
							<li>
								<label class="anim">
									<input type="checkbox" name="checkbox" class="checkbox" checked>
									<span>记住密码？</span> 
								</label> 
							</li>
							<li> <a href="#">忘记密码？</a> </li>
						</ul>
						<div class="clear"> </div>
						</div>  
						<input type="submit" value="登录" id="loginbtn"> 
						</form>
		</div>
<!--//form-ends-here-->
		
<div class="clear"></div>
</body>
</html>
