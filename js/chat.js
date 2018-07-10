	$('.conLeftScroll li').on('click',function(){
		$(this).addClass('bg').siblings().removeClass('bg');
		var intername=$(this).children('.liRight').children('.intername').text();
		$('.headName').text(intername);
		$("#headName1").show();
		$('.newsList').html('');//设置聊天记录不清空？？
	});
	
//添加表情
	$('.ExP').on('mouseenter',function(){
		$('.emjon').show();
	});
	$('.emjon').on('mouseleave',function(){
		$('.emjon').hide();
	});
	$('.emjon li').on('click',function(){
		var imgSrc=$(this).children('img').attr('src');
		var str="";
		str+='<li>'+
				'<div class="nesHead"><img src="img/6.jpg"/></div>'+
				'<div class="news"><img class="Expr" src="'+imgSrc+'"></div>'+
			'</li>';
		$('.newsList').append(str);
		$('.emjon').hide();
		$('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
	});
