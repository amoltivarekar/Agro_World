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
        
        pst=con.prepareStatement("select * from agrouserselfinfo where fname='"+sur+"'");
        rs=pst.executeQuery();
        rs.next();
    }
    catch(Exception e)
    {
        
    }
%>
<html>
<head>
<title>User account Page</title>
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
<script>

function validateFm(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode < 47 || charCode > 58)
    {
    }
    else
    {
        alert("You cannot insert numeric values");
        return false;
    }   
}
function validatephno(evt)
{
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode < 47 || charCode > 58)
    {
        alert("You cannot insert any Alphabetic character ");
        return false;
    }      
}
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
                                    <li class="active"><a href="profile.jsp"><%=sur%></a></li>
                                    <li><a href="ProfileVegitabels.jsp">VEGETABLES</a></li>
                                    <li><a href="ProfileFruits.jsp" >FRUITS</a></li>
                                    <li><a href="ProfileCereals.jsp">CEREALS</a></li>
                                    <li><a href="ProfileFertilizer.jsp">FERTILIZERS</a></li>
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
<div class="login-wrap" style="margin-top:30px; margin-bottom:50px  ;">
	<div class="login-html" style="padding-bottom:200px;">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab" style="cursor:pointer;">PROFILE INFO</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab" style="color:#C9A974;cursor:pointer;"></label>
		<div class="login-form">
			<div class="sign-in-htm">
                            <form action="updateuserinfo" method="post">
				<div class="group">
					<label for="user" class="label">Full Name</label>
                                        <input name="user" type="text" class="input" onkeypress="return validateFm(event)" value="<% out.print(rs.getString(1));%>" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Email</label>
                                        <input name="email" type="email" class="input" value="<% out.print(rs.getString(2));%>" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Address</label>
                                        <input name="address" type="text" class="input" value="<% out.print(rs.getString(3));%>" required>
				</div>
                                <div class="group">
					<label for="pass" class="label">Mobile No</label>
                                        <input name="mobno" type="text" class="input" onkeypress="return validatephno(event)" value="<% out.print(rs.getString(4));%>" required>
				</div>
                                <div class="group">
					<label for="pass" class="label">Username</label>
                                        <input name="username" type="text" class="input"  value="<% out.print(rs.getString(5));%>" required>
				</div>
                                <div class="group">
					<label for="pass" class="label">Password</label>
                                        <input name="password" type="password" class="input" value="<% out.print(rs.getString(6));%>"  required>
				</div><br>
				<div class="group">
					<input type="submit" class="button" value="UPDATE" style="cursor: pointer;">
                                </div>
                            </form>
			</div>
			
		</div>
	</div>
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