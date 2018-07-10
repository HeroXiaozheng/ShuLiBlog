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
  		<ul id="ulfollow">
          <c:forEach items="${authorpagelist}" var="follows" varStatus="status">
            <li>            
            <div class="popular-post-grid">
                  <a href="userpage?userid=${follows.follow.followid}" target="_blank"><img src="myimg?userid=${follows.follow.followid}"  style="width:60px;height:60px;"/></a>
                  <a class="author-name" href="userpage?userid=${follows.follow.followid}" target="_blank">
                  
                  	<c:if test="${follows.username!=null }">
                  		<c:choose>
                  	    	 <c:when test="${follows.follow.followid!=sessionScope.userid}">
                    			${follows.username}
                    		</c:when>
                  			<c:otherwise>我</c:otherwise>
                  		</c:choose>
                  	</c:if>
                  	<c:if test="${empty follows.username }"> 
                  	${follows.follow.followid}
                  	</c:if>
                  </a>
                  <c:if test="${follows.follow.userid!=sessionScope.userid}">
                  	<a id="follow${follows.follow.followid }" class="sendmsg" style="position:fixed;left:500px;cursor:pointer" onclick="follow('${sessionScope.userid }','${follows.follow.followid}')">
                  		<span id="followDisplay1">
                  		
                  			<c:choose>
                  				<c:when test="${follows.followbool }">
                  					<span>取消关注</span>
                  				</c:when>
                  				<c:otherwise>
                  					<c:if test="${follows.follow.followid!=sessionScope.userid}">
                  					<span>关注</span>
                  					</c:if>
                  					<c:if test="${follows.follow.followid==sessionScope.userid}">
                  					</c:if>
                  				</c:otherwise>
                  			</c:choose>
                  		
                  		</span>
                  		<span id="followDisplay2" style="display:none;">关注</span>
  						<span id="followDisplay3" style="display:none;">取消关注</span>
                  		</a>
                  		</c:if>
                  		  <c:if test="${follows.follow.userid==sessionScope.userid}">
                  	<a id="follow${follows.follow.followid }" class="sendmsg" style="position:fixed;left:500px;cursor:pointer" onclick="follow('${sessionScope.userid }','${follows.follow.followid}')">
                  		<span id="followDisplay1">
                  		
                  			<span>取消关注</span>
                  		
                  		
                  		</span>
                  		<span id="followDisplay2" style="display:none;">关注</span>
  						<span id="followDisplay3" style="display:none;">取消关注</span>
                  	
                  	</a>
                  	</c:if>
                <div class="clearfix"></div>
              </div>
            </li>
          </c:forEach><!--后台控制增加-->         
          </ul>
	</body>
</html>