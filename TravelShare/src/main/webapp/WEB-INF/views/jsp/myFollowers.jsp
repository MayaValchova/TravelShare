<%@page import="com.travelshare.model.PostDAO"%>
<%@page import="com.travelshare.model.Post"%>
<%@page import="com.travelshare.model.UserDAO"%>
<%@page import="com.travelshare.model.User"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Posts</title>

<style type="text/css">
body {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	background:
		url("https://static.pexels.com/photos/347139/pexels-photo-347139.jpeg")
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.text {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	text-align: center;
	color: black;
}

@import "compass/css3";

.hvr-grow {
	display: inline-block;
	transform: translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	backface-visibility: hidden;
	-moz-osx-font-smoothing: grayscale;
	transition-duration: 0.3s;
	transition-property: transform;
	float: left;
}

.hvr-grow:hover, .hvr-grow:focus, .hvr-grow:active {
	transform: scale(1.2);
}
</style>
<body>

<c:if test="${sessionScope.user != null }">
		

	<header> <jsp:include page="header.jsp" /> </header>
	<h1 class="text">
		Hello
		<c:out value="${username}"></c:out>
	</h1>
	<h1 class="text" style="color: black">yours followers are:</h1>

	<div class="text" style="color: black">


		<%
			try {
				User user = (User) session.getAttribute("user");
				LinkedHashSet<User> followers = UserDAO.getInstance().getFollowers(user);
				String first_name = null;
				String last_name = null;
				if (followers.isEmpty()) {
		%>
		<h1 class="text" style="color: black">You do not have followers
			yet:</h1>
		<%
			}
				if (followers.size() > 0) {

					for (User u : followers) {
						first_name = u.getFirstName();
						last_name = u.getLastName();
						String name = first_name + " " + last_name;
						session.setAttribute("name", name);
		%>
		<h2 style="color: black" id="description">
			<c:out value="${name}"></c:out>
		</h2>
		<%
			}
				}

			} catch (IOException e) {
				System.out.println("OPAAAAAA " + e);
			}
		%>

	</div>



	<div class="footer">
		<jsp:include page="footer.jsp" />
	</div>
	</c:if>
<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>

</body>
</html>