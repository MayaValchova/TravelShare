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

<!DOCTYPE html>
<html>
<head>
<title>| Posts |</title>


<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
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

body {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	background:
		url("https://static.pexels.com/photos/229014/pexels-photo-229014.jpeg")
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}


.hvr-grow:hover, .hvr-grow:focus, .hvr-grow:active {
	transform: scale(1.2);
}

#image {
	padding: 1px;
	padding-right: 5px;
	height: 350px;
	width: 400px;
	float: left;
	z-index: 1;
}

#description {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	font-weight: 700;
}

.buttons {
	border-radius: 15px 50px 30px 5px:    
	margin-left: 35px;
	margin-top: 10px;
	margin-bottom: 20px;
	background: transparent;
}

#likeButton {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
}

#dislikeButton {
	align: middle;
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(180deg);
	height: 35px;
	width: 35px;
}

#loveButton {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
}

.post {
	border: 1px;
	border-color: aqua;
}

.bottomPosts {
	margin-bottom: 20px;
	margin-top: 70px;
}

#title {
	text-align: center;
	padding-top: 10px;
}

.descriptionBox {
	border: 1px solid;
	border-color: black;
	max-height: 80px;
}

.footerContainer {
	display: inline;
}

#numbers {
	display: inline-table;
	font-size: 20px;
}

.text {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	text-align: center;
	color: black;
}
</style>

