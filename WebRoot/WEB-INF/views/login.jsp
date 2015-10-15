<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c-rt.tld"%>
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
<script type="text/javascript">
    $(function()
    {
        $("#username").focus();
        if (parent.window != window)
        {
            $("#login_form").attr("action", "${base}/forward_login");
            $("#login_form").attr("target", "_top");
            $("#login_form").submit();
        }

        $('#btn_register').click(function()
        {
            window.location = '${base}/forward_register';
        });

        $('#btn_mock').click(function()
        {
            window.open('${base}/mock/forward_mock');
        });
    });
</script>
<title>Login-${system_name}</title>
</head>

<body>
			<header>
				<div class="menu_block ">
					<div class="container_12">
						<div class="grid_12">
							<nav class="horizontal-nav full-width horizontalNav-notprocessed">
								<ul class="sf-menu">
									<li><a href="home.html">Home</a></li>
									<li  class="current"><a href="master/index">Account</a></li>
									<li><a href="cars.html">Cars</a></li>
									<li><a href="reference.html">Services</a></li>
									
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</header>
	  <div id="background">
			  <div id="page">
			
					 <div class="header">
						<div class="footer">
							<div class="body">
							  
									<div id="sidebar">
									    <a href="master/index"><img id="logo" src="${base}/css/img/logoo.png" with="154" height="74" alt="" title=""/></a>
									
										
										<ul class="navigation">
										    <li class="active" ><a href="master/index">HOME</a></li>
											<li><a href="about">ABOUT</a></li>
											<li class="last" ><a href="contact">CONTACT</a></li>
										</ul>
										
										<div class="connect">
										    <a href="#" class="facebook">&nbsp;</a>
											<a href="#" class="twitter">&nbsp;</a>
											<a href="#" class="vimeo">&nbsp;</a>
										</div>
										
										<div class="footenote">
										  <span>&copy; Copyright &copy; 2013.</span>
										  <span><a href="index.html">Yanxiang Zhu</a> all rights reserved</span>
										</div>
										
									</div>
									<div id="content" >
									
									    <img src="${base}/css/img/big4.jpg" width="726" height="546" alt="" title="">
										<div class="featured">
										      <div class="header">
											     <ul>
														<li class="first">
															<!--<p>hi.</p> -->
															<img src="${base}/css/img/hi.jpg" width="50" height="62" alt="" title="" >
														</li>
														<li class="last">
															<p>
																Welcome to Intelligent Automatic Car Rental System
															</p>
														</li>
												 </ul>
										</div>
									 <form id="login_form" action="${base}/login" method="post">
									    <table class="detail" style="width: 30%;">
									          <thead>
                <tr>
                    <td colspan="2">Login</td>
                </tr>
            </thead>
            <tbody>
                <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null && SPRING_SECURITY_LAST_EXCEPTION.message != null}">
                    <tr>
                        <td colspan="2">${SPRING_SECURITY_LAST_EXCEPTION.message}</td>
                    </tr>
                </c:if>
                <tr>
                    <th color="black">Username</th>
                    <td>
                        <input type="text" name="j_username" id="username" />
                    </td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <input type="password" name="j_password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="actions">
                        <input type="submit" value="login" />
                        <input type="button" id="btn_register" value="register">
                        <input type="button" id="btn_mock" value="Simulation">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
									    </div>
									</div>
						</div>
					 </div>
					 <div class="shadow">&nbsp;</div>
			  </div>    
	  </div>    
	
</body>
</html>