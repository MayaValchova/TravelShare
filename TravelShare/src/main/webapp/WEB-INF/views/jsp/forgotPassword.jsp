<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<link rel="stylesheet" href="css/styleLogin.css">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.delete-Account-form {
	width: 360px;
	padding: 2% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: ;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 2px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	background-color: transparent;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	width: 100%;
	border: 0;
	padding: 15px;
    padding-top: 20px;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: red;
}

.form .message {
	margin: 15px 0 0;
	font-size: 18px;
	font-weight: 600;
}


.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

body {
	background:
		url("https://turbinehq.com/wp-content/uploads/2017/03/frog-897420_960_720.jpg")
		no-repeat center center fixed;
	 height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.deleteButton {
background-color: transparent;
    font-size: 18px;
	font-weight: 600;
}

.backButton {
background-color: transparent;
    font-size: 18px;
	font-weight: 900;
}
    .login-form{
      
    }
    
    p{
        padding-top: 10px;
        padding-bottom: 14px;
        font-family: "Roboto", sans-serif;
        font-size: 18px;
	font-weight: 700;
    }

.error {
	color: red;
	font-size: 20px;
	padding: 0px;
	padding-bottom: 0px; 
	font-family : 'Indie Flower', cursive;
	font-style: italic;
	font-weight: bold;
	font-variant: small-caps;
	text-align: center;
	text-decoration: blink;
	text-transform: capitalize;
	cursor: move;
	visibility: visible;
	text-shadow: 0px 1px 0px #800000;
	font-family: 'Indie Flower', cursive;
}

</style>


</head>

<body>

	<div class="delete-Account-form">
		<div class="form">
	<c:if test="${sessionScope.user != null }">

	<form class="login-form" action="deleteAccount" method="post">
		<p>Please enter your email:</p>
		<input id="email" type="email" name="userEmail" placeholder="email address" onkeyup="return sendInfo()" required="required"/> <br/><br/>
		<p>Please enter your password:</p>
		<input id="password" type="password" name="password" placeholder="password" required="required" /><br/> <br/>
		<p>Please confirm your password:</p>
		<input id="conpassword" type="password" name="conpassword" placeholder="confirm password" required="required" /><br/>
		<button class="deleteButton" type="submit">Delete</button>
            </form>
        <form class="login-form" action="myProfile" method="get">
			<button class="backButton" type="submit">Go Back?
		</button>
	</form>
	 </c:if>
	 
     <c:if test="${sessionScope.user == null }">
    	 <jsp:forward page="login.jsp"></jsp:forward>
     </c:if>
     </div>
	</div>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script type="text/javascript">
		$('.message a').click(function() {
			$('form').animate({
				height : "toggle",
				opacity : "toggle"
			}, "slow");
		});
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("conpassword");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
</body>
</html>