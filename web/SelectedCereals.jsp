<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%!
    Connection con;
    String username;
    String password;
    String url;
    PreparedStatement pst,pst1;
    String sur;
    ResultSet rs;
%>
<%
    try {
        url = "jdbc:oracle:thin:@localhost:1521:XE";
        username = "AMOL";
        password = "12345";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection(url, username, password);
        HttpSession ses = request.getSession(false);
        sur = ses.getAttribute("username").toString();
    }
    catch (Exception e) {

    }
%>
<html>
    <head>
        <style type="text/css">

            #imgid{
                float:left;
            }

        </style>
        <title>Cereals Page</title>
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
            $(function () {
                $('.gallery-grids a').Chocolat();
            });
        </script>
        <!--moving-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <style>
            .qtyinput{
                border:none;
                padding:5px 20px;
                border-radius:25px;
                border: #c0a16b 1px solid;
                width:70%;
                margin:5px;
                background:rgba(255,255,255,.1);
            }
        </style>
        <script type="text/javascript" language="javascript">
			var n1,n2,num1,num2,no1;
			
			function abcd()
			{	
				num1=parseInt(document.getElementById('a').value);
				num2=parseInt(document.getElementById('b').value);
                                n1=(num1+num2).toString();
				no1=document.getElementById('c').value=n1;	
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
                        <li><a href="profile.jsp"><%=sur%></a></li>
                        <li><a href="ProfileVegitabels.jsp">VEGETABLES</a></li>
                        <li><a href="ProfileFruits.jsp" >FRUITS</a></li>
                        <li class="active"><a href="ProfileCereals.jsp">CEREALS</a></li>
                        <li><a href="ProfileFertilizer.jsp">FERTILIZERS</a></li>
                        <li><a href="ProfileTools.jsp">TOOLS</a></li>
                        <li><a href="UserLogout">LOGOUT</a></li>
                    </ul>
                    <!--script-->
                    <script>
                        $("span.menu").click(function () {
                            $(".top-nav ul").slideToggle(500, function () {
                            });
                        });
                    </script>				
                </div>
            </div>
            <!--header close-->
            <div class="vegitables">
                <center>
                    <h3 style="color: #DCC092;">YOUR SELECTED CEREALS ARE </h3><br><br>
                    <table width="50%">
                        <%!
                            String str[]=new String[1000];
                            int i;
                            String currentdate;
                            List list;%>
                        <%
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            Calendar calfordate = Calendar.getInstance();
                            currentdate = dateFormat.format(calfordate.getTime()).toString();
                        
                            String[] names = request.getParameterValues("cerealsname");
                            List list = Arrays.asList(names);
                            for (int i = 0; i < list.size(); i++) 
                            {
                                pst = con.prepareStatement("select cname,cprice from cereals where cname='" + list.get(i) + "'");
                                rs = pst.executeQuery();
                                while (rs.next())
                                {
                                    %>
                                    <tr>
                                        <td style="color:white; font-weight: bold; font-size:17px;">
                                           <%=rs.getString(1)%>
                                        </td>
                                        <td style="color:white; font-weight: bold; font-size:17px;" id="a"  name="qty1" >
                                            <input type="text" class="qtyinput" value="<%out.print(""+rs.getInt(2));%>" id="a">
                                        </td>
                                        <td style="color:white; font-weight: bold; font-size:17px;">
                                            <input type="text" class="qtyinput" placeholder="qty" id="b" onblur="abcd()">
                                        </td>                       
                                    </tr>
                               <%
                                  pst1 = con.prepareStatement("insert into RegProducts(regname,regdate,regprod,regprodprc) values('"+sur+"','"+currentdate+"','"+rs.getString(1)+"',"+rs.getInt(2)+")");
                                  pst1.executeQuery();
                                      }
                            }%>
                    </table>
                    <br><br>
                    <input type="submit" onclick="window.location='proceed?date=<%=currentdate%>'" value="PROCEED" class="procede" style=" border-radius:15px; padding:10px 200px 10px 200px; font-weight: bold;">
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
                    $(document).ready(function () {
                        /*
                         var defaults = {
                         containerID: 'toTop', // fading element id
                         containerHoverID: 'toTopHover', // fading element hover id
                         scrollSpeed: 1200,
                         easingType: 'linear' 
                         };
                         */

                        $().UItoTop({easingType: 'easeOutQuart'});

                    });
                </script>
                <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            </div>
            <!--footer close-->
    </body>
</html>
