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
				//粉丝
				$(".follows").on("click",function(){
					$(".userfollows").show();
					$(".userArtiicle").hide();
					$(".userfavorite").hide();
					$(".userlike").hide();
				});
				//关注
				$(".follower").on("click",function(){
					$(".userfollower").show();
					$(".userfollows").hide();
					$(".userArtiicle").hide();
					$(".userfavorite").hide();
					$(".userlike").hide();
				});
				//文章
				$(".userarticle").on("click",function(){
					$(".userfollower").hide();
					$(".userfollows").hide();
					$(".userArtiicle").show();
					$(".userfavorite").hide();
					$(".userlike").hide();
				});
				//收藏文章
				$(".userfavor").on("click",function(){
					$(".userfollower").hide();
					$(".userfollows").hide();
					$(".userArtiicle").hide();
					$(".userfavorite").show();
					$(".userlike").hide();
				});
				//点赞文章
				$(".userlikes").on("click",function(){
					$(".userfollower").hide();
					$(".userfollows").hide();
					$(".userArtiicle").hide();
					$(".userfavorite").hide();
					$(".userlike").show();
				});
			});
			/*删除文章*/
			function deleteArticle(articleid){
				alert("文章已移入回收站，15天之内将永久删除");
				DeleteArticle.deleteArticle(articleid);
				$(".articles"+articleid).css("display","none");
			}
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
	//iframe自适应
	function SetWinHeight(obj){   
		var win=obj;   
			if (document.getElementById){   
				if (win && !window.opera){   
					if (win.contentDocument && win.contentDocument.body.offsetHeight)   
						win.height = win.contentDocument.body.offsetHeight;   
					else if(win.Document && win.Document.body.scrollHeight)   
						win.height = win.Document.body.scrollHeight;   
			}   
		}   
	}
	
</script>
<style>
iframe{
	margin-top:20px;
	width:100%;
	height:700px;
	border:none;
	scrolling:no;
	frameborder:none;
}
</style>
	</head>
	<body>
	<%@include file="Head.jsp" %>
	  <!--主体-->
	  <div class="main-body">
	  	<div class="left-main">
	  		<div class="user-info">
	  			<div class="userimg">
	  				<a href="javascript:void(0)"><img src="myimg?userid=${userinfo.userid }" alt="作者名"></a>
	  			</div>
	  			<div class="userid">
	  				<a href="javascript:void(0)" style="margin-right:100px;">${userinfo.username }</a>
	  				<c:choose>
  					<c:when test="${sessionScope.userid==null }">
  						<a href="javascript:void(0);" class="sendmsg" onclick="follow('${sessionScope.userid}','${userinfo.userid}')">
  						<span id="followDisplay1">
  						<span>关注</span>
  						</span>
  						</a><!--关注-->
  					</c:when>
  					<c:when test="${userinfo.userid!=sessionScope.userid }">
  						<a href="javascript:void(0);" class="sendmsg" onclick="follow('${sessionScope.userid}','${userinfo.userid}')">
  						<span id="followDisplay1">
  						<c:if test="${read.areFollow==false}">
  						<span class="notfollow">关注</span>
  						</c:if>
  						<c:if test="${read.areFollow==true }">
  						<span class="followed">已关注</span>
  						</c:if>
  						</span>
  						<span id="followDisplay2" style="display:none;">关注</span>
  						<span id="followDisplay3" style="display:none;">已关注</span>
  						</a><!--关注-->
  					</c:when>
  					<c:otherwise>
  					</c:otherwise>
  				</c:choose>
				<!--关注-->
  				<a href="sendmsg?userid=${userinfo.userid }" class="sendmsg" target="_blank" ><span>发私信</span></a><!--关注-->
	  			</div>
	  			<div style="color: rgb(150,150,150);font-size: 15px;margin-top: 15px;margin-bottom: 5px;position: relative;left: 30px;">个人简介:${userinfo.intro }</div>
	  			<div class="detailinfo">
  					<ul>
  						<li>
  							<div class="meta-block">
  								<a href="userfollower?userid=${userinfo.userid }" target="userfollower" class="follower">
  									<p>${followUserCount }</p>关注<span class="iconfont ic-arrow"></span>
  								</a>
  							</div>
						</li>
  						<li>
   							<div class="meta-block">
  								<a href="userfollows?userid=${userinfo.userid }" target="userfollows" class="follows">
  									<p>${followidCount }</p>粉丝<i class="iconfont ic-arrow"></i>
  								</a>
  							</div>
  						</li>
  						<li>
   							<div class="meta-block">
  								<a href="javascript:void(0);" class="userarticle">
  									<p>${articleCount }</p>文章<i class="iconfont ic-arrow"></i>
  								</a>
  							</div>
  						</li>
  					</ul>
  				</div>
	  		</div>
	  		<iframe name="userfollows" scrolling="no" style="display:none;" class="userfollows" onload="SetWinHeight(this);"></iframe>
	  		<iframe name="userfollower" scrolling="no" style="display:none;" class="userfollower" onload="SetWinHeight(this);"></iframe>
	  		<iframe name="userfavorite" scrolling="no" style="display:none;" class="userfavorite" onload="SetWinHeight(this);"></iframe>
	  		<iframe name="userlikes" scrolling="no" style="display:none;" class="userlike" onload="SetWinHeight(this);"></iframe>
	  		<div class="userArtiicle">
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
                    	 <span class="delete"><a class="span_link" href="javascript:void(0);" onclick="deleteArticle('${authorlist.article.articleid }');">删除</a></span>
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
	  	</div>
	  	<div class="right-main">
 	  		<div class="otherdetails">
	  			<a href="javascript:void(0);" class="userarticle"><img src="images/otherpage.jpg"></a>
	  		</div>
	  		<div class="otherdetails">
	  			<a href="userfavorite?userid=${userinfo.userid }" class="userfavor" target="userfavorite"><img src="images/otherfavor.jpg"></a>
	  		</div>
	  		<div class="otherdetails">
	  			<a href="userlike?userid=${userinfo.userid }" class="userlikes" target="userlikes"><img src="images/otherlike.jpg"></a>
	  		</div>
	  		
	  		<div class="mydetails">
	  			<a href="javascript:void(0);" class="userarticle"><img src="images/mypage.jpg"></a>
	  		</div>
	  		<div class="mydetails">
	  			<a href="userfavorite?userid=${userinfo.userid }" class="userfavor" target="userfavorite"><img src="images/myfavor.jpg"></a>
	  		</div>
	  		<div class="mydetails">
	  			<a href="userlike?userid=${userinfo.userid }" class="userlikes" target="userlikes"><img src="images/mylike.jpg"></a>
	  		</div>

	  	</div>
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