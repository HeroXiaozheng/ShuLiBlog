<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<!--css文件导入-->
	    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	    <link href="css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
	    <!-- web-fonts -->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
		<script src="js/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery.js"></script>
<style>
.searcharticle{
	margin: 120px 200px -60px 200px;
	overflow:hidden;
}
.inputkeywords{
	width: 600px;
	height: 45px;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	border:1px solid rgb(66,133,244);
	padding-left: 10px;
}
.searchbtn{
	width: 150px;
	height: 49px;
	background-color: rgb(66,133,244);
	border:1px solid rgb(66,133,244);
	color: #fff;
	font-size: 15px;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
	position: relative;
	top: 1px;
	right: 5px;
}
.countsearch{
    color: rgb(150,150,150);
    position: relative;
    top: 80px;
    right:200px;
    font-size: 15px;
}  
    
    </style>
  </head>
  
  <body>
  <%@include file="Head.jsp" %>
    <div class="main-body">
      <div class="searcharticle">
      <form action="search-article" method="post">
        <input type="text" placeholder="请输入关键字" class="inputkeywords" value="${search }" name="search">
        <input type="submit" class="searchbtn" value="站内搜索">
      </form>
      </div>
      <span class="countsearch">含" <span style="color:red;font-weight:bold;">${search }</span> "的搜索结果约<span style="color:red;font-weight:bold;">${count }</span>条</span>
        <div class="left-main" style="margin-left: 210px; width: 60%;margin-top: 130px;">
              <div class="articles">
              <c:forEach items="${searchpage.artlist }" var="searchpage" varStatus="status">
              <div class="article">
          <!-- 文章封面 --> 
            <div class="article-left">
              <a href="articleDetail?articleid=${searchpage.articleid } " target="_blank"><img src="cover?articleid=${searchpage.articleid }"></a>
            </div>
            <div class="article-right">
              <div class="article-title">
                <p>
                    <!-- 文章作者 -->
                    <a class="span_link" href="#">
                         <span>${searchpage.userid }</span> 
                         </a>
                     <!-- 文章浏览 -->
                     <a class="span_link" href="articleDetail?articleid=${searchpage.articleid}" target="_blank">
                         <span><img src="images/view.png">${searchpage.vcount}</span>
                         </a>
                         <!-- 文章评论 -->
                         <a class="span_link" href="articleDetail?articleid=${searchpage.articleid}#tocomment" target="_blank">
                         <span><img src="images/comment.png">0</span> 
                         </a>
                         <!-- 文章点赞 -->
                         <c:set var="likesarticleid" value="${searchpage.articleid}" target="${searchpage.articleid}" />
                       	 <span class="glyphicon glyphicon-thumbs-up" style="font-size:14px;">${likescount }</span>
                        
                    </p>
                <!-- 文章标题 -->
                <a class="title" href="articleDetail?articleid=${searchpage.articleid}" target="_blank">${searchpage.title}</a>
              </div>
              <div class="article-text">
              <!-- 文章正文 -->
                <div id="sea${status.index}">${searchpage.scontent}</div>
                <script type="text/javascript">
                $(document).ready(function(){
                $("#sea"+'${status.index}').text($("#sea"+'${status.index}').text().substr(0,80)+"...");
                });
                </script>
                <div class="clearfix"></div>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
              </c:forEach>
      </div>
      <script type="text/javascript">
      	function ReadMost(){
      		$.post("search-morearticle",{page:$("#hiddenpage").val(),search1:$(".inputkeywords").val()},function(data){
      			if(data.length<10){
      				alert("没有更多文章了");
      			}else{
      				$("#new").html($("#new").html()+data);
          			var page = parseInt($("#hiddenpage").val())+1;
          			$("#hiddenpage").val(page);
      			}
      		});
      	}
      </script>
      <span id="read1" style="display:block;">
      <a href="javascript:void(0);" onclick="ReadMost()" class="load-more">阅读更多</a>     
      </span>
      </div>
      <input type="hidden" id="hiddenpage" value="2"/>
    </div>
    <div class="side-tool">
  	  	<ul>
		<li id="top" data-placement="left" data-toggle="tooltip" data-container="body" data-original-title="回到顶部" style="display:none">
			<a  href="javascript:void(0);"><span class="iconfont ic-backtop" ><!--<span>回到顶部</span>--></span></a>
		</li>
		</ul>
	</div>
	<script type="text/javascript">
  		$(function () {
    		$(window).scroll(function () {
        		if ($(window).scrollTop() >= 350) {
            		$('#top').fadeIn();
        		}else {
            		$('#top').fadeOut();
        		}
	    	});
		});
		$('#top').click(function () {
    		$('html,body').animate({ scrollTop: 0 }, 500);
		});
  	</script>
  </body>
</html>
