<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>


<html>
<head>
<title>My Profile</title>
<style type="text/css">

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
   .centered {
  position: fixed;
  top: 50%;
  left: 50%;
  margin-top: -50px;
  margin-left: -100px;
}
a {
	padding-bottom: 5px;

}
 
</style>
</head>
<body>
<c:if test="${sessionScope.user != null }">
	<jsp:include page="header.jsp" />
	<div class="page-wrap">
		<div class="navbar-overlay"></div>
		<div class="l-container centered-box">
			<div class="centered-box__content l-row">
				<center>
				<table style="margin-top: 60px; margin-bottom: 60px">
                <!--AVATAR-->
                <tr>
                <h1>Hello <c:out value="${user.getFirstName()}"></c:out></h1>
                <td>
                <div img class="pull-left avatar-form__img" width="60" height="60">
                 <%
    try{
      String imgName="C:\\Users\\Ivan\\Desktop\\images\\";
      imgName = imgName.concat(session.getAttribute("userID")+"-profile-pic.jpeg");
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
        <img  width="300" height="300"  class="img-responsive" src="data:image/jpg;base64, <%=b64%>"/>                            
        <% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
    </div>
 <td>
				<form class="l-row form" action="uploadPicture" accept-charset="UTF-8"method="post" enctype="multipart/form-data">
                   <button type="submit">Update Avatar</button>
                    <label class="form__label" for="picture"></label>
						<input accept="image/jpg, image/jpeg, image/png"
							type="file" name="picture" value="Add New Avatar" required="required"/>
                    </form>
						</div>
						<div class="avatar-form__img-container">
							<!-- <img class="pull-left avatar-form__img" width="60" height="60"src="https://marketplace.canva.com/MAB6v043Ud8/1/thumbnail/canva-robot-electric-avatar-icon-MAB6v043Ud8.png"
								alt="0160dcc0668dfd402690cd54b9d2a5df?s=200&amp;d=mm"/> -->
						</div>
					</div>
                    </td>
                   
                    <!--FIRST NAME-->
                    <td>
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label class="form__label" for="user_first_name">First
							name</label> <input autofocus="autofocus" required="required"
							maxlength="25" size="25" type="text"
							name="firstName" id="user_first_name" />
                            <button type="submit">Change First Name</button>
                        </form>
					</div>
                    </td>
                    <!--LAST NAME-->
                    <td>
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label class="form__label" for="user_last_name">Last
							name</label> <input autofocus="autofocus" required="required"
							cmaxlength="25" size="25" type="text"
							name="lastName" id="user_last_name" />
                            <button type="submit">Change Last Name</button>
                        </form>
					</div>
                  </td>
                    <!--EMAIL-->
                    <td>
                    <div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label for="email">Email</label> 
                            <input required="required" type="email"
							name="email"/>
                            <button type="submit">Change Email</button>
                        </form>
                    </div>
                    </td>
                    <!--USERRNAME-->
                    <td>
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label for="username">Username</label> <input autofocus="autofocus" required="required" maxlength="25" size="25" type="text" name="username"/>
                            <button type="submit">Change Username</button>
                        </form>
					</div>
                    </td>
				</tr>
				<tr>
				  <!--PASSWORD-->
                    <td>
                    <div class="passwordButton">
				        <form method="get" action="/TravelShare/changePassword">
                            <button style="color:black; position: fixed;top: 65%; left: 50%;" type="submit">Change Password</button>
				        </form>
                        </div>
                    <!--BACK BUTTON-->
                <div class="backButton">
				<form method="get" action="/TravelShare/home">
                    <button style="color: black; position: fixed;top: 75%; left: 50%;" type="submit">Back</button>
				</form>
                    </div>
					</td>
					</tr>
				</table>
				</center>
				<!--DELETE PROFILE-->
				<div class="deleteButton">
				<a style="color: red; position: fixed;top: 70%; left: 50%;" href="/TravelShare/deleteAccount" class="delete" data-confirm="Are you sure to delete this item? HINT if you stay we will send you chocolates!"><button>Delete Profile</button></a>
				</div>
			</div>

	<!--<footer><jsp:include page="footer.jsp" /></footer>-->
   <script>
var deleteLinks = document.querySelectorAll('.delete');

for (var i = 0; i < deleteLinks.length; i++) {
  deleteLinks[i].addEventListener('click', function(event) {
      event.preventDefault();

      var choice = confirm(this.getAttribute('data-confirm'));

      if (choice) {
        window.location.href = this.getAttribute('href');
      }
  });
}
</script>

</c:if>
	 
     <c:if test="${sessionScope.user == null }">
    	 <jsp:forward page="login.jsp"></jsp:forward>
     </c:if>

</body>
</html>