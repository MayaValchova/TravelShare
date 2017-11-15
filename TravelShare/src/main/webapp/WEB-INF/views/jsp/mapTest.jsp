<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.travelshare.model.PostDAO"%>
<%@page import="com.travelshare.model.Post"%>
<%@page import="com.travelshare.model.UserDAO"%>
<%@page import="com.travelshare.model.User"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
    <title>fsdfsdfds</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous">


<script type="text/javascript">
function refreshUsername() {
	$("#people").empty();
	var username = $("#username").val();
	$.get("http://localhost:8080/SuperDemo/MediaService?user=" + username,
			function(data) {
	
	for ( var index in data ) {
		var user = data[index];
		var img = document.createElement("img");
		console.log(user.imgName)
		img.src = user.imgName;
		img.style = "float:left,padding-right:10px";
		img.width = 100;
		img.height = 100;
		$("#people").append(img);
		var name = document.createElement("p");
		name.innerHTML = user.name;
		name.style = "padding:5px"
		$("#people").append(name);
		
		var age = document.createElement("p");
		age.innerHTML = user.age;
		age.style = "padding:5px"
		$("#people").append(age);
		
		var city = document.createElement("p");
		city.innerHTML = user.city;
		city.style = "padding:5px"
		$("#people").append(city);
		
		var btn = document.createElement("BUTTON");
		btn.width = 100;
		btn.height = 100;
		btn.name = "choose";
		$("#people").append(btn);
		
		var novRed = document.createElement("p");
		$("#people").append(novRed);
		
		
		
	}

	});
}
</script>

<body>

	<label> Enter username: </label>
	<input type="text" id="username" onkeyup="refreshUsername()" />
	<div id="people"></div>

</body>








    </body>
</html>