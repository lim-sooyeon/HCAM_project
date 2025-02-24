<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인한 회원정보
	String id = (String) session.getAttribute("id");
	// 세션에 저장된 mem_no 값 가져오기 
	int mem_no = 0;
	if(session.getAttribute("mem_no") != null) {
		mem_no = Integer.parseInt(String.valueOf(session.getAttribute("mem_no")));
	}
	String mem_name = "";
	if(session.getAttribute("mem_name") != null) {
		mem_name = String.valueOf(session.getAttribute("mem_name"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<!-- icon -->
<script src="https://kit.fontawesome.com/ae515d5c73.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
	#div_content {
		margin: 0 auto;
		width: 1050px;
	}
		/* 왼쪽 영역 */
		#div_content #left_content {
			display: inline-block;
			vertical-align: top;
			width: 245px;
		}
			.left_tab_tit {
				padding-top:20px;
			}
			.left_tab_tit::after {
				content:''; 
				display:block; 
				clear:both;
			}
				.left_tab_tit li {
					padding-left: 10px;
					width: 240px;
					height: 45px;
					line-height: 45px; 
					cursor:pointer;
					
				}
				.left_tab_tit li::after {
					float: right;
					content:''; 
					display:none;
					height: 100%;
					border-right: 3px solid var(--color-blue);
				}
				.left_tab_tit li.on {
					background: linear-gradient(90deg,#f8f7f9,#fff)
				}
				.left_tab_tit li.on::after {
					display:block;
					background-color: black;
				}
					.left_tab_tit .left_tab_icon {
						font-size: 12pt;
						color: var(--color-blue);
					}
					.left_tab_tit .left_tab_title {
						font-size: 12pt;
						color: var(--color-blue);
					}
		
		/* 오른쪽 영역 */
		#div_content #right_content {
			display: inline-block;
			vertical-align: top;
			width: 800px;
			background-color: gray;
		}
			.left_cnt {
				display:none; 
				padding:40px 10px;
			}
			.left_cnt.on {
				display:block; 
				padding:40px 10px;
			}
			.left_cnt h2 {
				font-size:20px; 
				font-weight:800;
			}
			.left_cnt ul {
				padding:20px 0px;
			}
			.left_cnt ul li {
				line-height:22px;
			}
			.left_cnt ul li::before {
				content: '';
				display: inline-block;
				margin-top: 9px;
				margin-right: 9px;
				width: 5px;
				height: 5px;
				background: #2f4394;
				border-radius: 50%;
				vertical-align: top;
			}
</style>
</head>
<script>
	$(function() {
		$('ul.left_tab_tit li').click(function() {
			var onTab = $(this).attr('data-tab');
			$('ul.left_tab_tit li').removeClass('on');
			$('.left_cnt').removeClass('on');
			$(this).addClass('on');
			$('#' + onTab).addClass('on');
			
		})
	});
</script>
<body>
	<!-- header -->
	<jsp:include page="../include/HCAM_header.jsp"/>
	
	<div id="div_content">
		<div id="left_content">
			<ul class="left_tab_tit">
				<li class="on" data-tab="left_tab1">
					<span class="left_tab_icon"><i class="fa-regular fa-calendar-check"></i></span>
					<span class="left_tab_title">예약관리</span>
				</li>
				<li data-tab="left_tab2">
					<span class="left_tab_icon"><i class="fa-brands fa-shopify"></i></span>
					<span class="left_tab_title">마켓주문</span>
				</li>
				<li data-tab="left_tab3">
					<span class="left_tab_icon"><i class="fa-regular fa-star-half-stroke"></i></span>
					<span class="left_tab_title">이용후기</span>
				</li>
				<li data-tab="left_tab4">
					<span class="left_tab_icon"><i class="fa-brands fa-product-hunt"></i></span>
					<span class="left_tab_title">포인트관리</span>
				</li>
				<li data-tab="left_tab5">
					<span class="left_tab_icon"><i class="fa-solid fa-circle-user"></i></span>
					<span class="left_tab_title">회원정보</span>
				</li>
			</ul>
		</div>
		<div id="right_content">
			<div id="left_tab1" class="left_cnt on">
				<div></div>
			</div>
			<div id="left_tab2" class="left_cnt">
				<h2>오늘의 할일</h2>
				<ul>
					<li>홍삼먹기</li>
					<li>연차</li>
				</ul>
			</div>
			<div id="left_tab3" class="left_cnt">
				<h2>오늘의 할일</h2>
				<ul>
					<li>청소하기</li>
					<li>화분물주기</li>
				</ul>
			</div>
			<div id="left_tab4" class="left_cnt">
				<h2>오늘의 할일</h2>
				<ul>
					<li>홍삼먹기</li>
					<li>연차</li>
				</ul>
			</div>
			<div id="left_tab5" class="left_cnt">
				<h2>오늘의 할일</h2>
				<ul>
					<li>청소하기</li>
					<li>화분물주기</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../include/HCAM_footer.jsp"/>
</body>
</html>