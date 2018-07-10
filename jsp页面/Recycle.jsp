<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书理—回收站
    </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--css文件导入-->
		<link href="<%=path %>/css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
		<!-- JS文件导入 -->
		<script src="<%=path %>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
    	<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
        <script type="text/javascript" src="<%=path %>/dwr/interface/DeleteArticle.js"></script>
		<script type="text/javascript">
		/*恢复文章*/
			function restoreArticle(articleid){
				DeleteArticle.restoreArticle(articleid);
				$(".articles"+articleid).css("display","none");
			}
			/*恢复文章*/
			function deleteForever(articleid){
				if(confirm("确认永久删除吗？")){
					DeleteArticle.deleteForever(articleid);
					$(".articles"+articleid).css("display","none");
				}
			}
		</script>


  </head>
  
  <body>
 
   <%@include file="Head.jsp" %>
    <div class="left-main">
   <c:forEach items="${artPagelist }" var="authorlist">
	  		<div class="articles${authorlist.article.articleid }">
		    <div class="articles" style="width: 90%;">
					<div class="article">
		            <div class="article-left">
		              <a href="readArticle?articleid=${authorlist.article.articleid } " target="_blank"><img src="cover?articleid=${authorlist.article.articleid }" style="width:200px;height:100px;"></a>
		            </div>
		            <div class="article-right">
		              <div class="article-title">
		                <p><a class="span_link" href="readArticle?articleid=${authorlist.article.articleid}" target="_blank">
                         <span><img src="images/view.png">${authorlist.article.vcount }</span>
                         </a>
                         <!-- 文章评论 -->
                         <a class="span_link" href="readArticle?articleid=${authorlist.article.articleid }#tocomment" target="_blank">
                         <span><img src="images/comment.png">${authorlist.commentCount}</span> 
                         </a>
                         <!-- 文章点赞 -->
                       	 <span class="span_link" style="font-size:14px;"><img src="images/thumb.png">${authorlist.likesCount }</span>
                    	 <span class="delete" style="padding-left:20px;padding-right:20px;"><a class="span_link" href="javascript:void(0);" onclick="deleteForever('${authorlist.article.articleid }');">永久删除</a></span>
                    	 <span class="delete"><a class="span_link" href="javascript:void(0);" onclick="restoreArticle('${authorlist.article.articleid }');">恢复</a></span>
                    	</p>
		                <a class="title" href="readArticle?articleid=${authorlist.article.articleid}" target="_blank">${authorlist.article.title}</a>
		              </div>
		             </div>
		            <div class="clearfix"></div>
		          </div>
		  </div>
		  </div>
		  </c:forEach>
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
