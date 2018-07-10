<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${read.title }</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<!--css文件导入-->
	<link href="css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
	<!-- web-fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
	<script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
  	<script type="text/javascript" src="<%=path %>/dwr/interface/readArticle.js"></script>
	<script src="js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".commentarea").focus(function(){
			$(".sendbutton").css("display","block");
		});
		$(".cancel").click(function(){
			$(".sendbutton").css("display","none");
		});
	});
	
</script>
<script type="text/javascript">
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
<script type="text/javascript">
              function replySet(v){
              	if('${sessionScope.userid}'==""){
              		alert("请先登录,再回复");
              	}
              	else{
              		if(document.getElementById("replyarea"+v).style.display=='none'){
               		$(".replyarea1").css("display","none");
               		$(".replybtn1").html("回复");
               		//$(".sendbutton1").css("display","none");
               		document.getElementById("replyarea"+v).style.display="block";
               		document.getElementById("replybtn"+v).innerHTML="取消回复";
               			//for(var i=0;i<'${listLength }';i++){
               			//if(i!=v){
               				//document.getElementById("replyarea"+i).style.display="none";
   	                		//document.getElementById("replybtn"+i).innerHTML="回复";
   	                		//$(".commentarea1").val("");
               			//}
               		//}	
               		
               	}else{
               		document.getElementById("replyarea"+v).style.display="none";
               		document.getElementById("replybtn"+v).innerHTML="回复";
               		$(".commentarea1").val("");
               	}		                
              	}	             
              }
              $(document).ready(function() {
          		$(".commentarea1").focus(function(){
          			$(".sendbutton1").css("display","block");
          		});
          		$(".cancel1").click(function(){
          			$(".sendbutton1").css("display","none");
          		});
          	});
         </script>
                    <script type="text/javascript">
	function sendMsg(userid,remarkid,index){
		//alert(userid);
		var scontent = document.getElementById("commentarea"+index).value;
		//alert(scontent);
		if(scontent==""){
			alert("还未输入回复内容");
		}else{
			$.post("remarkReply",{userid:userid,remarkid:remarkid,scontent:scontent},function(data){
						//$(".sendbutton1").css("display","none");
						$(".commentarea1").val("");
						$(".replyarea1").css("display","none");
						$(".replybtn1").html("回复");
						document.getElementById("response-wrap"+remarkid).innerHTML = data+document.getElementById("response-wrap"+remarkid).innerHTML;
						//$("response-wrap"+remarkid).html(data+$("response-wrap"+remarkid).html());
					});
		}
		
		function upsend(){
			var scontent = document.getElementById("commentarea").value;
			if(scontent==""){
				alert("还未输入回复内容");
			}else{
				$.post("remarkReply",{userid:userid,remarkid:remarkid,scontent:scontent},function(data){
				  alert("回复内容");
					//$(".sendbutton1").css("display","none");
					//$(".commentarea1").val("");
					//$(".replyarea1").css("display","none");
					//$(".replybtn1").html("回复");
					//document.getElementById("response-wrap"+remark.getRemarkid()).innerHTML = data+document.getElementById("response-wrap"+remark.getRemarkid()).innerHTML;						
				});
		}
			} 
	}
</script>
<script type="text/javascript">
	function comment(){
		if('${sessionScope.userid}'==""){
			alert("请先登录,再评论");
		}else{
			if($(".commentarea").val()==''){
						alert("还未输入评论内容");
					}else{
						$.post("remark",{articleid:'${read.articleid}',receiveid:'${read.userid}',userid:'${sessionScope.userid}',scontent:$(".commentarea").val()},function(data){
									$(".sendbutton").css("display","none");
									$(".commentarea").val("");
									//$(".response").addClass("#responseInfoo");
									$("#commentNo").css("display","none");
									$("#updateComment").html(data+$("#updateComment").html());
								});
								 readArticle.getArticleRemarkCount('${read.articleid}',function(count){
						   $("#remarkcount").html(count);
					   });
					}
		}
	}
	
