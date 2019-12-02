<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
	<link rel="stylesheet" type="text/css" href="NavBarStyle.css">
	<link rel="stylesheet" type="text/css" href="LoginSignupStyle.css">
</head>
<body>
<!-- Main Container -->
<div class="page-container">
	<!-- Main Bloc -->
	<div class="main-bloc">
		<form id="signup-form" method="POST" action="SuedoSignupServlet">
<%
	String errMsg = (String)request.getAttribute("errorMessage");
	if (errMsg != null && errMsg != "") {
%>
	<div class="error-message"><b><%= errMsg %></b></div>
<%
	}
%>
		<div class="username-text">Username</div>
		<input id="username-input" name="username-input">
		<div class="password-text">Password</div>
		<input type="password" class="password-input" id="password-input-1" name="password-input-1">
		<div class="password-text">Confirm Password</div>
		<input type="password" class="password-input" id="password-input-2" name="password-input-2"><br />
				<div class="submit-bloc">
			<button type="submit" id="submit-button">Register</button>
		</div>
		</form>
	</div>
	<!-- Main Bloc END -->
</div>

</body>
</html>