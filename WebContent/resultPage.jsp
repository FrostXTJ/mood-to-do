<%@page import="general.User"%>
<%@page import="general.Entry"%>
<%@page import="TMDB.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>Results</title>

<!--
			Google Font
			============================================= -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,500,600"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500i"
	rel="stylesheet">

<!--
			CSS
			============================================= -->
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
<link rel="stylesheet" href="css/custom.css">

<style>
#subButton {
			background-color: white;
			color: #39cfca;
			border: 1px solid grey;
			margin-top: 10px;
			border-radius: 10px;
		}
		
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.favButton {
	background-color: white;
	color: #39cfca;
	border: 1px solid grey;
	margin-top: 10px;
	border-radius: 10px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#calculating{
	display: none;
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
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="index.jsp">Home</a></li>
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
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- End Header Area -->
	
	<% 
		ArrayList<Entry> movies = (ArrayList<Entry>)request.getAttribute("movies");
		System.out.println("movie size:" + movies.size());
		String mood = (String) request.getAttribute("mood");
		String type = (String) request.getAttribute("type");
								
	%>


	<!-- Start Banner Area -->
	<section class="banner-area relative">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h4 class="text-white">How do you feel right now?</h4>
					<br /> <br /> <br />
					<form action="MoodPageServlet">
						<input type="hidden" name="type" value="movies">
						<button type="submit" name="mood-btn" value="cheerful"
							data-wow-duration="1s" data-wow-delay=".3s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Cheerful &#128516;
						</button>

						<button type="submit" name="mood-btn" value="excited"
							data-wow-duration="1s" data-wow-delay=".6s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Excited &#128541;
						</button>
						<button type="submit" name="mood-btn" value="romantic"
							data-wow-duration="1s" data-wow-delay=".9s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Romantic
							&#128536;</button>
						<br /> <br />
						<button type="submit" name="mood-btn" value="tense"
							data-wow-duration="1s" data-wow-delay="1.2s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Tense &#128534;</button>
						<button type="submit" name="mood-btn" value="anxious"
							data-wow-duration="1s" data-wow-delay="1.5s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Anxious &#128552;
						</button>
						<button type="submit" name="mood-btn" value="angry"
							data-wow-duration="1s" data-wow-delay="1.8s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Angry &#128545;</button>
						<button type="submit" name="mood-btn" value="lonely"
							data-wow-duration="1s" data-wow-delay="2.1s"
							class="primary-btn transparent mr-10 mb-10 wow fadeInDown"
							style="font-size: 18px; height: 40px;">Lonely &#128546;
						</button>
				</div>
				</div>
			</div>
		</div>
		<div class="rocket-img">
			<img src="img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->

	
	

	<!--Start Result Area -->
	<section class="feature-area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section-title text-center">
						<h1>We give recommendations based on your mood.</h1>
						<%if (type.equals("movies")) { %>
							<p>Here are some movies we recommend for you.</p>
						<%}else{ %>
							<p>Here are some songs we recommend for you.</p>
						<% } %>
						
						</form>
					<div id="favForm">
					<form action="MoodPageServlet">
						<input type="hidden" name="mood-btn" value=<%=mood%>>
						<div id="radio-buttons">
							<input type="radio" name="type" value="movies"> Movies
							<input type="radio" name="type" value="restaurants"> Restaurants
							<input type="radio" name="type" value="music"> Music
						</div>
						<button id="subButton" type="submit">View recommendations for this type!</button>
						<div id="calculating">Calculating...</div>
					</form>
					</div>
				</div>
			</div>
		<div class="feature-inner row">
				<%
					for (int i = 0; i < movies.size(); i++) {
				%>
				<div class="col-lg-4 col-md-6">
					<div class="feature-item">
						<button style="background: none; border: none;" onclick="showMovieModal<%= i %>();">
							<img style='height: 200px'
								src=<%=movies.get(i).getThumbnailPath()%>>
							</img>
						</button>

						<h4><%=movies.get(i).getName()%></h4>
						<div class="wow fadeIn" data-wow-duration="1s"
							data-wow-delay=".1s">
							<p>
								<%=movies.get(i).getDescription()%>
							</p>
							<%
								
								if(session.getAttribute("user") != null){
							%>
							<form action="addFavoriteServlet">
								<input type="hidden" name="link" value=<%=movies.get(i).getID()%>>
								<input type="hidden" name="movies" value=<%=movies%>>
								<input type="hidden" name="user" value=<%=session.getAttribute("user").toString() %>> 
								<input type="hidden" name="type" value=<%=type %>> 
								<button class="favButton" type="submit">Favorite</button>
							</form>
							<% } %>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>	
		</div>
	</section>
	<!-- End Result Area -->

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
				<p class="footer-text m-0 col-lg-8 col-md-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					| This webpage is a template made by <a href="https://colorlib.com"
						target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End Footer Area -->

	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close" onclick() = "">&times;</span>
			<div>
				<table class="book-table" >
					<tr>
						<td valign="top">
							<div id="thumbnail-bloc" style="padding-left: 150px;"></div><br/>
							<div id="fav-button-bloc"></div>
						</td>
						<td valign="top">
							<div id="info-bloc" style="padding-left: 70px; padding-top: 70px;"></div>
						</td>
					</tr>
			</div>
		</div>

	</div>

	<!-- ####################### Start Scroll to Top Area ####################### -->
	<div id="back-top">
		<a title="Go to Top" href="#"></a>
	</div>
	<!-- ####################### End Scroll to Top Area ####################### -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	
	<script>
	function signout() {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "SuedoSignoutServlet", false);
		xhr.send();
	}
	</script>
	
	<script>
		$("#subButton").on("click", function(){
			$("#calculating").fadeIn();
		});
	
		var modal = document.getElementById("myModal");
		var span = document.getElementsByClassName("close")[0];
		
		span.onclick = function() {
			modal.style.display = "none";
		}
		
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		
		<%
			for (int i = 0; i < movies.size(); i++) {
				Movie movie = (Movie)movies.get(i);
				String name = movie.getName();
				String thumbnailPath = movie.getThumbnailPath();
				String description = movie.getDescription();
				String genres = "";
				for (String genre : movie.getGenres()) {
					genres += genre + ", ";  
				}
				genres = genres.substring(0, genres.length() - 2);
				String releaseDate = movie.getReleaseDate();
				float rating = movie.getRating();
		%>	
		function showMovieModal<%= i %>() {
			
			var modal = document.getElementById("myModal");
			
			var thumbnailPath = "<img style='height: 200px' src=<%= thumbnailPath %>><img/>";
			var title = "<h5><%= name %></h5>"
			<%
			
			if(type.equals("movies")){ %>
				var description = "<b>Overview:</b> <%= description %><br />"
			<% } else { %>
				var description = "<b>Artist:</b> <%= description %><br />"
			<% } %>
			var genres = "<b>Genres:</b> <%= genres %><br />"
			<%if(type.equals("movies")){ %>
			var releaseDate = "<b>Release Date:</b> <%= releaseDate %><br />"
			<% } else { %>
				var releaseDate = "<b>Album Title:</b> <%= releaseDate %><br />"
			<% } %>
			<%if(type.equals("movies")){ %>
				var rating = "<b>Rating:</b> <%= rating %><br />"
			<% } %>
		
			//var btn = document.createElement("BUTTON");
			//btn.textContent = "Favorite";
			//btn.classList.add("favButton");
			
			$("#thumbnail-bloc").html(thumbnailPath);
			<% if(type.equals("movies")){ %>
				$("#info-bloc").html(title + description + genres + releaseDate + rating);
				//$("#info-bloc").append(btn);
			<% } else { %>
				$("#info-bloc").html(title + description + genres + releaseDate);
				//$("#info-bloc").append(btn);
			<% } %>
			modal.style.display = 'block';
		}
		<%
			}
		%>
	</script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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