</script>
 <style>
 .media-left.response-text-left a img{
	width:40px;
	height:40px;
}
 </style>
 </head>
  
  <body>
    <%@include file="Head.jsp" %>
  <!--文章主体-->
  <div class="col-md-6 content-left single-post">
  	<div class="blog-posts">
  		<h1 class="post" style="font-weight:bold;">${read.title }</h1>
  		<!--作者信息-->
  		<div class="author">
  			<div class="authorimg">
  				<a href="userpage?userid=${read.userid }" target="_blank"><img src="myimg?userid=${read.userid }" alt="作者名" style="width:50px;height:50px;"></a>
  			</div>
  			<DIV class="info">
  				<SPAN class="name"><A href="userpage?userid=${read.userid }">
  				<c:choose>
  					<c:when test="${read.username==null }">${read.userid }</c:when>
  					<c:otherwise>${read.username }</c:otherwise>
  				</c:choose>  						
  				</A></SPAN>
  				<c:choose>
  					<c:when test="${sessionScope.userid==null }">
  						<a href="javascript:void(0);" class="follow" onclick="follow('${sessionScope.userid}','${read.userid}')">
  						<span id="followDisplay1">
  						<span>关注</span>
  						</span>
  						</a><!--关注-->
  					</c:when>
  					<c:when test="${read.userid!=sessionScope.userid }">
  						<a href="javascript:void(0);" class="follow" onclick="follow('${sessionScope.userid}','${read.userid}')">
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
  				<div class="articleinfo"><!--文章统计-->
  					<SPAN class="publish-time">${distance }</SPAN>
  					<SPAN class="publish-time">阅读${read.readCount }</SPAN>
  					<SPAN class="publish-time">评论<span id="remarkcount">${read.commentCount }</span></SPAN>
  					<SPAN id="favoritecount1" class="publish-time">收藏${read. favoriteCount}</SPAN><!--jsp修改-->
  					<SPAN id="favoritecount2" class="publish-time" style="display:none;"></SPAN>
  				</div>
			</DIV>
  		</div>
  		<div class="last-article">
  			<p class="artext">${read.scontent }
			</p>
			<!--评论-->
			<div class="response">
				<div>
					<form class="mycomment">
  						<div class="authorimg">
  							<a href="userpage?userid=${sessionScope.userid}" target="_blank"><img src="myimg?userid=${sessionScope.userid }" alt="作者名" style="width:50px;height:50px;"></a>
  						</div>
  						<textarea placeholder="写下你的评论..." class="commentarea"></textarea>
  						<div style="float: right;margin-right: 90px;margin-top: 20px;display: none;" class="sendbutton">
  							<span style="color: rgb(150,150,150);cursor: pointer;" class="cancel">取消</span>
  							<input type="button" onclick="comment()" class="sendmsg" value="发送" style="cursor: pointer;">
  						</div>
					</form>
				</div>
					<h4>评论</h4><!--后台统计一下评论总数-->
				
				<c:if test="${empty read.remarklist }"><span id="commentNo">暂未任何评论</span></c:if>
				<span id="updateComment"></span>
				<c:forEach items="${read.remarklist }" var="remark" varStatus="status">
				<div class="media response-info" id="responseInfoo">
				<!--评论人的评论-->
					<div class="media-left response-text-left">
						<a href="userpage?userid=${remark.remark.userid }" target="_blank" >
							<img class="media-object" src="myimg?userid=${remark.remark.userid }" alt=""/>
						</a>
						<h5><a href="userpage?userid=${remark.remark.userid }" target="_blank">
						<c:choose>
									<c:when test="${remark.username!=null }">${remark.username }</c:when>
									<c:otherwise>${remark.remark.userid }</c:otherwise>
								</c:choose>
						</a></h5>
					</div>
					<div class="media-body response-text-right">
						<p>${remark.remark.scontent }</p><!--评论内容-->
						<ul><!--评论时间-->
							<li>${remark.remark.sdate }</li>
							<li><a href="javascript:void(0);" id="replybtn${status.index}" class="replybtn1" onclick="replySet('${status.index}')">回复</a></li>
						<div class="replyarea1" id="replyarea${status.index}" style="width: 700px;margin-bottom: 20px;display: none;">
  						<textarea placeholder="写下你的回复..." id="commentarea${status.index}" class="commentarea1"></textarea>
  						<div style="float: right;margin-right: 90px;margin-top: 20px;display:inline;" class="sendbutton1" id="sendbutton${status.index}">
  							<input type="submit" class="sendmsg" value="发送" style="cursor: pointer;position:relative;bottom:10px;" onclick="sendMsg('${sessionScope.userid}','${remark.remark.remarkid }','${status.index}')">
  						</div>
  						</div>
						</ul>
						
						<div class="response-wrap" id="response-wrap${remark.remark.remarkid }">
						<!--回复内容-->
						<c:forEach items="${read.remarkreplylist }" var="remarkreply">
						<c:if test="${remarkreply.remarkreply.remarkid==remark.remark.remarkid }">
						<div class="response-info" style="padding-left:0px;">
						<!--回复人信息-->
							<div class="media-left response-text-left">
								<a href="userpage?userid=${remarkreply.remarkreply.userid }" target="_blank">
									<img class="media-object" src="myimg?userid=${remarkreply.remarkreply.userid }" alt=""/>
								</a>
								<h5><a href="userpage?userid=${remarkreply.remarkreply.userid }" target="_blank">
								<c:choose>
									<c:when test="${remarkreply.username!=null }">${remarkreply.username }</c:when>
									<c:otherwise>${remarkreply.remarkreply.userid }</c:otherwise>
								</c:choose>
					
								</a></h5>
							</div>
							<!--回复人内容-->
							<div class="media-body response-text-right">
								<p>${remarkreply.remarkreply.scontent }</p>
								<ul>
									<li>${remarkreply.remarkreply.sdate }</li>
								</ul>		
							</div>
								<div class="clearfix"> </div>
						</div>
						</c:if>
						</c:forEach>
						</div>	
					</div>
				</div>
				</c:forEach>
			</div>
  		</div>
  	</div>
  </div>
  
  <c:if test="${param.flag==null }">
  <div class="side-tool">
  	<ul>
		<li id="top" data-placement="left" data-toggle="tooltip" data-container="body" data-original-title="回到顶部" style="display:none">
			<a  href="javascript:void(0);"><span class="iconfont ic-backtop" ><!--<span>回到顶部</span>--></span></a>
		</li>
		<li data-placement="left" data-toggle="tooltip" data-container="body" data-original-title="收藏文章">
			<a class="icon" href="javascript:void(0);" onclick="favorite('${sessionScope.userid}','${read.articleid }')">
			<script type="text/javascript">
				function favorite(userid,articleid){
					if('${sessionScope.userid}'==""){
						alert("请先登录再收藏");
					}else{
						document.getElementById("favorite1").style.display="none";
						document.getElementById("favoritecount1").style.display="none";
						document.getElementById("favoritecount2").style.display="inline";
						readArticle.getReadArticleFavoriteBoolAndCount(userid,articleid,function(list){
								if(list[0]){
									document.getElementById("favorite2").style.display="none";
									document.getElementById("favorite3").style.display="inline";
									//alert(list[1]);
									//$("#favoritecount2").text("收藏"+list[1]);
									document.getElementById("favoritecount2").innerHTML="收藏"+list[1];
								}else{
									document.getElementById("favorite2").style.display="inline";
									document.getElementById("favorite3").style.display="none";
									//$("#favoritecount2").text("收藏"+list[1]);
									document.getElementById("favoritecount2").innerHTML="收藏"+list[1];
								}	
						});
					}					
				}				
			</script>
			<span id="favorite1">
			<c:choose>
				<c:when test="${sessionScope.userid==null or read.areLikes==false}">
					<span class="iconfont ic-mark"></span><img src="images/favor.png"></span>
				</c:when>
				<c:otherwise>
					<span class="iconfont ic-mark"><img src="images/favored.png"></span>
				</c:otherwise>
			</c:choose>
			</span>
			
			<span id="favorite2" style="display:none;"><span class="iconfont ic-mark"><img src="images/favor.png"></span></span>
			<span id="favorite3" style="display:none;"><span class="iconfont ic-mark"></span><img src="images/favored.png"></span></span>
			</a>
		</li>
		<li data-placement="left" data-toggle="tooltip" data-container="body" data-original-title="点赞文章">
			<a class="icon" href="javascript:void(0);" onclick="likes('${sessionScope.userid}','${read.articleid }')">
			<span id="likes1">
			<c:choose>
				<c:when test="${sessionScope.userid==null or read.areLikes==false}">
					<span class="iconfont ic-like"><img src="images/like.png"></span>
				</c:when>
				<c:otherwise>
					<span class="iconfont ic-like1"><img src="images/liked.png"></span>
				</c:otherwise>
			</c:choose>
			</span>
			
			<span id="likes2" style="display:none;"><span class="iconfont ic-like"><img src="images/like.png"></span></span>
			<span id="likes3" style="display:none;"><span class="iconfont ic-like1"><img src="images/liked.png"></span></span>
			</a>
			
			<script type="text/javascript">
				function likes(userid,articleid){
					if('${sessionScope.userid}'==""){
						alert("请先登录再点赞");
					}
					document.getElementById("likes1").style.display="none";
					readArticle.getReadArticleLikesBool(userid,articleid,function(bool){
							if(bool){
								document.getElementById("likes2").style.display="none";
								document.getElementById("likes3").style.display="inline";
							}else{
								document.getElementById("likes2").style.display="inline";
								document.getElementById("likes3").style.display="none";
							}	
					});
					
				}
			</script>
		</li>
  	</ul>
  </div>
  </c:if>
  <c:if test="${param.flag!=null }">
  	<div class="side-tool">
  	  	<ul>
		<li id="top" data-placement="left" data-toggle="tooltip" data-container="body" data-original-title="回到顶部" style="display:none">
			<a  href="javascript:void(0);"><span class="iconfont ic-backtop" ><!--<span>回到顶部</span>--></span></a>
		</li>
		</ul>
	</div>
  </c:if>
  <script type="text/javascript">
  		$(function () {
    		$(window).scroll(function () {
        		if ($(window).scrollTop() >= 150) {
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
