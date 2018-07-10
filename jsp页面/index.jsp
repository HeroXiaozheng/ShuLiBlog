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
    
    <title>书理-知书达理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="application/x-javascript"> 
addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
function hideURLbar(){ window.scrollTo(0,1); } 
  </script>
    <!-- for bootstrap working -->
      <script type="text/javascript" src="js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <script src="js/responsiveslides.min.js"></script>
      <script>
        $(function () {
          $("#slider").responsiveSlides({
          auto: true,
          nav: true,
          speed: 500,
          namespace: "callbacks",
          pager: true
          });
        });
      </script>
      <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <!--/script-->
    <script type="text/javascript">
          jQuery(document).ready(function($) {
            $(".scroll").click(function(event){   
              event.preventDefault();
              $('html,body').animate({scrollTop:$(this.hash).offset().top},900);
            });
          });
    </script>
    <!--css文件导入-->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/zzsc.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.alertable.css">
    <!-- web-fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <!-- dwr的js引入 -->
    <script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/interface/recommendauthor.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/interface/sort.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/interface/readArticle.js"></script>
	<script type="text/javascript">

       //分类切换的样式
       $(document).ready(function(){
           $("ul.sort li").each(function(index){
             $("ul.sort li").eq(index).click(function(){
                  $("ul.sort li").removeClass("active");
                  $(this).addClass("active");
                  if($(this).text()!="最新文章"){
                  	$("#read1").css("display","none");
                  	$("#read2").css("display","block");
                  	$("#hiddentype").val($(this).text());
                	$("#new").hide();
                  	$("#sort").css("display","block");
                  	$("#hiddenpage").val("2");
                  	$.post("sort",{type:$(this).text(),page:1},function(data){
                  		$("#sort").html(data);	
                  	});
                  }else{
                	$("#read2").css("display","none");
                    $("#read1").css("display","block");
                	$("#new").show();
                  	$("#sort").css("display","none");
                  	$("#hiddenpage").val("2");
                  }
                  
             });
           });
        });
      </script>
  </head>
  
  <body>
  <%@include file="Head.jsp" %>
 <!--主体内容-->
  <div class="main-body">
    <div class="wrap">
    <!--左边部分-->
      <div class="left-content">
        <div class="slider-content">
        <!--后台控制-->
          <ul class="rslides" id="slider">
          
          <c:forEach items="${randomarticle}" var="randomarticle">
              <li>
                <a href="readArticle?articleid=${randomarticle.articleid}" target="_blank"><img src="cover?articleid=${randomarticle.articleid}" alt="" style="width:780px;height:400px;"></a>
                <div class="caption">
                  <a href="readArticle?articleid=${randomarticle.articleid}" target="_blank">${randomarticle.title }</a>
                </div>
              </li>
          </c:forEach>
         
            </ul>
            <a href="#" class="callbacks_nav callbacks1_nav prev">Previous</a>
            <a href="#" class="callbacks_nav callbacks1_nav next">Next</a>
            <ul class="callbacks_tabs callbacks1_tabs">
              <li class="callbacks1_s1"><a href="#" class="callbacks1_s1">1</a></li>
              <li class="callbacks1_s2"><a href="#" class="callbacks1_s2">2</a></li>
              <li class="callbacks1_s3 callbacks_here"><a href="#" class="callbacks1_s3">3</a></li>
            </ul>
            <!--后台控制-->
        </div>
        <div class="articles">
          <div class="artcle-top" style="background:#fff;opacity:1;z-index:10;">
            <ul class="sort">
              <li id="li1" value="最新文章"><a href="javascript:void(0)">最新文章</a></li>
              <li id="li2" value="2"><a href="javascript:void(0)">人文社科</a></li>
              <li id="li3" value="3"><a href="javascript:void(0)">IT·互联网</a></li>
              <li id="li4" value="4"><a href="javascript:void(0)">自然科普</a></li>
              <li id="li5" value="5"><a href="javascript:void(0)">家居生活</a></li>
              <li id="li6" value="6"><a href="javascript:void(0)">财经一线</a></li>
              <li id="li7" value="7"><a href="javascript:void(0)">时事政治</a></li>
            </ul>
          </div>
			<script type="text/javascript">
			$(function () {
	    		$(window).scroll(function () {
	        		if ($(window).scrollTop() >= 400) {
	            		$('.artcle-top').css({position:"fixed",top:"60.5px"});
	        		}else {
	            		$('.artcle-top').css({position:"static"});
	        		}
		    	});
			});
			</script>
          <!-- 最新文章 -->
          <div id="new">   
          <c:forEach items="${artPagelist}" var="list" varStatus="status">
          <div class="article">
          <!-- 文章封面 --> 
            <div class="article-left">
             <a href="readArticle?articleid=${list.article.articleid } " target="_blank"><img src="cover?articleid=${list.article.articleid }"></a>
            </div>
            <div class="article-right">
              <div class="article-title">
                <p>
                    <!-- 文章作者 -->
                    <a class="span_link" href="userpage?userid=${list.article.userid }" target="_blank">
                         <span>
                         <c:choose>
                         	<c:when test="${list.username!=null }">
                         		${list.username }
                         	</c:when>
                         	<c:otherwise>
                         		 ${list.article.userid }
                         	</c:otherwise>
                         </c:choose>                       
                         </span> 
                         </a>
                     <!-- 文章浏览 -->
                     <span>${list.distance }</span>
                     <a class="span_link" href="readArticle?articleid=${list.article.articleid}" target="_blank">
                         <span><img src="images/view.png">${list.article.vcount}</span>
                         </a>
                         <!-- 文章评论 -->
                         <a class="span_link" href="readArticle?articleid=${list.article.articleid}#tocomment" target="_blank">
                         <span><img src="images/comment.png">${list.commentCount}</span> 
                         </a>
                         <!-- 文章点赞 -->
                        
                       	 <span class="span_link" style="font-size:14px;"><img src="images/thumb.png">${list.likesCount }</span>
                        
                    </p>
                <!-- 文章标题 -->
                <a class="title" href="readArticle?articleid=${list.article.articleid}" target="_blank">${list.article.title}</a>
              </div>
              <div class="article-text">
              <!-- 文章正文 -->
                <div id="s${list.article.articleid}">${list.article.scontent}</div>
                <script type="text/javascript">
                $(document).ready(function(){
                $("#s"+'${list.article.articleid}').text($("#s"+'${list.article.articleid}').text().substr(0,80)+"...");
                });
                    
                </script>
                <div class="clearfix"></div>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
          </c:forEach>
          </div>
      	  <div id="sort" >
      	  </div>
      </div>
      
      <script type="text/javascript">
      	function recommendMost(){
      		$.post("newrecommend",{page:$("#hiddenpage").val()},function(data){
      			if(data.length<10){
      				alert("没有更多文章了");
      			}else{
      				$("#new").html($("#new").html()+data);
          			var page = parseInt($("#hiddenpage").val())+1;
          			$("#hiddenpage").val(page);
      			}
      		});
      	}
      	
      	function recommendOthers(){
      		$.post("sort",{type:$("#hiddentype").val(),page:$("#hiddenpage").val()},function(data){
      			if(data.length<10){
      				alert("没有更多文章了");
      			}else{
      				$("#sort").html($("#sort").html()+data);
          			var page = parseInt($("#hiddenpage").val())+1;
          			$("#hiddenpage").val(page);
      			}     			
      		});
      	}
      </script>
      <span id="read1" style="display:block;">
      <a href="javascript:void(0);" onclick="recommendMost()" class="load-more">阅读更多</a>     
      </span>
      <span id="read2" style="display:none;">
      	 <a href="javascript:void(0);" onclick="recommendOthers()" class="load-more">阅读更多</a> 
      </span>
      </div>
      <input type="hidden" id="hiddenpage" value="2"/>
      <input type="hidden" id="hiddentype"/>
      
      
      <!--左边部分end-->
      <!--右边部分-->
       <div class="right-content">
        <div class="recommendartcle"><!--文章推荐-->
        <div class="list_vertical">
            <section class="accordation_menu">
              <div>
                <input id="label-1" name="lida" type="radio" checked/>
               <label for="label-1" id="item1"><i class="ferme" > </i>今日最HOT<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                <div class="content" id="a1">
                  <div class="scrollbar" id="style-2">
                 <div class="force-overflow">
                  <div class="popular-post-grids">
                  <c:forEach items="${hotarticle}" var="hotarticle" begin="0" end="0">
                    <div class="popular-post-grid">
                      <div class="post-img">
                        <a href="readArticle?articleid=${hotarticle.article.articleid}"><img src="cover?articleid=${hotarticle.article.articleid}" alt="${hotarticle.article.articleid}/cover" style="width:80px;height:60px;" /></a>
                      </div>
                      <div class="post-text">
                        <a class="pp-title" style="font-size:14px;" href="readArticle?articleid=${hotarticle.article.articleid}">${hotarticle.article.title}</a>
                        <p>
                        	<a class="span_link" href="userpage?userid=${hotarticle.article.userid}" target="_blank">
                        	<span>
                        	    <c:choose>
                        	    	<c:when test="${hotarticle.username!=null}">${hotarticle.username}</c:when>
                        	    	<c:otherwise>${hotarticle.article.userid}</c:otherwise>
                        	    </c:choose>
                        	</span></a>
	                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}#tocomment" target="_blank"><span><img src="images/comment.png">${hotarticle.commentcount}</span></a>
	                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}" target="_blank"><span><img src="images/view.png">${hotarticle.article.vcount}</span></a>
                        </p>
                      </div>
                      <div class="clearfix"></div>
                    </div>
                 </c:forEach>
                  </div>
                  </div>
                  </div>
                </div>
              </div>
                <div>
	                <input id="label-2" name="lida" type="radio"/>
	                <label for="label-2" id="item2"><i class="icon-leaf" id="i2"></i>今日收藏最多<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
	                <div class="content" id="a2">
	                   <div class="scrollbar" id="style-2">
	                     <div class="force-overflow">
	                     	<div class="popular-post-grids">
	                     	<c:forEach items="${favoriteMostList}" var="hotarticle" begin="0" end="5">
	                      		<div class="popular-post-grid">
	                        		<div class="post-img">
	                          			<a href="readArticle?articleid=${hotarticle.article.articleid}">
	                          				<img src="cover?articleid=${hotarticle.article.articleid}" alt="${hotarticle.article.articleid}/cover" style="width:60px;height:40px;"/>
	                          			</a>
	                        		</div>
	                        		<div class="post-text">
	                          			<a class="pp-title" style="font-size:14px;"  href="readArticle?articleid=${hotarticle.article.articleid}">${hotarticle.article.title}</a>
										<p>
											<a class="span_link" href="userpage?userid=${hotarticle.article.userid}" style="text-decoration: none;" target="_blank">
											<span>
											<c:choose>
              	          	    				<c:when test="${hotarticle.username!=null}">${hotarticle.username}</c:when>
                        	    				<c:otherwise>${hotarticle.article.userid}</c:otherwise>
                        	    			</c:choose>
											</span></a>
					                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}"><span><img src="images/comment.png">${hotarticle.commentcount}</span></a>
					                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}"><span><img src="images/view.png" >${hotarticle.article.vcount}</span> </a>
	                        			</p>
	                        		</div>
	                        		<div class="clearfix"></div>
	                      		</div>
	                      </c:forEach>
	                    	</div>
	               		</div>
               		</div>
                </div>
              </div>
              <div>
                <input id="label-3" name="lida" type="radio"/>
               <label for="label-3" id="item1"><i class="ferme"> </i>今日浏览Top5<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                <div class="content" id="a1">
                  <div class="scrollbar" id="style-2">
                 <div class="force-overflow">
                  <c:forEach items="${hotarticle}" var="hotarticle" begin="1" end="5">
                   <div class="popular-post-grids">
                    <div class="popular-post-grid">
                      <div class="post-img">
						<a href="readArticle?articleid=${hotarticle.article.articleid}">
							<img src="cover?articleid=${hotarticle.article.articleid}" alt="${hotarticle.article.articleid}/cover" style="width:60px;height:40px;" />
						</a>                     
					 </div>
                      <div class="post-text">
                        <a class="pp-title" style="font-size:14px;" href="readArticle?articleid=${hotarticle.article.articleid}">${hotarticle.article.title}</a>
                        <p>
                        	<a class="span_link" href="userpage?userid=${hotarticle.article.userid}" target="_blank"><span>
                        	<c:choose>
                        	    	<c:when test="${hotarticle.username!=null}">${hotarticle.username}</c:when>
                        	    	<c:otherwise>${hotarticle.article.userid}</c:otherwise>
                        	    </c:choose>
                        	</span></a>
	                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}" target="_blank"><span><img src="images/comment.png">${hotarticle.commentcount}</span></a>
	                        <a class="span_link" href="readArticle?articleid=${hotarticle.article.articleid}" target="_blank"><span><img src="images/view.png">${hotarticle.article.vcount}</span></a>
                        </p>
                      </div>
                      <div class="clearfix"></div>
                    </div>
                  </div>
                  </c:forEach>
                  </div>
                  </div>
                </div>
              </div>
            </section>
        </div>
          
        <div class="recommendauthor"><!--作者推荐-->
          <header>
              <h3 class="title-head">推荐作者
                <span class="change">
                  <a href="javascript:void(0);" onclick="showAuthor();"><img src="images/exchange.png">换一批</a>
       			 </span>
       			 <input type="hidden" value="2" id="hiddenfollow"/>
            </h3>
            </header>
            <script type="text/javascript">
            	 function showAuthor(){
            		 $.post("followupdate",{page:$("#hiddenfollow").val()},function(str){
            			if(str.length<10){
            				alert("没有更多作者了");
            			}else{
            			 $("#ulfollow").html(str);
            			 $("#hiddenfollow").val(parseInt($("#hiddenfollow").val())+1);
            			}
            		 });
            	 }
            	 function follow(userid,followid){
            		
            		 if('${sessionScope.userid}'==""){
            			 alert("请先登录再关注");
            		 }else{
            			 readArticle.getFollowList(userid,followid,function(list){	   
                		     if(list[0]){
                		     	$("#follow"+followid).text("取消关注");
                		     	$("#followcount"+followid).text(list[1]);
                		     }else{
                		      	$("#follow"+followid).text("+关注");
                		      	$("#followcount"+followid).text(list[1]);
                		     }
                		  });
            		 }           		 
            	 }
            	 
            </script>
          <ul id="ulfollow">
          <c:forEach items="${authorpagelist}" var="author" varStatus="status">
            <li>            
            <div class="popular-post-grid">
                  <a href="userpage?userid=${author.followid}" target="_blank"><img src="myimg?userid=${author.followid}"  style="width:60px;height:60px;"/></a>
                  <a id="authorname${author.followid }" class="author-name" href="userpage?userid=${author.followid}" target="_blank">
                  <c:choose>
                  	<c:when test="${author.username!=null }">
                  	     ${author.username }
                  	</c:when>
                  	<c:otherwise>
                  		 ${author.followid}
                  	</c:otherwise>
                  </c:choose>
                  </a>
                  <a id="follow${author.followid }" class="author-follow" style="padding-right:0px;cursor: pointer;" onclick="follow('${sessionScope.userid }','${author.followid}')">
                    <c:choose>
                  		<c:when test="${sessionScope.userid==null }">+关注</c:when>
                  		<c:when test="${author.followbool==true }">取消关注</c:when>
                  		<c:otherwise>+关注</c:otherwise>
                  	</c:choose> 
                  	</a>
                  <p style="position:relative;left:75px;bottom:30px;color:rgb(150,150,150);font-size:15px;">发布了${author.articleCount }篇文章
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="followcount${author.followid }">${author.followCount }</span>人关注
                  </p>
                  
                <div class="clearfix"></div>
              </div>
            </li>
          </c:forEach><!--后台控制增加-->         
          </ul>
        </div>
      </div>
      <!--右边部分-->
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
  <!--主体内容end-->
  <!-- 尾部 -->
  <%@include file="Foot.jsp" %>
   </div>
   </body>
</html>