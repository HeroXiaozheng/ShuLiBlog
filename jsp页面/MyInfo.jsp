<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>个人中心</title>
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/indexstyle.css" />
	<link rel="stylesheet" href="css/layout.css"/>
	
	<script type="text/javascript" src="<%=path %>/dwr/util.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/engine.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/interface/check.js"></script>
    <script type="text/javascript" src="<%=path %>/dwr/interface/userinfo.js"></script>
    
	
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script type="text/javascript">
		function saveMyImg() {
		
		startUploading();
	    // get selected file element
	    var oFile = document.getElementById('uploadmyimg').files[0];
		
	    // filter for image files
	    var rFilter = /^(image\/bmp|image\/gif|image\/jpeg|image\/png|image\/tiff)$/i;
	    if (! rFilter.test(oFile.type)) {
	        alert("你应该选择有效的图像文件,请重新选择");
	        return;
	    }
	
	    // get preview element
	    var oImage = document.getElementById("myimg");
	   
	    // prepare HTML5 FileReader
	    var oReader = new FileReader();
	        oReader.onload = function(e){
	
	        // e.target.result contains the DataURL which we will use as a source of the image
	        oImage.src = e.target.result;
	        $("img").remove(".oldimg");
          	$("#myimg").css({width:"50px", height:"50px"});
	    };
	
	    // read selected file as DataURL
	    oReader.readAsDataURL(oFile);
		
	}
	function startUploading() {
		var coverForm = document.getElementById("upload_imgform");
	    var formData = new FormData(coverForm);
	    //formData.append("image_file",$('#upload_form')[0]);
	    //formData.append("articleid",1);
	    $.ajax({
	        url: "uploadMyImg",
	        type: 'POST',
	        cache: false,	//上传文件不需要缓存
	        data: formData,
	        processData: false,	//因为data值是FormData对象，不需要对数据做处理
	        contentType: false,
	        dataType:"json",
	        success : function(data) {
	        	alert("OK");
	        }
    	});
	
	}
	</script>
