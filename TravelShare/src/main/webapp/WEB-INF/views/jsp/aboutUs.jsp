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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</script>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $("p").hide();
    });
});
</script>
</head>
<body>
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
<h2>This is a heading</h2>

<p>This is a paragraph.</p>
<p>This is another paragraph.</p>


<ul id="orders">
	<li>Like</li>
	<li>dislike</li>

</ul>
<button id="btn" value="3">Click</button>


<script type="text/javascript">
var $emotionType = 2;
var $orders = $('#orders');	
function addOrder(order) {
	$orders.replaceWith('<li>emotion ' + order + '</li>');	
}

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

	$('#loveButton').on('click', function() {
		$.ajax({	
			type: 'GET',
			url: '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 84,
			success: function(orders) {
				
				$.each(orders, function(i, order)  {
					addOrder(order)		
				}) 
			}		
		})		
	});



</script>

</body>
</html>
