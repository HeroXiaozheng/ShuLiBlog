<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <!--头部-->
  <div class="header">
        <div class="left-menu list">
          <ul>
            <li><a href="recommend" style="position:relative;top:5px;font-size: 2.1em;font-weight:bold;color: rgb(24,181,248);font-family:'KaiTi';padding-right:40px;padding-left:40px;">书理</a></li>
            <li><a href="recommend" style="font-size: 1.2em;">首页</a></li>
          </ul>
        </div>
        <div class="search">
          <!-- start search-->
            <div class="search-box">
              <div id="sb-search" class="sb-search">
              <form action="search-article" method="post">
                <input class="sb-search-input" placeholder="搜索" type="search" name="search" id="search">
                <input class="sb-search-submit" type="submit" value="">
                <span class="sb-icon-search"></span>
              </form>
            </div>
            </div>
            <!--登录提醒  -->
            <script src="js/jquery.alertable.js"></script>
          <!-- search-scripts -->
          <script src="js/classie.js"></script>
          <script src="js/uisearch.js"></script>
            <script>
              new UISearch( document.getElementById( 'sb-search' ) );
            </script>
            
          <!-- //search-scripts -->
          </div>
        <div class="right-menu list">
        <ul>
          <c:if test="${empty sessionScope.userid }">
          <li><a href="login.jsp"><input type="button" name="reg" class="reg" value="登录"></a></li>
          <li><a href="reg.jsp"><input type="button" name="reg" class="reg" value="注册"></a></li>
          <li><a href="login.jsp" class="alert-login" onclick="alert('继续操作前请先登录！');"><img src="images/write.jpg" class="writeimg"></a></li>
          </c:if>
          <c:if test="${!empty sessionScope.userid }">
          <li><img src="myimg?userid=${userid }" class="user-img" style="background:#ccc;"></li>
          <li><a href="readyWriteArticle" target="_blank"><img src="images/write.jpg" class="writeimg"></a></li>
          </c:if>
        </ul>
        </div>
        <div class="showperson" style="display:none">
          	<ul>
          		<li><a href="userpage?userid=${sessionScope.userid }" target="_blank"><img src="images/myhome.png">个人主页</a></li>
          		<li><a href="showinfo?userid=${sessionScope.userid }" target="_blank"><img src="images/myinfo.png">个人资料</a></li>
          		<li><a href="recycle?userid=${sessionScope.userid }" target="_blank"><img src="images/delete.png">回收站</a></li>
          		<li><a href="chat.jsp" target="_blank"><img src="images/message.png">聊天</a></li>
          		<li><a href="exit"><img src="images/exit.png">退出登录</a></li>
          	</ul>
        </div>
        <script type="text/javascript">
        	$(document).ready(function(){
        		$(".showperson ul li").on("click",function(event){
        			$("a",this)[0].click();
        			$("a").click(function(){
        			event.stopPropagation();
        			});

        		});
        		$(".user-img").on("mouseenter",function(){
        			$(".showperson").show();
        		});
        		$(".user-img").on("mouseleave",function(){
        			$(".showperson").hide();
        			
        		});
        		$(".showperson").on("mouseenter",function(){
       				$(".showperson").show();
       			});
        			$(".showperson").on("mouseleave",function(){
       				$(".showperson").hide();
       			});
        	});
        
        
        </script>
        <div class="clearfix"></div>
  </div>
  <!--头部end-->