<body>

	<c:if test="${sessionScope.user != null }">
		<header>
			<jsp:include page="header.jsp" />
			<!--BODY-->
			<h1 class="text" style="color: black">
				Hi
				<c:out value="${name}"></c:out>
			</h1>
			<br>
			<h1 class="text" style="color: black">Here are the latest user
				posts</h1>
			<hr class="descriptionBox">

			<div class="post">
				<%
					try {
							Post post = PostDAO.getInstance().getLastFivePosts();
							session.setAttribute("postTitle", post.getAttachments().get(0).getTitle());
							session.setAttribute("postDescription", post.getAttachments().get(0).getDescription());
							session.setAttribute("postID1", post.getAttachments().get(0).getPostID());
							///System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(0).getTitle());
							String imgName = "C:/";
							imgName = imgName.concat(post.getAttachments().get(0).getURL());
							System.err.println("!!!!!!!!!!!!!!!!!!!!!PATH URL " + post.getAttachments().get(0).getURL()
									+ " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
							BufferedImage bImage = ImageIO.read(new File(imgName));
							ByteArrayOutputStream baos = new ByteArrayOutputStream();
							ImageIO.write(bImage, "jpg", baos);
							baos.flush();
							byte[] imageInByteArray = baos.toByteArray();
							baos.close();
							String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
				%>
				<a class="hvr-grow" href="TravelShare/home"><img id="image"
					width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<%
					} catch (IOException e) {
							System.out.println("Error: " + e);
						}
				%>
				<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
				</div>
				<br> <br>
				<div class="buttons">
					<button class="buttons">
						<img id="likeButton"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<p id="numbers">543</p>
					<br>
					<button class="buttons">
						<img id="dislikeButton"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<p id="numbers">23</p>
					<br>
					<button class="buttons">
						<img id="loveButton"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
					<p id="numbers">543</p>
				</div>
				<hr class="descriptionBox">
				<div class="bottomPosts">
					<%
						try {
								/* User user = UserDAO.getInstance().getTopUsers();
								session.setAttribute("postUsername", user.getPosts().get(1).getUsername());
								String imgName="C:/";
								imgName = imgName.concat(user.getPosts().get(1).getPictureURL()); */
								Post post = PostDAO.getInstance().getLastFivePosts();
								session.setAttribute("postTitle", post.getAttachments().get(1).getTitle());
								session.setAttribute("postDescription", post.getAttachments().get(1).getDescription());
								session.setAttribute("postID2", post.getAttachments().get(1).getPostID());
								//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(0).getTitle());
								String imgName = "C:/";
								imgName = imgName.concat(post.getAttachments().get(1).getURL());
								BufferedImage bImage = ImageIO.read(new File(imgName));
								ByteArrayOutputStream baos = new ByteArrayOutputStream();
								ImageIO.write(bImage, "jpg", baos);
								baos.flush();
								byte[] imageInByteArray = baos.toByteArray();
								baos.close();
								String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
					%>
					<a class="hvr-grow" href="TravelShare/home"><img id="image"
						width="300" height="300" class="img-responsive"
						src="data:image/jpg;base64, <%=b64%>" /></a>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<h2 class="text" style="color: black">
						Post Title is
						"<c:out value="${postTitle}"></c:out>"
					</h2>
					<h3 style="color: black" id="description">Description</h3>
					<div class="descriptionBox">
						<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
					</div>
					<br> <br>
					<div class="buttons">
						<button class="buttons">
							<img id="likeButton"
								src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
						</button>
						<p id="numbers">543</p>
						<br>
						<button class="buttons">
							<img id="dislikeButton"
								src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
						</button>
						<p id="numbers">23</p>
						<br>
						<button class="buttons">
							<img id="loveButton"
								src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
						</button>
						<p id="numbers">543</p>
					</div>
					<hr class="descriptionBox">
					<div class="bottomPosts">
						<%
							try {
									Post post = PostDAO.getInstance().getLastFivePosts();
									session.setAttribute("postTitle", post.getAttachments().get(2).getTitle());
									session.setAttribute("postDescription", post.getAttachments().get(2).getDescription());
									session.setAttribute("postID3", post.getAttachments().get(2).getPostID());
									//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(0).getTitle());
									String imgName = "C:/";
									imgName = imgName.concat(post.getAttachments().get(2).getURL());
									BufferedImage bImage = ImageIO.read(new File(imgName));
									ByteArrayOutputStream baos = new ByteArrayOutputStream();
									ImageIO.write(bImage, "jpg", baos);
									baos.flush();
									byte[] imageInByteArray = baos.toByteArray();
									baos.close();
									String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
						%>
						<a class="hvr-grow" href="TravelShare/home"><img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
						<%
							} catch (IOException e) {
									System.out.println("Error: " + e);
								}
						%>
						<h2 class="text" style="color: black">
							Post Title is
							"<c:out value="${postTitle}"></c:out>"
						</h2>
						<h3 style="color: black" id="description">Description</h3>
						<div class="descriptionBox">
							<h4 style="color: white"id="description"><c:out value="${postDescription}"></c:out></h4>
						</div>
						<br> <br>
						<div class="buttons">
							<button class="buttons">
								<img id="likeButton"
									src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
							</button>
							<p id="numbers">543</p>
							<br>
							<button class="buttons">
								<img id="dislikeButton"
									src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
							</button>
							<p id="numbers">23</p>
							<br>
							<button class="buttons">
								<img id="loveButton"
									src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
							</button>
							<p id="numbers">543</p>
						</div>
						<hr class="descriptionBox">
						<div class="bottomPosts">
							<%
								try {
										Post post = PostDAO.getInstance().getLastFivePosts();
										session.setAttribute("postTitle", post.getAttachments().get(3).getTitle());
										session.setAttribute("postDescription", post.getAttachments().get(3).getDescription());
										session.setAttribute("postID4", post.getAttachments().get(3).getPostID());
										//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(0).getTitle());
										String imgName = "C:/";
										imgName = imgName.concat(post.getAttachments().get(3).getURL());
										BufferedImage bImage = ImageIO.read(new File(imgName));
										ByteArrayOutputStream baos = new ByteArrayOutputStream();
										ImageIO.write(bImage, "jpg", baos);
										baos.flush();
										byte[] imageInByteArray = baos.toByteArray();
										baos.close();
										String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
							%>
							<a class="hvr-grow" href="TravelShare/home"><img id="image"
								width="300" height="300" class="img-responsive"
								src="data:image/jpg;base64, <%=b64%>" /></a>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							<h2 class="text" style="color: black">
								Post Title is
								"<c:out value="${postTitle}"></c:out>"
							</h2>
							<h3 style="color: black" id="description">Description</h3>
							<div class="descriptionBox">
								<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
							</div>
							<br> <br>
							<div class="buttons">
								<button class="buttons">
									<img id="likeButton"
										src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
								</button>
								<p id="numbers">543</p>
								<br>
								<button class="buttons">
									<img id="dislikeButton"
										src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
								</button>
								<p id="numbers">23</p>
								<br>
								<button class="buttons">
									<img id="loveButton"
										src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
								</button>
								<p id="numbers">543</p>
							</div>
							<hr class="descriptionBox">
							<div class="bottomPosts">
								<%
									try {
											Post post = PostDAO.getInstance().getLastFivePosts();
											session.setAttribute("postTitle", post.getAttachments().get(4).getTitle());
											session.setAttribute("postDescription", post.getAttachments().get(4).getDescription());
											session.setAttribute("postID5", post.getAttachments().get(4).getPostID());
											//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
											String imgName = "C:/";
											imgName = imgName.concat(post.getAttachments().get(4).getURL());
											BufferedImage bImage = ImageIO.read(new File(imgName));
											ByteArrayOutputStream baos = new ByteArrayOutputStream();
											ImageIO.write(bImage, "jpg", baos);
											baos.flush();
											byte[] imageInByteArray = baos.toByteArray();
											baos.close();
											String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
								%>
								<a class="hvr-grow" href="TravelShare/home"><img id="image"
									width="300" height="300" class="img-responsive"
									src="data:image/jpg;base64, <%=b64%>" /></a>
								<%
									} catch (IOException e) {
											System.out.println("Error: " + e);
										}
								%>
								<h2 class="text" style="color: black">
									Post Title is
								"<c:out value="${postTitle}"></c:out>"
								</h2>
								<h3 style="color: black" id="description">Description</h3>
								<div class="descriptionBox">
									<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
								</div>
								<br> <br>
								<div class="buttons">
									<button class="buttons">
										<img id="likeButton"
											src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
									</button>
									<p id="numbers">543</p>
									<br>
									<button class="buttons">
										<img id="dislikeButton"
											src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
									</button>
									<p id="numbers">23</p>
									<br>
									<button class="buttons">
										<img id="loveButton"
											src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
									</button>
									<p id="numbers">543</p>
								</div>
								<hr class="descriptionBox">
							</div>
		</header>
		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</c:if>
	<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>
	
</body>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var $emotionType = 2;
var $orders = $('#numbers');	
function addOrder(order) {
	$orders.replaceWith('<li>emotion ' + order + '</li>');	
};

/* $(function () { */
		
	
	
/* 	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutt',
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
}); */

	$('#likeButton').on('click', function() {
		$.ajax({	
			type: 'GET',
			url: '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 78,
			success: function(orders) {
				
				$.each(orders, function(i, order)  {
					addOrder(order)		
				}) 
			}		
		})		
	});
$('#dislikeButton').on('click', function() {
	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 78,
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
});
$('#loveButton').on('click', function() {
	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 78,
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
});



</script>
</html>