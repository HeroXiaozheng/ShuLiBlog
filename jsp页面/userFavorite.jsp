<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>${userinfo.username }</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<!--css文件导入-->
		<link href="<%=path %>/css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
		<!-- JS文件导入 -->
		<script src="<%=path %>/js/jquery.min.js"></script>
		<!-- web-fonts -->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
    	<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
        <script type="text/javascript" src="<%=path %>/dwr/interface/readArticle.js"></script>
        <script type="text/javascript" src="<%=path %>/dwr/interface/DeleteArticle.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//判断是否为用户本人
				var flag = '${isHimself}';
				if(flag == 'true'){
					$(".follow").hide();
					$(".sendmsg").hide();
					$(".otherdetails").hide();
					$(".mydetails").show();
					$(".delete").show();
				}else {
					$(".follow").show();
					$(".sendmsg").show();
					$(".mydetails").hide();
					$(".otherdetails").show();
					$(".delete").hide();
				}
			});
		</script>
		<script type="text/javascript">
		//关注
	    function follow(userid,followid){
	     if('${sessionScope.userid}'==""){
	    	 alert("请先登录再关注");
	     }else{
	    	 document.getElementById("followDisplay1").style.display="none";
		     readArticle.getReadArticleFollowBool(userid,followid,function(bool){	   
		     if(bool){
		     	$("#followDisplay2").hide();
		     	$("#followDisplay3").show();
		     	}else{
		    	 $("#followDisplay2").show();
		    	 $("#followDisplay3").hide();
		    	 }
		  });
	     }
	    
	}
</script>
	</head>
	<body>
  		<c:forEach items="${favoriteList }" var="favor">
	  		<div class="articles${favor.article.articleid }" style="position:relative;bottom:20px;">
		    <div class="articles" style="width: 90%;">
					<div class="article">
		            <div class="article-left">
		              <a href="readArticle?articleid=${favor.article.articleid } " target="_blank"><img src="cover?articleid=${favor.article.articleid }" style="width:200px;height:100px;"></a>
		            </div>
		            <div class="article-right" style="position:relative;right:190px;">
		              <div class="article-title">
		                <p>
		                 <a class="span_link" href="userpage?userid=${favor.article.userid }" target="_blank">
                         <span>${favor.username }</span>
                         </a>
		                 <a class="span_link" href="readArticle?articleid=${favor.article.articleid}" target="_blank">
                         <span><img src="images/view.png">${favor.vcount }</span>
                         </a>
                         <!-- 文章评论 -->
                         <a class="span_link" href="readArticle?articleid=${favor.article.articleid }#tocomment" target="_blank">
                         <span><img src="images/comment.png">${favor.commentcount}</span> 
                         </a>
                         <!-- 文章点赞 -->
                       	 <span class="span_link" style="font-size:14px;"><img src="images/thumb.png">${favor.likescount }</span>
                    	 <span class="delete"><a class="span_link" href="javascript:void(0);" onclick="deleteArticle('${favor.article.articleid }');">删除</a></span>
                    	</p>
		                <a class="title" href="readArticle?articleid=${favor.article.articleid}" target="_blank">${favor.article.title}</a>
		              </div>
		             </div>
		            <div class="clearfix"></div>
		          </div>
		  </div>
		  </div>
		  </c:forEach>
		
	</body>
</html>