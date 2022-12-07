/**
 * 
 */
 
popular();

// 검색 기능
$("#search-botton").click(function() {
	var keyword = $("#keyword").val();
	
	if(keyword==""){
		alert("검색어를 입력하세요.");
		return
	}
	
	searchByKeyword(keyword);
});

// 배지 누르면 검색
$(".recommend").click(function() {
	var keyword = $(this).text();

	searchByKeyword(keyword);
});

$(".homebadge").click(function() {
	location.href='../trend/list';
});


// 엔터 검색
document.addEventListener("keypress", function(e) {
	if (e.keyCode == 13) { //enter press

		var keyword = $("#keyword").val();

		if (keyword == "") {
			alert("검색어를 입력하세요.");
			return
		}

		searchByKeyword(keyword);
	}
});

// 유튜브 카드 누르면 모달 열기
$(document).on("click",".youtubecard", function() {
	var videoId = $(this).attr("num");
	var title = $(this).attr("title");
	// alert(id));
	$("#youtubeModal").modal('show');
	
	var item = "<iframe id='player' type='text/html' width='100%' height='640' src='https://www.youtube.com/embed/"+videoId+"' allowfullScreen='allowfullScreen' frameborder='0'/>";
            
	$("#thisVideo").html(item);
	$("#cardtitle").text(title);
	related(videoId);
});

// 인급동 동영상 불러오기
function popular(){
	$.ajax({
		type:"get",
		data:{
          part: 'snippet',
          chart: 'mostPopular',
          maxResults: 24,
          key: 'AIzaSyAWIvbO9UQyV0_2FfjLHm69tDMmZn3a3Gw',
        },
		dataType:"json",
		url:"https://youtube.googleapis.com/youtube/v3/videos",
		success:function(data){
			console.log(data.items);
			var s = "";
			
			$.each(data.items, function(idx, item) {
				var time = item.snippet.publishedAt.slice(0,10);
				var title = item.snippet.title;
				
				s+="<div class='col youtubecard fadein' num='"+item.id+"' title='"+title+"'>";
				s+="	<img src='"+item.snippet.thumbnails.medium.url+"'>"
				s+="	<h5 class='text-truncate'>"+item.snippet.title+"</h5>";
				s+="	<p class=''>"+item.snippet.channelTitle;
				s+="	<br>"+time+"</p>";
				s+="</div>";
			});
			$("#youtube-list").html(s);
		}
	});
}

// 검색 동영상 불러오기
function searchByKeyword(keyword){
	$.ajax({
		type:"get",
		data:{
          part: 'snippet',
          maxResults: 24,
          q: keyword,
          key: 'AIzaSyAWIvbO9UQyV0_2FfjLHm69tDMmZn3a3Gw',
        },
		dataType:"json",
		url:"https://youtube.googleapis.com/youtube/v3/search",
		success:function(data){
			data = data.items.map((item) => ({ ...item, id: item.id.videoId }));
			
			var s = "";
			$.each(data, function(idx, item) {
				var time = item.snippet.publishedAt.slice(0,10);
				var title = item.snippet.title;
				
				s+="<div class='col youtubecard fadein' num='"+item.id+"' title='"+title+"'>";
				s+="	<img src='"+item.snippet.thumbnails.medium.url+"'>"
				s+="	<h5 class='text-truncate'>"+title+"</h5>";
				s+="	<p class=''>"+item.snippet.channelTitle;
				s+="	<br>"+time+"</p>";
				s+="</div>";
			});
			$("#youtube-list").html(s);
			$("#tag").text(`🔍 [${keyword}] 관련 동영상`);
		}
	});
}

// 검색 동영상 불러오기
function related(id){
	$.ajax({
		type:"get",
		data:{
          part: 'snippet',
          relatedToVideoId: id,
          type: 'video',
          maxResults: 24,
          key: 'AIzaSyAWIvbO9UQyV0_2FfjLHm69tDMmZn3a3Gw',
        },
		dataType:"json",
		url:"https://youtube.googleapis.com/youtube/v3/search",
		success:function(data){
			data = data.items.map((item) => ({ ...item, id: item.id.videoId }));
			
			var s = "";
			$.each(data, function(idx, item) {
				var time = item.snippet.publishedAt.slice(0,10);
				var title = item.snippet.title;
				
				s+="<div class='d-flex youtubecard mb-2' num='"+item.id+"' title='"+title+"' style='border-bottom: 1px solid lightgray;'>";
				s+="	<img src='"+item.snippet.thumbnails.medium.url+"' style='width:180px;'>"
				s+="	<div class='p-2'>"
				s+="		<h5 class='d-inline-block text-truncate'>"+title+"</h5>";
				s+="		<div style='margin-top: auto;'>"
				s+="			<p>"+item.snippet.channelTitle;
				s+="			<br>"+time+"</p>";				
				s+="		</div>"
				s+="	</div>"
				s+="</div>";
			});
			$("#relateVideo").html(s);
		}
	});
}