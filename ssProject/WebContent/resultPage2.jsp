<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과 페이지</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!--1순위 외부css  -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!--2 순위 jquery   -->
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!--3순위부트스트랩  -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Kc1K9Dz8qVkBbOqWYQLp&submodules=geocoder"></script>

<style type="text/css">
body{
	padding-top: 20px;
}

.navbar-header {
	height: 50px;
}

.navbar-brand {
	padding: 0px;
}

.container {
	margin-top: 100px;
	float: none;
}

.panel-body {
	font-size: 20px;
}

.label.label-danger {
	margin-right: 10px;
}

.nav.nav-pills.nav-stacked.admin-menu {
	font-size: 20px;
}

.panel-title {
	font-size: 20px;
}

.top-line {
	background-color: gray;
	position: relative;
	height: 60px;
}

.navbar-brand .img-responsive {
	width: 150px;
	height: 50px;
	margin-bottom: 70px;
	margin-left: 370px;
}

.navbar-default {
	padding-top: 10px;
	padding-bottom: 10px;
}

#bs-example-navbar-collapse-1 {
	font-size: 20px;
	margin-right: 100px;
}

/* ----------------------------------- */
.container {
	margin-left: 400px;
}

.hide-bullets {
	list-style: none;
	padding-left: 0px;
	margin: 0px;
}

.col-sm-8 {
	padding-right: 0px;
	margin-right: 0px;
}

.col-sm-12 {
	padding: 0px;
}

.thumbnail {
	padding-left: 0px;
	margin: 0px;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	height: 500px;
}

#slider-thumbs {
	height: 500px;
	overflow-y: scroll;
	white-space: nowrap;
	padding-left: 0px;
	padding-right: 0px;
}

.map_wrap {
	text-align: center;
	width: 1090px;
	height: 100px;
	margin-left: 405px;
}

.map_wrap .map_div {
	border-radius: 5px;
	border: 4px solid gray;
	box-sizing: border-box;
	height: 500px;
	margin: 0 auto;
	width: 95%;
}

.map_wrap .map_tit {
	font-size: 12pt !important;
	padding: 10px 0;
}
</style>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('#myCarousel').carousel({
			interval : 5000
		});
		$('[id^=carousel-selector-]').click(function() {
			var id_selector = $(this).attr("id");
			try {
				var id = /-(\d+)$/.exec(id_selector)[1];
				console.log(id_selector, id);
				jQuery('#myCarousel').carousel(parseInt(id));
			} catch (e) {
				console.log('Regex failed!', e);
			}
		});
		// When the carousel slides, auto update the text
		$('#myCarousel').on('slid.bs.carousel', function(e) {
			var id = $('.item.active').data('slide-number');
			$('#carousel-text').html($('#slide-content-' + id).html());
		});
	});
</script>


</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="contain">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="navbar-brand">
				<a href="index.jsp"><img src="./img/siccha.png"
					class="img-responsive" /></a>
			</div>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="selectPage.html">메뉴선정</a></li>
				<li><a href="myPage.jsp">마이페이지</a></li>
				<li><a href="Board.do?action=list.jsp">문의게시판</a></li>
				<li><a href="Member.do?action=logout">로그아웃</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<div id="main_area">
			<!-- Slider -->
			<h1>${fname }</h1>
			<hr>
			<div class="col-sm-8">
				<div class="col-xs-12" id="slider">
					<!-- Top part of the slider -->
					<div class="row">
						<div class="col-sm-12" id="carousel-bounding-box">
							<div class="carousel slide" id="myCarousel">

								<!-- Carousel items -->
								<div class="carousel-inner">
									<c:forEach var="item" items="${img_list}" varStatus="i">
										<c:choose>
											<c:when test="${i.index==0}">
												<div class="active item" data-slid-number="${i.index}"
													align="center">
													<img src="${item.link}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="item" data-slide-number="${i.index}"
													align="center">
													<img src="${item.link}">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>

								<!-- Carousel nav -->
								<a class="left carousel-control" href="#myCarousel"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span>
								</a> <a class="right carousel-control" href="#myCarousel"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-3" id="slider-thumbs">
					<ul class="hide-bullets">
						<c:forEach var="item" items="${img_list}" varStatus="i">
							<li class="col-sm-12"><a class="thumbnail"
								id="carousel-selector-${i.index}"> <img
									src="${item.thumbnail}">
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	<hr>
	<div id="map" style="width: 95%; height: 400px;"></div>
	<br><br><br><br><br>
	</div>
	<script>
	var map = null;
	var marker = null;
    infoWindow = null;

function initMap() {
	
    map = new naver.maps.Map("map", {
        center: new naver.maps.Point(310267, 551458),
        zoom: 8,
        mapTypes: new naver.maps.MapTypeRegistry({
            'normal': naver.maps.NaverMapTypeOption.getNormalMap({
                projection: naver.maps.TM128Coord
            }),
            'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
                projection: naver.maps.TM128Coord
            }),
            'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
                projection: naver.maps.TM128Coord
            }),
            'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
                projection: naver.maps.TM128Coord
            })
        }),
        mapTypeControl: true
    });
	<c:forEach var="item" items="${list}">
		 marker = new naver.maps.Marker({
		        position: new naver.maps.Point(${item.mapx},${item.mapy}),map: map
		    });
 	
		 
		 
		 var contentString = [
		       
		    ].join('');

		 
		 var infowindow = new naver.maps.InfoWindow({
			    content: contentString
			});

			naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindow.open(map, marker);
			    }
			});

			infowindow.open(map, marker);
		 
		 
 	</c:forEach>
   
 	
 	
 	
	


   /*  infoWindow = new naver.maps.InfoWindow({
        content: getInfoWindowContent(map.getCenter())
    });
 */
    function updateInfoWindow(coord) {
        infoWindow.setContent(getInfoWindowContent(coord));
        infoWindow.open(map, coord);
    }

    function getInfoWindowContent(coord) {
        console.log('Coord:', coord);
        return [
            '<div style="padding:10px;width:200px;font-size:14px;line-height:20px;text-align:center;">',
            '<p>',
            '</p>',
            '</div>'
        ].join('');
    }

    updateInfoWindow(map.getCenter());

   /*  map.addListener('idle', function(e) {
        updateInfoWindow(map.getCenter());
    }); */
}

naver.maps.onJSContentLoaded = initMap;

</script>


</body>
</html>