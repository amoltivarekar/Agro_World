<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%!
    String sur;
%>
<%
    try
    {
        HttpSession sess=request.getSession(false);    
        sur = sess.getAttribute("adminname").toString();
    }
    catch(Exception e)
    {
        out.print("hello : "+e);
    }
%>
<html>
<head>
    <style type="text/css">
        
        #imgid{
            float:left;
        }

    </style>
<title>Admin Page</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Agro World  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android  Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!---->
<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('.gallery-grids a').Chocolat();
		});
		</script>
<!--moving-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
				<script type="text/javascript">
					jQuery(document).ready(function($) {
						$(".scroll").click(function(event){		
							event.preventDefault();
							$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
						});
					});
				</script>
</head>
<body>
<!--header-->
<div class="header">
	<div class="container">
		<div class="logo">
		<h1><a href="index.html">
			Agro World
		</a></h1>
		</div>
		<div class="top-nav">
			<span class="menu"><img src="images/menu.png" alt=""> </span>
				<ul>
                                        <li><a href="admprofile.jsp"><%=sur%></a></li>
					<li class="active"><a href="adminprofile.jsp">PROFILE</a></li>
                                        <li><a href="adminusers.jsp">USERS</a></li>
                                        <li><a href="feedbacks.jsp">FEEDBACKS</a></li>
                                        <li><a href="AdminLogout">LOGOUT</a></li>
				</ul>
						<!--script-->
					<script>
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(500, function(){
							});
						});
				</script>				
		</div>
	</div>
<!--header close-->

<div class="vegitables">
    <center>
        <div class="vimag" style="padding:10px 0px 60px 300px;">
            <img src="images/admin.png" width="250px" height="220px" id="imgid" style="border-radius:15px;" >
        </div>
        <div clas="vinfo" style="padding:0px 400px 0px 0px;">
            <p style="color:white; font-weight: bold; font-size: 22px;">Ashish Shrivstav</p>
            <p style="color:white; font-weight: bold; font-size: 18px;">Admin Of AGRO WORLD web site</p>
            <p style="color:white; font-weight: bold; font-size: 18px;">T.Y.BSc (IT) student</p>
            <p style="color:white; font-weight: bold; font-size: 18px;">K.E.S College, Khar (west)</p>
        </div>
    </center>
</div>

<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-bottom">
			<div class="col-sm-8 footer-menu">
				<ul>
					<li><a href="index.html">Home</a></li>
                                        <li><a href="User.html" >User</a></li>
					<li><a href="gallery.html">Gallery</a></li>
					<li><a href="About.html">About</a></li>
					<li><a href="Contact.html">Contact</a></li>
				</ul>
				</div>
		<div class="col-sm-4 footer-top1">
			<ul class="social">
						<li><a href="https://www.facebook.com/login/"><i> </i></a></li>
						<li><a href="https://twitter.com/login"><i class="twitter"> </i></a></li>						
						<li><a href="https://www.instagram.com/accounts/login/"><i class="linked"> </i></a></li>
						<li><a href="https://dribbble.com/session/new"><i class="dribble"> </i></a></li>
					</ul>
		</div>
		<div class="clearfix"> </div>
		</div>		
	</div>
	<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>
<!--footer close-->
</body>
</html>