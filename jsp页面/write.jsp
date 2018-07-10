<%@page import="com.web.dao.ArticleDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书理--写文章</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

	<!--css文件导入-->
	<link href="<%=path %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="<%=path %>/css/indexstyle.css" rel="stylesheet" type="text/css" media="all" />
	<!-- web-fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	
	<!--标签必要样式-->
	<link href="<%=path %>/css/ui-choose.css" rel="stylesheet" />
	<!-- 文本编辑器css -->
	<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
	<link href="<%=path %>/dist/summernote.css" rel="stylesheet"/>
	<!-- 封面图上传css -->
	<link href="<%=path %>/css/titleImg.css" rel="stylesheet" type="text/css" />
	
	
	<!-- 文本编辑器script -->
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/dist/summernote.js"></script>
	<script src="<%=path %>/dist/lang/summernote-zh-CN.js"></script>    <!-- 中文-->


	<script>
		function fileSelected() {
		
		startUploading();
	    // get selected file element
	    var oFile = document.getElementById('image_file').files[0];
		
	    // filter for image files
	    var rFilter = /^(image\/bmp|image\/gif|image\/jpeg|image\/png|image\/tiff)$/i;
	    if (! rFilter.test(oFile.type)) {
	        alert("你应该选择有效的图像文件,请重新选择");
	        return;
	    }
	
	    // get preview element
	    var oImage = document.getElementById("preview");
	   
	    // prepare HTML5 FileReader
	    var oReader = new FileReader();
	        oReader.onload = function(e){
	
	        // e.target.result contains the DataURL which we will use as a source of the image
	        oImage.src = e.target.result;
	        $("img").remove(".cover-img");
          	$("span").remove(".insert");
          	$("#preview").css({width:"798px", height:"450px"});
	    };
	
	    // read selected file as DataURL
	    oReader.readAsDataURL(oFile);
		
	}

	function startUploading() {
		var coverForm = document.getElementById("upload_form");
	    var formData = new FormData(coverForm);
	    //formData.append("image_file",$('#upload_form')[0]);
	    //formData.append("articleid",1);
	    $.ajax({
	        url: "uploadTitleImg",
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
	
	
	//初始化文本编辑器
	$(document).ready(function(){
		$('.summernote').summernote({
	        height: 800,	//设置编辑器高度
	        tabsize: 2,		
	        lang: 'zh-CN',
			disableDragAndDrop:true,	//禁用拖拽
			placeholder: '开始记录你的想法吧...',	//提示信息
			
			callbacks: {  
			//接管编辑器图片上传事件
            onImageUpload: function(files, editor, $editable) {  
                //上传图片到服务器，使用了formData对象
	            var formData = new FormData();
	            formData.append('articleid',"${articleid}");
	            formData.append('file',files[0]);
	            $.ajax({
	                url : 'upload',	//后台文件上传接口
	                type : 'POST',	//设置请求方式
	                data : formData,
	                processData : false,
	                contentType : false,
	                //如果图片上传成功，回调图片文件的完整URL，并显示在编辑器中
	                success : function(data) {
	                	$('.summernote').summernote('insertImage', data);
	                	
	                }
	            });
            }  
        }  
	    });
		//$('.summernote').summernote('fontSize', 18);	//初始化字体大小
	});
	
	function submitArticle(){
    var article = $('.summernote').summernote('code');  //获取编辑器内HTML
    //alert(article);
    $("#contentOfArticle").val(article);
    //$("#msg").html(article);
    /*$.post("article", {t:$("#t").val()}, function(data){
      $("#msg").html(data);
    }); */
    getTags();
    $("#wholeTitle").val($(".mytitle").val());
    document.getElementById("wholeForm").submit();
  }
	
	</script>
  </head>
  
  <body>
  	
  	
  	<!--头部-->
	<div class="header">
        <div class="left-menu list">
          <ul>
            <li><a href="recommend" style="position:relative;top:5px;font-size: 2.1em;font-weight:bold;color: rgb(24,181,248);font-family:'KaiTi';padding-right:40px;padding-left:40px;"">书理</a></li>
          </ul>
        </div>
        <div class="write">
              <span style="font-weight: bold;font-size: 25px;">写文章</span>
        </div>
        <div class="right-menu list">
        <ul>
          <li>
          	
          	<input type="submit" name="publish" value="发布" class="publish" onclick="submitArticle();">
          	
          </li>
        </ul>
        </div>
        <div class="clearfix"></div>
  	</div>
  	
  	<div class="upload">
          <!-- 封面图片上传 -->
      <div class="cover">
      	<img id="preview">
        <img src="images/cover.png" class="cover-img"><br/><span class="insert">插入封面图</span>
      </div>
	  <form id="upload_form" enctype="multipart/form-data" method="post" action="uploadTitleImg">
	      	<input type="hidden" name="articleid" id="articleid" value="${articleid }"/>
	      	<input type="file" name="image_file" id="image_file" onmouseover="this.style.cursor='pointer'" onChange="fileSelected();" />
	  </form>
        
      <!--上传标题-->
      <div class="titleupload">
        <textarea name="mytitle" class="mytitle" placeholder="请输入标题" maxlength="20" onchange="this.value=this.value.substring(0, 20)" onkeydown="this.value=this.value.substring(0, 20)" onkeyup="this.value=this.value.substring(0, 20)"></textarea>
      	<script type="text/javascript">
      		$(document).ready(function(){
      			if($(".mytitle").html()==null){
      				$(".publish").on("click","return false");
      			}
      		});
      	</script>
      </div>
      <!--上传内容-->
        <!-- 文本编辑器 -->
      <div class="m">   
        <div class="summernote"></div>  <!-- 文本编辑器 -->
      </div>
 		
      
      <!--上传分类-->
      <div class="sortupload">
        <span style="font-size: 25px;font-weight: bolder;">标签</span><br>
        <ul class="ui-choose" multiple="multiple" id="uc_03">
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="人文社科">人文社科</li>
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="IT·互联网">IT·互联网</li>
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="自然科普">自然科普</li>
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="家居生活">家居生活</li>
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="财经一线">财经一线</li>
          <li onclick="clickck($(this))"><input type="checkbox" style="display: none;" onclick="oncheckAll(event)" value="时事政治">时事政治</li>
        </ul>
      </div>
      
      <script src="<%=path %>/js/ui-choose.js"></script>
      <script>
      // 将所有.ui-choose实例化
      $('.ui-choose').ui_choose();
      // uc_03 ul 多选
      var uc_03 = $('#uc_03').data('ui-choose');
      uc_03.click = function(index, item) {
          console.log('click', index);
      };
      uc_03.change = function(index, item) {
          console.log('change', index);
      };
      
      
      function clickck($t){
        $t.children("input").click();
      }
      function oncheckAll(event){
          event.stopPropagation();
      }
      
      //提交时获取值的操作 
      function getTags(){
        var temp = "";
        var ui_choose=document.getElementById('uc_03');
        var ck = ui_choose.getElementsByTagName("input");
        for ( var i = 0; i < ck.length; i++) {
          if (ck[i].checked) {
            temp += ck[i].value+",";
          }
        }
        document.getElementById("tags").value = temp;
       	//alert(temp);
      }

      </script>
  </div> 
  
  <div>
  <form id="wholeForm" action="articlePublish" method="post">
  	<input type="hidden" name="articleid" value="${articleid }"/>
  	<input type="hidden" id="wholeTitle" name="wholeTitle"/>
  	<input  type="hidden" id="contentOfArticle" name="contentOfArticle"/>	<!-- 用来获取编辑器中的内容 -->
  	<input type="hidden" id="tags" name="tags"/> <!-- 获取标签的值 -->
  </form>
	</div>
  </body>
</html>
