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
	<!-- Meta Description -->S
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Profile</title>

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
.addPreferences{
	color: white;
}
.disabled {
  opacity: 0.6;
  cursor: not-allowed;
  color: white;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 70%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  color:white;
}
</style>
<script>
<%
	//Still need to add a way to get the username either from database or from their session
	String username = "Username";
	String button = "addPreferences";
	String prefChange = "Preferences.jsp";
	String SignUp = username;
	String In_Out = "Log Out";
	String notification = request.getParameter("notification");
	
	String showRFilms = request.getParameter("showRFilms");
	String excludeAction = request.getParameter("excludeAction");
	String excludeAdventure = request.getParameter("excludeAdventure");
	String excludeAnimation = request.getParameter("excludeAnimation");
	String excludeComedy = request.getParameter("excludeComedy");
	String excludeCrime = request.getParameter("excludeCrime");
	String excludeDocumentary = request.getParameter("excludeDocumentary");
	String excludeDrama = request.getParameter("excludeDrama");
	String excludeFamily = request.getParameter("excludeFamily");
	String excludeFantasy = request.getParameter("excludeFantasy");
	String excludeHistory = request.getParameter("excludeHistory");
	String excludeHorror = request.getParameter("excludeHorror");
	String excludeMystery = request.getParameter("excludeMystery");
	String excludeRomance = request.getParameter("excludeRomance");
	String excludeScienceFiction = request.getParameter("excludeScienceFiction");
	String excludeTVMovie = request.getParameter("excludeTVMovie");
	String excludeThriller = request.getParameter("excludeThriller");
	String excludeWar = request.getParameter("excludeWar");
	String excludeWestern = request.getParameter("excludeWestern");
	
	String showExSongs = request.getParameter("showExSongs");
	String excludeBlues = request.getParameter("excludeBlues");
	String excludeSoComedy = request.getParameter("excludeSoComedy");
	String excludeClassic = request.getParameter("excludeClassic");
	String excludeCountry = request.getParameter("excludeCountry");
	String excludeElectronic = request.getParameter("excludeElectronic");
	String excludeHoliday = request.getParameter("excludeHoliday");
	String excludeJazz = request.getParameter("excludeJazz");
	String excludePop = request.getParameter("excludePop");
	String excludeRB_Soul = request.getParameter("excludeR&B/Soul");
	String excludeDance = request.getParameter("excludeDance");
	String excludeHipHop_Rap = request.getParameter("excludeHip-Hop/Rap");
	String excludeAlternative = request.getParameter("excludeAlternative");
	String excludeRock = request.getParameter("excludeRock");
	String excludeReggae = request.getParameter("excludeReggae");
	String excludeInstrumental = request.getParameter("excludeInstrumental");
	String excludeKaraoke = request.getParameter("excludeKaraoke");
																							
	String listofFilmExcludes = "";
	String listofSongExcludes = "";
	if(username == "Guest"){
		button = "disabled";
		notification = "No";
		showRFilms = "No";
		prefChange = "#";
		listofFilmExcludes = "None";
		showExSongs = "No";
		listofSongExcludes = "None";
		SignUp = "Sign Up";
		In_Out = "Log In";
		
	}
	else{
			if(notification == null){
				notification = "No";
			}
			if(showRFilms == null){
				showRFilms = "No";
			}
			if(showExSongs == null){
				showExSongs = "No";
			}
			if(excludeAction == null && excludeAdventure == null && excludeAnimation == null && excludeComedy == null && excludeCrime == null
			&& excludeDocumentary == null
			&& excludeDrama == null
			&& excludeFamily == null
			&& excludeFantasy == null
			&& excludeHistory == null
			&& excludeHorror == null
			&& excludeMystery == null
			&& excludeRomance == null
			&& excludeScienceFiction == null
			&& excludeTVMovie == null
			&& excludeThriller == null
			&& excludeWar == null
			&& excludeWestern == null){
				listofFilmExcludes = "None";
			}
			else{
				if(excludeAction != null){
					listofFilmExcludes += excludeAction;
					if(excludeAdventure != null || excludeAnimation != null || excludeComedy != null || excludeCrime != null
						|| excludeDocumentary != null || excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
						|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
						|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
						listofFilmExcludes += ", ";
					}
				}
				if(excludeAdventure != null){
					listofFilmExcludes += excludeAdventure;
					if(excludeAnimation != null || excludeComedy != null || excludeCrime != null
							|| excludeDocumentary != null || excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeAnimation != null){
					listofFilmExcludes += excludeAnimation;
					if(excludeComedy != null || excludeCrime != null
							|| excludeDocumentary != null || excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}					
				}
				if(excludeComedy != null){
					listofFilmExcludes += excludeComedy;
					if(excludeCrime != null|| excludeDocumentary != null || excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeCrime != null){
					listofFilmExcludes += excludeCrime;
					if(excludeDocumentary != null || excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeDocumentary != null){
					listofFilmExcludes += excludeDocumentary;
					if(excludeDrama != null|| excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeDrama != null){
					listofFilmExcludes += excludeDrama;
					if(excludeFamily != null|| excludeFantasy != null
							|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ",";
						}
				}
				if(excludeFamily != null){
					listofFilmExcludes += excludeFamily;
					if(excludeFantasy != null|| excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeFantasy != null){
					listofFilmExcludes += excludeFantasy;
					if(excludeHistory != null|| excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeHistory != null){
					listofFilmExcludes += excludeHistory;
					if(excludeHorror != null|| excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}	
				if(excludeHorror != null){
					listofFilmExcludes += excludeHorror;
					if(excludeMystery != null|| excludeRomance != null
							|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeMystery != null){
					listofFilmExcludes += excludeMystery;
					if(excludeRomance != null|| excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeRomance != null){
					listofFilmExcludes += excludeRomance;
					if(excludeScienceFiction != null|| excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeScienceFiction != null){
					listofFilmExcludes += excludeScienceFiction;
					if(excludeTVMovie != null||excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeTVMovie != null){
					listofFilmExcludes += excludeTVMovie;
					if(excludeThriller != null|| excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeThriller != null){
					listofFilmExcludes += excludeThriller;
					if(excludeWar != null|| excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeWar != null){
					listofFilmExcludes += excludeWar;
					if(excludeWestern != null){
							listofFilmExcludes += ", ";
						}
				}
				if(excludeWestern != null){
					listofFilmExcludes += excludeWestern;
				}
			}	
			if(excludeBlues == null && excludeSoComedy == null && excludeClassic == null && excludeCountry == null && excludeElectronic == null && excludeHoliday == null
					&& excludeJazz == null && excludePop == null && excludeRB_Soul == null && excludeDance == null && excludeHipHop_Rap == null && excludeAlternative == null
					&& excludeRock == null && excludeReggae == null && excludeInstrumental == null && excludeKaraoke == null){
				listofSongExcludes = "None";
			}
			else{
				if(excludeBlues != null){
					listofSongExcludes += excludeBlues;
					if(excludeSoComedy != null && excludeClassic != null && excludeCountry != null && excludeElectronic != null && excludeHoliday != null
							&& excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeSoComedy != null){
					listofSongExcludes += excludeSoComedy;
					if(excludeClassic != null && excludeCountry != null && excludeElectronic != null && excludeHoliday != null
							&& excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeClassic!= null){
					listofSongExcludes += excludeClassic;
					if(excludeCountry != null && excludeElectronic != null && excludeHoliday != null
							&& excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeCountry!= null){
					listofSongExcludes += excludeCountry;
					if(excludeElectronic != null && excludeHoliday != null
							&& excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeElectronic!= null){
					listofSongExcludes += excludeElectronic;
					if(excludeHoliday != null && excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeHoliday!= null){
					listofSongExcludes += excludeHoliday;
					if(excludeJazz != null && excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeJazz!= null){
					listofSongExcludes += excludeJazz;
					if(excludePop != null && excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ",";
					}
				}
				if(excludePop!= null){
					listofSongExcludes += excludePop;
					if(excludeRB_Soul != null && excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeRB_Soul!= null){
					listofSongExcludes += excludeRB_Soul;
					if(excludeDance != null && excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeDance!= null){
					listofSongExcludes += excludeDance;
					if(excludeHipHop_Rap != null && excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeHipHop_Rap!= null){
					listofSongExcludes += excludeHipHop_Rap;
					if(excludeAlternative != null
							&& excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeAlternative != null){
					listofSongExcludes += excludeAlternative;
					if(excludeRock != null && excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeRock != null){
					listofSongExcludes += excludeRock;
					if(excludeReggae != null && excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeReggae != null){
					listofSongExcludes += excludeReggae;
					if(excludeInstrumental != null && excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeInstrumental != null){
					listofSongExcludes += excludeInstrumental;
					if(excludeKaraoke != null){
						listofSongExcludes += ", ";
					}
				}
				if(excludeKaraoke != null){
					listofSongExcludes += excludeKaraoke;
				}	
			}			
	}
%>	
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
						<li><a href="#"><%=SignUp %></a></li>
						<li><a href="#"><%=In_Out %></a></li>
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
					<h1 class="wow fadeIn" data-wow-duration="4s">Your Profile</h1>
					<h4 class="text-white"></h4> <br>
					<table>
					<tr>
						<th> Username: </th>
						<th ><%=username%> </th>
					</tr>					
					<tr>
						<th> Preferences: </th>
						<th>Notifications on:  <%=notification%><br>Show restricted films:  <%=showRFilms%><br>Exclude film genres:  <%= listofFilmExcludes %><br>Show explicit songs:  <%=showExSongs%><br>Exclude song genres:  <%= listofSongExcludes %> </th>
					</tr>
					</table>
					<br>
					<a href = <%=prefChange %> class = <%= button %>>Change Preferences</a>
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
