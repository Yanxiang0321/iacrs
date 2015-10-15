<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="${base}/css/style.css" rel="Stylesheet" type="text/css" />
<%-- 	<link href="${base}/css/style2.css" rel="Stylesheet" type="text/css" /> --%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${base}/css/global.css" type="text/css" rel="Stylesheet" />
		<link rel="icon" href="images/favicon.ico">
		<link rel="shortcut icon" href="images/favicon.ico" />
		<link rel="stylesheet" href="booking/css/booking.css">
		<link rel="stylesheet" href="css/camera.css">
		<link rel="stylesheet" href="css/owl.carousel.css">
		<!-- <link rel="stylesheet" href="css/style.css"> -->
				<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.2.1.js"></script>
		<script src="js/script.js"></script>
		<script src="js/superfish.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.mobilemenu.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/owl.carousel.js"></script>
		<script src="js/camera.js"></script>
		<!--[if (gt IE 9)|!(IE)]><!-->
		<script src="js/jquery.mobile.customized.min.js"></script>
		<!--<![endif]-->
		<script src="booking/js/booking.js"></script>
<script src="${thirdparty}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Login-${system_name}</title>
</head>
<body>
<header>
				<div class="menu_block ">
					<div class="container_12">
						<div class="grid_12">
							<nav class="horizontal-nav full-width horizontalNav-notprocessed">
								<ul class="sf-menu">
									<li><a href="${base}/home.html" target="_top">Home</a></li>
									<li class="current"><a href="master/index" target="_top">Account</a></li>
									<li><a href="${base}/cars.html" target="_top">Cars</a></li>
									<li><a href="${base}/reference.html" target="_top">Reference</a></li>
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</header>
    <div class="top-container">
        <div class="logo">${system_name}</div>
        <div class="message">Welcome，${username}。&nbsp;&nbsp;[<a href="${base}/logout" target="_top">Logout</a>]</div>
    </div>
</body>
</html>