</head>
<body>
<%@include file="Head.jsp" %>
	<div id="wrapper">
		<div class="container w960 mt20">
			<div id="processor" >
				<ol class="processorBox oh">
					<li class="current">
						<div class="step_inner fl">
							<span class="icon_step"><img src="images/person.png" style="position: relative;top: 4px;"></span>
							<h4>填写个人信息</h4>
						</div>
					</li>
					<li>
						<div class="step_inner">
							<span class="icon_step"><img src="images/bind.png" style="position: relative;top: 4px;"></span>
							<h4>绑定信息</h4>
						</div>
					</li>
					<li>
						<div class="step_inner fr">
							<span class="icon_step"><img src="images/psd.png" style="position: relative;top: 4px;"></span>
							<h4>修改密码</h4>
						</div>
					</li>
				</ol>
				<div class="step_line"></div>
			</div>
			<div class="myhomecontent">
				<div id="step1" class="step hide">
					<div class="frm_control_group">
						<img src="myimg?userid=${sessionScope.userid }" class="oldimg">
						<img id="myimg">
						<a href="javascript:void(0)" class="changemyimg">点击修改</a>
						<form id="upload_imgform" enctype="multipart/form-data" method="post" action="uploadMyImg">
							<input id="uploadmyimg" type="file" name="uploadmyimg" style="opacity:0;width:0;" onchange="saveMyImg();">
						</form>
						<script type="text/javascript">
							$(document).ready(function(){
								$(".changemyimg").on("click",function(){
									$("#uploadmyimg").trigger("click");
								})
							})
						</script>
					</div>
						<div class="frm_control_group">
							<label class="frm_label">昵称</label>
							<div class="frm_controls">
								<input type="text" id="username" class="frm_input email" maxlength="32" value="${userinfo.username }"/>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">性别</label>
							<div class="frm_controls">
							<c:if test="${empty userinfo.sex }">
								<input type="radio" name="sex" value="男" id="sex">男
								<input type="radio" name="sex" value="女" id="sex">女
								<input type="radio" name="sex" value="保密" id="sex">保密
							 </c:if>
							<c:if test="${!empty userinfo.sex }">
								<c:if test="${userinfo.sex=='男' }">
									<input type="radio" name="sex" value="男" checked>男
									<input type="radio" name="sex" value="女">女
									<input type="radio" name="sex" value="保密">保密
								</c:if>
								<c:if test="${userinfo.sex=='女' }">
									<input type="radio" name="sex" value="男" >男
									<input type="radio" name="sex" value="女" checked>女
									<input type="radio" name="sex" value="保密">保密
								</c:if>
								<c:if test="${userinfo.sex=='保密' }">
									<input type="radio" name="sex" value="男" >男
									<input type="radio" name="sex" value="女">女
									<input type="radio" name="sex" value="保密" checked>保密
								</c:if>
							</c:if>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">年龄</label>
							<div class="frm_controls verifycode">
								<select id="age" name="age">
									<option checked>请选择...</option>
								</select>
								</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">个人简介</label>
							<div class="frm_controls">
								<textarea id="intro" class="frm_input email" placeholder="请输入简介" style="resize: none;">${userinfo.intro }</textarea> 
							</div>
							
						</div>
						<div class="toolBar">
							<input type="button" value="保存" class="btn btn_primary" id="saveinfobtn">
						</div>
				</div><!-- // step1 end -->
				<div id="step2" class="step hide">
						<div class="frm_control_group">
							<label class="frm_label">个人邮箱</label>
							<div class="frm_controls" id="frm_controls1">
								<c:if test="${empty userinfo.email }">
								<input type="text" id="email" name="email" class="frm_input email" maxlength="32"/>
								</c:if>
								<c:if test="${!empty userinfo.email }">
								<input type="text" id="email" class="frm_input email" maxlength="32"/ value="${userinfo.email }" disabled>
								<span class="binded1"><img src="images/done.png">已绑定</span>
								</c:if>
								<span class="binded1" style="display:none"><img src="images/done.png">已绑定</span>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">手机号</label>
							<div class="frm_controls" id="frm_controls2">
								<c:if test="${empty userinfo.tel }">
								<input type="text" id="tel" class="frm_input email" maxlength="32"/ value="${userinfo.email }">
								</c:if>
								<c:if test="${!empty userinfo.tel }">
								<input type="text" id="tel" class="frm_input email" maxlength="32"/ value="${userinfo.email }" disabled>
								
								<span class="binded2"><img src="images/done.png">已绑定</span>
								
								</c:if>
								<span class="binded2" style="display:none;"><img src="images/done.png">已绑定</span>
							</div>
						</div>
						<div class="toolBar">
							<input type="button" value="绑定" class="btn btn_primary" id="bindinfobtn">
						</div>
				   
				</div><!-- // step2 end -->
				<div id="step3" class="step hide">
					<form action="updatepwd" method="post" id="step3_frm">
						<div class="frm_control_group">
							<label class="frm_label">原密码</label>
							<div class="frm_controls">
								<input id="input-old" type="password" name="oldpwd" class="frm_input oldpasswd"/>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">新密码</label>
							<div class="frm_controls">
								<input type="password" name="newpwd" class="frm_input passwd" id="inputnew1"/>
								<p class="frm_tips">字母、数字或者英文符号，最短6位，区分大小写</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">再次输入密码</label>
							<div class="frm_controls">
								<input type="password" name="newpwd" class="frm_input passwd2" id="inputnew2"/>
							</div>
						</div>
						<div class="toolBar">
							<input type="submit" value="保存" class="btn btn_primary" id="checkpwd">
						</div>
					</form>
				</div><!-- // step3 end -->
			</div>
		</div><!-- // container end -->
		
	</div><!-- // wrapper end -->
	
	<script src="js/jquery.min.js"></script>
	<script> 
		//添加年龄下拉框
		 var age=document.getElementById('age').options;
		 		 option = new Option("00后", "00后");
		 		 age.add(option);  
			 for(var i=9;i>=5;i--){
			 	 option = new Option(i+"0后", i+"0后"); 
			 	 age.add(option);   
		 } 
		$(document).ready(function(){
			$("#age").val('${userinfo.age}');
		});
		//显示提示框，目前三个参数(txt：要显示的文本；time：自动关闭的时间（不设置的话默认1500毫秒）；status：默认0为错误提示，1为正确提示；)
		function showTips(txt,time,status)
		{
			var htmlCon = '';
			if(txt != ''){
				if(status != 0 && status != undefined){
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#4AAF33;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/ok.png" style="vertical-align: middle;margin-right:5px;" alt="OK，"/>'+txt+'</div>';
				}else{
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#D84C31;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/err.png" style="vertical-align: middle;margin-right:5px;" alt="Error，"/>'+txt+'</div>';
				}
				if(txt=="保存成功"){
				htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;border:1px solid #4AAF33;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#4AAF33;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/done.png" style="vertical-align: middle;margin-right:5px;" alt="OK，"/>'+txt+'</div>';
				}
				if(txt=="绑定成功"||txt=="我们将向您的邮箱发送绑定成功消息,请注意查收"){
				htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;border:1px solid #4AAF33;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#4AAF33;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:35%;left:50%;z-index:999999;margin-left:-120px;"><img src="images/done.png" style="vertical-align: middle;margin-right:5px;" alt="OK，"/>'+txt+'</div>';
				}
				$('body').prepend(htmlCon);
				if(time == '' || time == undefined){
					time = 1500; 
				}
				setTimeout(function(){ $('.tipsBox').remove(); },time);
			}
		}
		//验证原密码
		$(function(){
			$("#input-old").on("blur",function(){
				var oldpwd=$("#input-old").val();
				check.checkPwd('${sessionScope.userid}',oldpwd,function(data){
					if(data=="1"){
						showTips('原密码错误~');
						$("#checkpwd").attr("disabled",true);
						$("#input-old").select();
					}else if(data=="0"){
						$("#checkpwd").attr("disabled",false);
					}
				});
			});
			//AJAX提交以及验证表单
			$("#inputnew2").on("blur",function(){
			    var oldpwd=$("#input-old").val();
				var passwd = $('.passwd').val();
				var passwd2 = $('.passwd2').val();
				if(passwd != passwd2 || passwd2 != passwd){
					showTips('两次密码输入不一致呢~');
					$(".passwd").select();
					$(".passwd2").select();
					$("#checkpwd").attr("disabled",true);
				}else if(oldpwd==passwd&&oldpwd==passwd2){
					showTips('新旧密码不能相同~');
					$(".passwd").select();
					$(".passwd2").select();
					$("#checkpwd").attr("disabled",true);
				}else{
					$("#checkpwd").attr("disabled",false);
				}
			});
			//邮箱验证
			$("#email").on("blur",function(){
			    var email=$("#email").val();
			    var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
				if(!myReg.test(email)){
					showTips("邮箱格式错误");
					$("#email").select();
				}
			});
			//手机验证
			$("#tel").on("blur",function(){
			    var tel=$("#tel").val();
			    var myReg=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
				if(!myReg.test(tel)){
					showTips("手机格式错误");
					$("#tel").select();
				}
			});
			//切换步骤（目前只用来演示）
			$('.processorBox li').click(function(){
				var i = $(this).index();
				$('.processorBox li').removeClass('current').eq(i).addClass('current');
				$('.step').fadeOut(300).eq(i).fadeIn(500);
			});
		});
	   	//保存个人信息
	   	$("#saveinfobtn").on("click",function(){
			var username=$("#username").val();
			var sex=$("#sex").val();
			var age=$("#age").val();
			var intro=$("#intro").val();
			userinfo.getUserInfo('${sessionScope.userid}',username,sex,age,intro,function(data){
				
				$("#username").val(data.username);
				$("#age").val(data.age);
				$("#intro").val(data.intro);
				$("#sex").val(data.sex);
				showTips("保存成功");
			});
		});
		$("#bindinfobtn").on("click",function(){
			var email=$("#email").val();
			var tel=$("#tel").val();
			userinfo.getBindInfo('${sessionScope.userid}',email,tel,function(data){
				$("#email").val(data.email);
				$("#tel").val(data.tel);
				if(email!=""){
				$("#email").attr("disabled",true);
				$(".binded1").show();
				$("#frm_controls1").append("<span class='cancelbind1' style='display:none;'><a>解除绑定</a></span>");
				showTips("我们将向您的邮箱发送绑定成功消息,请注意查收");
				}
				if(tel!=""){
				$("#tel").attr("disabled",true);
				$(".binded2").show();
				$("#frm_controls2").append("<span class='cancelbind2' style='display:none;'><a>解除绑定</a></span>");
				showTips("绑定成功");
				}
				
			});
		});
	</script>
</body>
</html>