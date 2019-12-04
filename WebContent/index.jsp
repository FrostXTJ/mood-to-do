<%@page import="general.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<style>
	
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
			<div class="row align-items-center justify-content-between d-flex">
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
		</div>
	</header>
	<!-- End Header Area -->


	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
					<h1 class="wow fadeIn" data-wow-duration="4s">Follow your heart.<br/> Follow your mood.</h1>
					
					<h4 class="text-white">How do you feel right now?</h4>

					<div class="courses pt-20">
						<form action="MoodPageServlet">
							<input type="hidden" name="type" value="movies">
							<button type="submit" name="mood-btn" value="cheerful" data-wow-duration="1s" data-wow-delay=".3s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Cheerful &#128516;
							</button>
							
							<button type="submit" name="mood-btn" value="excited" data-wow-duration="1s" data-wow-delay=".6s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Excited &#128541;
							</button>
							<button type="submit" name="mood-btn" value="romantic" data-wow-duration="1s" data-wow-delay=".9s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Romantic &#128536;
							</button>
							<button type="submit" name="mood-btn" value="tense" data-wow-duration="1s" data-wow-delay="1.2s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;"> 
								Tense &#128534;
							</button>
							<button type="submit" name="mood-btn" value="anxious" data-wow-duration="1s" data-wow-delay="1.5s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Anxious &#128552;
							</button>
							<button type="submit" name="mood-btn" value="angry" data-wow-duration="1s" data-wow-delay="1.8s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Angry &#128545;
							</button>
							<button type="submit" name="mood-btn" value="lonely" data-wow-duration="1s" data-wow-delay="2.1s" class="primary-btn transparent mr-10 mb-10 wow fadeInDown" style="font-size: 18px; height:40px;">
								Lonely &#128546;
							</button>
						</form>
					</div>
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
			<div class="row">
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
				
				<div class="col-lg-6 col-md-6 single-footer-widget">
					<h4>Contact Us</h4>
					<ul>
						<li><a href="mailto: frostxu@usc.edu">frostxu@usc.edu</a></li>
						<li><a href="mailto: wassynge@usc.edu">wassynge@usc.edu</a></li>
						<li><a href="mailto: hknutson@usc.edu">hknutson@usc.edu</a></li>
						<li><a href="mailto: bmindana@usc.edu">bmindana@usc.edu</a></li>
						<li><a href="mailto: wuxuezhe@usc.edu">wuxuezhe@usc.edu</a></li>
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
	
	<script>
	
	
	</script>
	

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