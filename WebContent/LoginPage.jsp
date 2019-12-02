<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<link rel="stylesheet" type="text/css" href="LoginSignupStyle.css">
</head>
<body>
<!-- Main Container -->
<div class="page-container">
	<!-- Main Bloc -->
	<div class="main-bloc">
		<form id="login-form" method="POST" action="SuedoLoginServlet">
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
		<input type="password" class="password-input" id="password-input" name="password-input">
		<div class="submit-bloc">
			<button type="submit" id="submit-button">Sign In</button>
		</div>
		</form>
	</div>
	<!-- Main Bloc END -->
</div>

</body>
</html>