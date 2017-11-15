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
<title>Login/Register Form</title>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/styleLogin.css">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	background-color: transparent;
}

.travelShare {
	color: #000000;
	padding: 10px;
	font-family: 'Indie Flower', cursive;
	font-style: italic;
	font-weight: bold;
	font-variant: small-caps;
	text-align: center;
	text-decoration: blink;
	text-transform: capitalize;
	cursor: move;
	visibility: visible;
	text-shadow: 0px 1px 0px #800000;
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #d6d6d6;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #78c57c;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #94def3;
}

.form .message {
	margin: 15px 0 0;
	color: #ffffff;
	font-size: 18px;
	font-weight: 600;
}

.form .message a {
	color: #ffffff;
	text-decoration: none;
	text-decoration: underline;
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
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

body {
	background: #e1e1e1; /* fallback for old browsers */
	/* background: -webkit-linear-gradient(right, #76b852, #76b852);
  background: -moz-linear-gradient(right,#76b852, #76b852);
  background: -o-linear-gradient(right, #76b852, #76b852);
  background: linear-gradient(to left, #76b852, #76b852);
  font-family: "Roboto", sans-serif;internet
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      */
	background:
		url("https://static.pexels.com/photos/547114/pexels-photo-547114.jpeg")
		/*url("http://sf.co.ua/13/02/wallpaper-948394.jpg")*/  
		
		
		/*url("http://www.stlouisllcattorney.com/wp-content/uploads/2016/07/Fence-post.jpg")*/,
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
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

	<h1 class="travelShare">Welcome To Travel Share</h1>
	<br />

	<c:if test="${sessionScope.errorLogin != null }">
		<h1 class="error">
			<c:out value="${errorLogin}"></c:out>
		</h1>
	</c:if>

<c:if test="${sessionScope.errorRegister != null }">
		<h1 class="error">
			<c:out value="${errorRegister}"></c:out>
		</h1>
	</c:if>
	<div class="login-page">
		<div class="form">
			<!-- Register part -->
			<form class="register-form" action="register" method="post" enctype="multipart/form-data">
				<input id="username" type="text" name="username"placeholder="username" required="required" /> 
				<input id="email" type="email" name="userEmail" placeholder="email address" required="required" /> 
				<input id="password" type="password" name="password" placeholder="password" required="required" /> 
				<input id="conpassword" type="password" name="conpassword"placeholder="confirm password" required="required" /> 
				<input type="text" name="userFirstName" placeholder="first name" required="required" /> 
				<input type="text" name="userLastName" placeholder="last nname" required="required" /> 
				<input type="file" name="picture" placeholder="avatar"/>
				<button type="submit">Create</button>
				<p class="message">
					Already registered? <a href="#">Sign In</a> Forgot Password? <a
						href="resetPassword">Click Here</a>
				</p>
			</form>
			`
			<!-- Login part -->
			<form class="login-form" action="login" method="post"
				required="required">
				<input type="email" placeholder="email" name="userEmail" /> <input
					type="password" placeholder="password" name="password"
					required="required" />
				<button type="submit">login</button>
				<p class="message">
					Not registered? <a href="#"> Create an account</a>
				</p>
			</form>
			<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
		</div>
	</div>

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
	<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '145217476115837',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.10' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
</script>
</body>
</html>