<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>

<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<!-- start slider -->
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<!--end slider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript">
	$(window).load(function() {
		$("#flexiselDemo").flexisel({
			visibleItems : 5,
			animationSpeed : 1000,
			autoPlay : false,
			autoPlaySpeed : 3000,
			pauseOnHover : true,
			enableResponsiveBreakpoints : true,
			responsiveBreakpoints : {
				portrait : {
					changePoint : 480,
					visibleItems : 1
				},
				landscape : {
					changePoint : 640,
					visibleItems : 2
				},
				tablet : {
					changePoint : 768,
					visibleItems : 3
				}
			}
		});

	});
</script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
</head>
<body>
<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#">24x7 Kundendienst </a></li> |
						<li><a href=""> Kontaktieren Sie uns </a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><i class="user"></i> <a href="account.html">Konto</a></li>
						<li class="login"><i class="lock"></i> <a href="login.html">Login</a>|
						</li>
						<li><i class="cart"></i> <a href="warenkorb.jsp">Warenkorb</a></li>
						<li class="last">5</li>
					</ul>
					<div class="sign-up-right">
						<a href="login.html">Sign Up</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<div class="best-sellers">
			<div class="best-sellers-head">
				<h3>Bestsellers</h3>
			</div>
			<div class="best-sellers-menu">
				<ul>
					<li><a class="index.jsp" href="#">Elektronik</a></li>
					<li><a href="#">Mode</a></li>
					<li><a href="#">Bücher</a></li>
					<li><a href="#">Andere</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

<blockquote>
<p>

Sie haben <% out.print(request.getParameter("count")); %> Stück <% out.print(request.getParameter("product")); %> bestellt.
<br/>
<% // TODO: check if the names matches the ware and if there are enough products %>
Das wird jetzt in Ihren Warenkorb gelegt.
<br/> <!-- jsessionid=<%= session.getId() %> -->
<%
Connection conn = null;
try {
      Context initCtx = new InitialContext();
      DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/onlineshop");
      conn = ds.getConnection();
      int count=Integer.parseInt(request.getParameter("count"));
      String id=session.getId();
      String ware=request.getParameter("product");
      while(count-->0) {
        PreparedStatement ps = conn.prepareStatement("insert into warenkorb (id,bezeichnung) values('" + id + "','" + ware + "')");
      	ps.executeUpdate();
      }
conn.close();
} catch (SQLException e) {
          e.printStackTrace();
          if(conn != null) conn.close();
} catch (NamingException e) {
          e.printStackTrace();
} catch (Exception e) {
          e.printStackTrace();
          if(conn != null) conn.close();
}
%>
</p>
</blockquote>
<form action="index.jsp" method="post">
<input type="submit" value="Weiter kaufen">
</form>
<form action="warenkorb.jsp" method="post">
<input type="submit" value="Warenkorb">
</form>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-left">
					<h3>Folge uns</h3>
					<br/>
					<div class="social-icons">
						<i class="twitter"></i> <i class="facebook"></i> <i
							class="googlepluse"></i> <i class="pinterest"></i> <i
							class="linkedin"></i>
					</div>
				</div>
				<div class="col-md-4 subscribe text-left">
					<h3>Abonnieren Sie uns</h3>
					<p>Holen Sie sich die neuesten Updates und Angebote direkt in Ihren Posteingang.</p>
					<input type="text" class="text" value="" onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = '';}"> <input
						type="submit" value="Abonnieren">
				</div>
				<div class="col-md-4 help text-right">
					<h3>Brauchen Sie Hilfe?</h3>
					<br/><br/>
					<a href="contact.html">Kontaktiere uns</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>
					Copyright &copy; Bestseller 2022 </a>
				</p>
			</div>

		</div>
	</div>
</body>
</html>



</body>
</html>