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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>| People Posts |</title>

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
	transform: scale(1.4);
}

.buttons {
	border-radius: 15px 50px 30px 5px:    
	margin-left: 35px;
	margin-top: 10px;
	/* margin-bottom: 20px; */
	background: transparent;
}

#likeButton1, #likeButton2, #likeButton3, #likeButton4, #likeButton5, #likeButton6  {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 25px;
	width: 25px;
}

#dislikeButton1, #dislikeButton2, #dislikeButton3, #dislikeButton4, #dislikeButton5, #dislikeButton6 {
	align: middle;
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(180deg);
	height: 25px;
	width: 25px;
}

#loveButton1, #loveButton2, #loveButton3, #loveButton4, #loveButton5, #loveButton6  {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 25px;
	width: 25px;
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



</head>
<body>

	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />

		<h1 class="text" style="color: black">
			Hi
			<c:out value="${name}"></c:out>
		</h1>
		<br>
		<h1 class="text" style="color: black">Here are the latest posts from our <c:out value="${category}"></c:out> category</h1>
		<hr class="descriptionBox">

		<center>
			<table style="margin-top: 100px">
				<tr>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle1}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle2}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle3}"></c:out>'</th>
				</tr>
				<tr>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription1}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription2}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription3}"></c:out>'</th>
				</tr>
				<tr>
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
								session.setAttribute("postTitle1", post.getAttachments().get(0).getTitle());
								session.setAttribute("postDescription1", post.getAttachments().get(0).getDescription());
								String imgName = "C:/";
								imgName = imgName.concat(post.getAttachments().get(0).getURL());
								BufferedImage bImage = ImageIO.read(new File(imgName));
								ByteArrayOutputStream baos = new ByteArrayOutputStream();
								ImageIO.write(bImage, "jpg", baos);
								baos.flush();
								byte[] imageInByteArray = baos.toByteArray();
								baos.close();
								String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
					%>
					<td style="padding-right: 150px; padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton1"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton1"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton1"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
								session.setAttribute("postTitle2", post.getAttachments().get(1).getTitle());
								session.setAttribute("postDescription2", post.getAttachments().get(1).getDescription());
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
					<td style="padding-right: 150px; padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton2"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton2"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton2"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
								session.setAttribute("postTitle3", post.getAttachments().get(2).getTitle());
								session.setAttribute("postDescription3", post.getAttachments().get(2).getDescription());
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
					<td style="padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton3"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton3"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton3"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
				</tr>
				<center>
					<table style="margin-top: 100px">
					<tr>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle4}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle5}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle6}"></c:out>'</th>
				</tr>
				<tr>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription4}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription5}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription6}"></c:out>'</th>
				</tr>
						<tr>
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
										session.setAttribute("postTitle4", post.getAttachments().get(3).getTitle());
										session.setAttribute("postDescription4", post.getAttachments().get(3).getDescription());
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
							<td style="padding-right: 150px; padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton4"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton4"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton4"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
										session.setAttribute("postTitle5", post.getAttachments().get(4).getTitle());
										session.setAttribute("postDescription5", post.getAttachments().get(4).getDescription());
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
							<td style="padding-right: 150px; padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton5"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton5"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton5"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(4);
										session.setAttribute("postTitle6", post.getAttachments().get(5).getTitle());
										session.setAttribute("postDescription6", post.getAttachments().get(5).getDescription());
										String imgName = "C:/";
										imgName = imgName.concat(post.getAttachments().get(5).getURL());
										BufferedImage bImage = ImageIO.read(new File(imgName));
										ByteArrayOutputStream baos = new ByteArrayOutputStream();
										ImageIO.write(bImage, "jpg", baos);
										baos.flush();
										byte[] imageInByteArray = baos.toByteArray();
										baos.close();
										String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
							%>
							<td style="padding-bottom: 60px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<div class="buttons">
					<button class="buttons">
						<img id="likeButton6"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="dislikeButton6"
							src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
					</button>
					<button class="buttons">
						<img id="loveButton6"
							src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
					</button>
				</div>
							<div id="numbers"></div><div id="numbers"></div><div id="numbers"></div>
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
						</tr>
					</table>
				</center>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var $emotion1 = $('#likeButton1');
	function addEmotion1(type) {
		$emotion1.replaceWith(type);
	};

	$('#likeButton1').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 100,
			success : function(emotion1) {

				$.each(emotion1, function(i, type) {
					addEmotion1(type)
				})
			}
		})
	});

	var $emotion2 = $('#dislikeButton1');
	function addEmotion2(type) {
		$emotion2.replaceWith(type);
	};

	$('#dislikeButton1').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 77,
			success : function(emotion2) {

				$.each(emotion2, function(i, type) {
					addEmotion2(type)
				})
			}
		})
	});
	var $emotion3 = $('#loveButton1');
	function addEmotion3(type) {
		$emotion3.replaceWith(type);
	};

	$('#loveButton1').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 102,
			success : function(emotion3) {

				$.each(emotion3, function(i, type) {
					addEmotion3(type)
				})
			}
		})
	});

	/*SECOND POST*/

	var $emotion4 = $('#likeButton2');
	function addEmotion4(type) {
		$emotion4.replaceWith(type);
	};

	$('#likeButton2').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 103,
			success : function(emotion4) {

				$.each(emotion4, function(i, type) {
					addEmotion4(type)
				})
			}
		})
	});

	var $emotion5 = $('#dislikeButton2');
	function addEmotion5(type) {
		$emotion5.replaceWith(type);
	};

	$('#dislikeButton2').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 104,
			success : function(emotion5) {

				$.each(emotion5, function(i, type) {
					addEmotion5(type)
				})
			}
		})
	});
	var $emotion6 = $('#loveButton2');
	function addEmotion6(type) {
		$emotion6.replaceWith(type);
	};

	$('#loveButton2').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 105,
			success : function(emotion6) {

				$.each(emotion6, function(i, type) {
					addEmotion6(type)
				})
			}
		})
	});

	/*THIRD POST*/

	var $emotion7 = $('#likeButton3');
	function addEmotion7(type) {
		$emotion7.replaceWith(type);
	};

	$('#likeButton3').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 67,
			success : function(emotion7) {

				$.each(emotion7, function(i, type) {
					addEmotion7(type)
				})
			}
		})
	});

	var $emotion8 = $('#dislikeButton3');
	function addEmotion8(type) {
		$emotion8.replaceWith(type);
	};

	$('#dislikeButton3').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 68,
			success : function(emotion8) {

				$.each(emotion8, function(i, type) {
					addEmotion8(type)
				})
			}
		})
	});
	var $emotion9 = $('#loveButton3');
	function addEmotion9(type) {
		$emotion9.replaceWith(type);
	};

	$('#loveButton3').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 69,
			success : function(emotion9) {

				$.each(emotion9, function(i, type) {
					addEmotion9(type)
				})
			}
		})
	});

	/*FOURTH POST*/

	var $emotion10 = $('#likeButton4');
	function addEmotion10(type) {
		$emotion10.replaceWith(type);
	};

	$('#likeButton4').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 70,
			success : function(emotion10) {

				$.each(emotion10, function(i, type) {
					addEmotion10(type)
				})
			}
		})
	});

	var $emotion11 = $('#dislikeButton4');
	function addEmotion11(type) {
		$emotion11.replaceWith(type);
	};

	$('#dislikeButton4').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 110,
			success : function(emotion11) {

				$.each(emotion11, function(i, type) {
					addEmotion11(type)
				})
			}
		})
	});
	var $emotion12 = $('#loveButton4');
	function addEmotion12(type) {
		$emotion12.replaceWith(type);
	};

	$('#loveButton4').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 111,
			success : function(emotion12) {

				$.each(emotion12, function(i, type) {
					addEmotion12(type)
				})
			}
		})
	});

	/*FIFTH POST*/

	var $emotion13 = $('#likeButton5');
	function addEmotion13(type) {
		$emotion13.replaceWith(type);
	};

	$('#likeButton5').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 112,
			success : function(emotion13) {

				$.each(emotion13, function(i, type) {
					addEmotion13(type)
				})
			}
		})
	});

	var $emotion14 = $('#dislikeButton5');
	function addEmotion14(type) {
		$emotion14.replaceWith(type);
	};

	$('#dislikeButton5').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 113,
			success : function(emotion14) {

				$.each(emotion14, function(i, type) {
					addEmotion14(type)
				})
			}
		})
	});
	var $emotion15 = $('#loveButton5');
	function addEmotion15(type) {
		$emotion15.replaceWith(type);
	};

	$('#loveButton5').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 114,
			success : function(emotion15) {

				$.each(emotion15, function(i, type) {
					addEmotion15(type)
				})
			}
		})
	});

	/*SIXTH POST*/

	var $emotion16 = $('#likeButton6');
	function addEmotion16(type) {
		$emotion16.replaceWith(type);
	};

	$('#likeButton6').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 97,
			success : function(emotion16) {

				$.each(emotion16, function(i, type) {
					addEmotion16(type)
				})
			}
		})
	});

	var $emotion17 = $('#dislikeButton6');
	function addEmotion17(type) {
		$emotion17.replaceWith(type);
	};

	$('#dislikeButton6').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 98,
			success : function(emotion17) {

				$.each(emotion17, function(i, type) {
					addEmotion17(type)
				})
			}
		})
	});
	var $emotion18 = $('#loveButton6');
	function addEmotion18(type) {
		$emotion18.replaceWith(type);
	};

	$('#loveButton6').on('click', function() {
		$.ajax({
			type : 'GET',
			url : '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 99,
			success : function(emotion18) {

				$.each(emotion18, function(i, type) {
					addEmotion18(type)
				})
			}
		})
	});

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
</script>

</html>