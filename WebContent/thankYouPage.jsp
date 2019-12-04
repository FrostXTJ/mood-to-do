<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="codepixer">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Mood To Do</title>

	<!--
			Google Font
			============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,500,600" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500i" rel="stylesheet">

	<!--
			CSS
			============================================= -->
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	
	<style>
		#favHeader {
			color: white;
			display: block;
			font-size: 50px;
		}
		#favForm {
			display: block;
		}
		
		#subButton {
			background-color: white;
			color: #39cfca;
			border: 1px solid grey;
			margin-top: 10px;
			border-radius: 10px;
		}
		
		.buttonLink {
			color: white;
			padding: 0;
			background-color: transparent;
			border: none;
    		outline: none;
    		font-size: 13px;
    		margin-left: 15px;
    		font-weight: 700;
    		display: inline-block;
    		
    		cursor: pointer;
		}
		
		@media (max-width: 800px){
			.buttonLink {
				text-transform: uppercase;
			}
		}
		
		
	</style>
</head>

<body>

	<!-- Start Header Area -->
	<header id="header">
		<div class="container">
				<div id="logo">
					<a href="index.html"><img src="" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.jsp">Home</a></li>
						<%
						String user = null;
						if(session.getAttribute("user") == null){
						%>
						<li><a href="RegisterPage.jsp">Sign Up</a></li>
						<li><a href="LoginPage.jsp">Log In</a></li>
						<%
							} else {
						%>
						<form action ="SuedoSignoutServlet" method="POST" name="logoutForm">
							<li><button type="submit" class= "buttonLink">Logout</button></li>
						</form>
							
							
						
						<li><a href="Favorites.jsp">Favorites</a></li>
						<%
							}
						%>
						
					</ul>
				</nav><!-- #nav-menu-container -->
			</div>
	
	</header>
	<!-- End Header Area -->


	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
		<div class="row fullscreen d-flex align-items-center justify-content-center">
		<div class="banner-content col-lg-8 col-md-12">
			<div>
				<h1 id="favHeader" class="wow fadeIn" data-wow-duration="4s">Success! View favorites now?</h1>
			</div>
				<div id="favForm">
					<form action="favoritePageServlet">
					
						<button id="subButton" type=submit>View your Favorites!</button>
					
				</div>
					<div class="favorite"></div>
			</div>
		</div>
		</div>
		<div class="rocket-img">
			<img src="img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->

	<!-- Start Footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">
			<div class = "row">
			<div class="col-lg-4 col-md-6 single-footer-widget">
					<h4>Team Members</h4>
					<ul>
						<li>Frost Tianjian Xu</li>
						<li>Benjamin Wassynger</li>
						<li>Heather Knutson</li>
						<li>Bernard Mindanao</li>
						<li>Xuezheng Wu</li>
					</ul>
				</div>
				
			</div>
			
			<div class="footer-bottom row align-items-center">
				<p class="footer-text m-0 col-lg-8 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> | This webpage is a template made by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</div>
	</footer>
	<!-- End Footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/owl-carousel-thumb.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>

</html>