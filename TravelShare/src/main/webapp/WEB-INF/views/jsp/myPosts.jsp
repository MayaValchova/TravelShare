<%@page import="com.travelshare.util.UserException"%>
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
<title>| <c:out value="${name}"></c:out>'s Posts |</title>

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

		<center>
			<table style="margin-top: 100px">
			<%
			Post post = PostDAO.getInstance().getMyPosts((int)session.getAttribute("userID"));
			if (post.getAttachments().size() != 0) {
				%>
				
		<%
			try {
				
		%>
			
			<tr>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle1}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle2}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title <c:out value="${postTitle3}"></c:out>'</th>
				</tr>
				<tr>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription1}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription2}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription3}"></c:out>'</th>
				</tr>
			
				<tr>
					<%
								session.setAttribute("postTitle1", post.getAttachments().get(0).getTitle());
								session.setAttribute("postDescription1", post.getAttachments().get(0).getDescription());
								session.setAttribute("attachmentID1", post.getAttachments().get(0));
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
					<td style="padding-right: 150px; padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button1" />Delete this post</button></form>
							</td>
					<%
						} catch (IOException | NullPointerException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
						try {
								session.setAttribute("postTitle2", post.getAttachments().get(1).getTitle());
								session.setAttribute("postDescription2", post.getAttachments().get(1).getDescription());
								session.setAttribute("attachmentID2", post.getAttachments().get(1));
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
					<td style="padding-right: 150px; padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button2" />Delete this post</button></form>
							
							</td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
						try {
								session.setAttribute("postTitle3", post.getAttachments().get(2).getTitle());
								session.setAttribute("postDescription3", post.getAttachments().get(2).getDescription());
								session.setAttribute("attachmentID3", post.getAttachments().get(2));
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
					<td style="padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button3" />Delete this post</button></form>
							
							</td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
				</tr>
				</table>
				</center>
			<center>
					<table style="margin-top: 100px">
					
					<tr>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle4}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle5}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title <c:out value="${postTitle6}"></c:out>'</th>
				</tr>
				<tr>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription4}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription5}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription6}"></c:out>'</th>
				</tr>				
						<tr>
							<%
								try {
										session.setAttribute("postTitle4", post.getAttachments().get(3).getTitle());
										session.setAttribute("postDescription4", post.getAttachments().get(3).getDescription());
										session.setAttribute("attachmentID4", post.getAttachments().get(3));
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
							<td style="padding-right: 150px; padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button4" />Delete this post</button></form>
							
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
								try {
										session.setAttribute("postTitle5", post.getAttachments().get(4).getTitle());
										session.setAttribute("postDescription5", post.getAttachments().get(4).getDescription());
										session.setAttribute("attachmentID5", post.getAttachments().get(4));
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
							<td style="padding-right: 150px; padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button5" />Delete this post</button></form>						
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
								try {
										session.setAttribute("postTitle6", post.getAttachments().get(5).getTitle());
										session.setAttribute("postDescription6", post.getAttachments().get(5).getDescription());
										session.setAttribute("attachmentID6", post.getAttachments().get(5).getAttachmentID());
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
							<td padding-bottom: 20px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a>
							
							<form name="button4" method="post" action="deletePost">
							<button type="submit" name="button6" />Delete this post</button></form>			
							</td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
						</tr>
						<%
			} else {
		%>	
						<h1 class="text">You have no posts yet. Click on the New Post
			button to get started.</h1>
		<%} %>
					</table>
				</center>
				</header>
				<div class="footer">
					<jsp:include page="footer.jsp" />
				</div>
				<jsp:include page="footer.jsp" />
	</c:if>
	<c:if test="${sessionScope.user == null}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>
</body>
</html>