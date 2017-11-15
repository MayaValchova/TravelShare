<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>| Error |</title>

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



</head>
<body>

	<c:if test="${sessionScope.user != null }">
	
	 <jsp:include page="header.jsp" />

		<h1 class="text" style="color: black">
			Hi,
			<c:out value="${name}"></c:out>
			We are sorry, something went wrong!
		</h1>

		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>
</c:if>

</body>
</html>