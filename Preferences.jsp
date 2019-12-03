<%@page import="java.util.ArrayList"%>
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
	<title>Preferences</title>

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
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 70%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 10px;
  color:white;
}
.submitPref{
	color: #39cfca;
	background-color: white;
	border-radius: 50%;
}
.wrongInput{
	color: red;
}
</style>
<script>
function val() {
	var xhttp = new XMLHttpRequest();
	document.getElementById("errorMsg").innerHTML = "";
	xhttp.open("GET", "Validate?notification=" + document.myform.notification.value + "&showRFilms=" + document.myform.showRFilms.value + "&showExSongs=" + document.myform.showExSongs.value,false);
	xhttp.send();
		if(xhttp.responseText.trim().length > 0)
		{
			document.getElementById("errorMsg").innerHTML = xhttp.responseText;
			return false;
		}     
		return true; 
} 
</script>
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
						<li><a href="#">Username</a></li>
						<li><a href="index.jsp">Log Out</a></li>
						<li class="menu-has-children"><a href="">Setting</a>
							<ul>
								<li><a href="#">Elements</a></li>
							</ul>
						</li>
						<li><a href="#">Contact</a></li>
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
					<h1 class="wow fadeIn" data-wow-duration="4s">Your Preferences</h1>
					<h4 class="text-white"></h4> <br>
					<form name = "myform" method="GET" action="Profile.jsp" onsubmit = "return val()">
					<div id = "errorMsg" class = "wrongInput"></div>
					<table style="float: right;margin-right:400px;">
						<tr>
							<td>
								Receive notification:
							</td>
							<td>
								<input type="radio" name="notification" value="Yes" ><font color="white">Yes</font></div> <br>
								<input type="radio" name="notification" value="No"><font color="white">No</font></div>
								
							</td>
							</tr>
						<tr>
							<td>
								Show restricted films:
							</td>
							<td>
								<input type="radio" name="showRFilms" value="Yes" ><font color="white">Yes</font></div> <br>
								<input type="radio" name="showRFilms" value="No"><font color="white">No</font></div>
								
							</td>
						</tr>
						<tr>
							<td>
								Exclude film genres:
							</td>
							<td>
								<input type="radio" name="excludeAction" value="Action" ><font color="white">Action</font></div>
								<input type="radio" name="excludeAdventure" value="Adventure"><font color="white">Adventure</font></div> 
								<input type="radio" name="excludeAnimation" value="Animation"><font color="white">Animation</font></div><br>
								<input type="radio" name="excludeComedy" value="Comedy" ><font color="white">Comedy</font></div> 
								<input type="radio" name="excludeCrime" value="Crime" ><font color="white">Crime</font></div> 
								<input type="radio" name="excludeDocumentary" value="Documentary" ><font color="white">Documentary</font></div> <br>
								<input type="radio" name="excludeDrama" value="Drama" ><font color="white">Drama</font></div> 
								<input type="radio" name="excludeFamily" value="Family" ><font color="white">Family</font></div> 
								<input type="radio" name="excludeFantasy" value="Fantasy" ><font color="white">Fantasy</font></div> <br>
								<input type="radio" name="excludeHistory" value="History" ><font color="white">History</font></div> 
								<input type="radio" name="excludeHorror" value="Horror" ><font color="white">Horror</font></div> 
								<input type="radio" name="excludeMystery" value="Mystery" ><font color="white">Mystery</font></div> <br>
								<input type="radio" name="excludeRomance" value="Romance" ><font color="white">Romance</font></div> 
								<input type="radio" name="excludeScienceFiction" value="Science Fiction" ><font color="white">Science Fiction</font></div>
								<input type="radio" name="excludeTVMovie" value="TV Movie" ><font color="white">TV Movie</font></div> <br>
								<input type="radio" name="excludeThriller" value="Thriller" ><font color="white">Thriller</font></div> 
								<input type="radio" name="excludeWar" value="War" ><font color="white">War</font></div> 
								<input type="radio" name="excludeWestern" value="Western" ><font color="white">Western</font></div> 
							</td>
						</tr>
						<tr>
							<td>
								Show explicit songs:
							</td>
							<td>
								<input type="radio" name="showExSongs" value="Yes" ><font color="white">Yes</font></div> <br>
								<input type="radio" name="showExSongs" value="No"><font color="white">No</font></div>
								
							</td>
						</tr>			
						<tr>
							<td>
								Exclude song genres:
							</td>
							<td>
								<input type="radio" name="excludeBlues" value="Blues" ><font color="white">Blues</font></div> 
								<input type="radio" name="excludeSoComedy" value="Comedy"><font color="white">Comedy</font></div> 
								<input type="radio" name="excludeClassic" value="Classic"><font color="white">Classic</font></div> <br>
								<input type="radio" name="excludeCountry" value="Country" ><font color="white">Country</font></div> 
								<input type="radio" name="excludeElectronic" value="Electronic" ><font color="white">Electronic</font></div> 
								<input type="radio" name="excludeHoliday" value="Holiday" ><font color="white">Holiday</font></div> <br>
								<input type="radio" name="excludeJazz" value="Jazz" ><font color="white">Jazz</font></div> 
								<input type="radio" name="excludePop" value="Pop" ><font color="white">Pop</font></div> 
								<input type="radio" name="excludeR&B/Soul" value="R&B/Soul" ><font color="white">R&B/Soul</font></div> <br>
								<input type="radio" name="excludeDance" value="Dance" ><font color="white">Dance</font></div> 
								<input type="radio" name="excludeHip-Hop/Rap" value="Hip-Hop/Rap" ><font color="white">Hip-Hop/Rap</font></div> 
								<input type="radio" name="excludeAlternative" value="Alternative" ><font color="white">Alternative</font></div> <br>
								<input type="radio" name="excludeRock" value="Rock" ><font color="white">Rock</font></div> 
								<input type="radio" name="excludeReggae" value="Reggae" ><font color="white">Reggae</font></div> 
								<input type="radio" name="excludeInstrumental" value="Instrumental" ><font color="white">Instrumental</font></div> <br>
								<input type="radio" name="excludeKaraoke" value="Karaoke" ><font color="white">Karaoke</font></div> 
							</td>
						</tr>																
						</table>
						<input type = "submit" class = "submitPref" value = "Submit" />
						</form>
					<div class="courses pt-20"> 
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