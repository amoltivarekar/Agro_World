<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%!
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst;
    String sur;
    ResultSet rs;
%>
<%
    try
    {
        url="jdbc:oracle:thin:@localhost:1521:XE";
        username="AMOL";
        password="12345";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection(url,username,password);
        HttpSession ses=request.getSession(false);    
        sur = ses.getAttribute("username").toString();
        pst=con.prepareStatement("select * from Fertilizer order by Frname");
        rs=pst.executeQuery();
    }
    catch(Exception e)
    {
        
    }
%>
<html>
<head>
    <style type="text/css">
        
        #imgid{
            float:left;
        }

    </style>
<title>Fertilizer Page</title>
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
                                        <li><a href="profile.jsp"><%=sur%></a></li>
					<li><a href="ProfileVegitabels.jsp">VEGETABLES</a></li>
                                        <li><a href="ProfileFruits.jsp" >FRUITS</a></li>
					<li><a href="ProfileCereals.jsp">CEREALS</a></li>
					<li class="active"><a href="ProfileFertilizer.jsp">FERTILIZERS</a></li>
					<li><a href="ProfileTools.jsp">TOOLS</a></li>
                                        <li><a href="UserLogout">LOGOUT</a></li>
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
    <%int i=1;
    while(rs.next()){%>
    <form action="SelectedFertilizer.jsp" method="post">
        <div class="vimag" style="padding:10px 300px 0px 50px;">
            <img src="images/FR-<%out.print(i);%>.jpg" width="180px" height="150px" id="imgid" >
        </div>
        <div clas="vinfo" style="padding-left: 300px;">
            <p style="color:white; font-weight: bold; font-size: 22px;"><%=rs.getString(1)%></p>
            <p style="color:white; font-weight: bold; font-size: 18px;"><%=rs.getInt(2)%> (Rs) per kg</p>
            <p style="color:white; font-weight: bold; font-size: 18px;"><%=rs.getString(3)%></p>
        </div><input type="checkbox" name="fertilizername" value="<%=rs.getString(1)%>" style="
      width: 28px;
      height: 28px;
      background: #fcfff4;
      background: linear-gradient(top, #fcfff4 0%, #dfe5d7 40%, #b3bead 100%);
      box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0,0,0,0.5); float:right; margin-right:500px;">
        <br><br>
        <br><hr style="width:95%;"><%i++;}%>
            <input type="submit" value="PROCEED" class="procede" style="margin-left:200px; padding:10px 200px 10px 200px; font-weight: bold;">
    </form>
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