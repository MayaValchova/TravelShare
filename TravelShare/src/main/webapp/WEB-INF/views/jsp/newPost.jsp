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


<!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 -->

<title>create post</title>
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

    body {
  background: url("https://static.pexels.com/photos/625820/pexels-photo-625820.jpeg"), no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
    
.form {
    position: absolute;
    margin-top: 40px;
    border-radius: 25px;
	z-index: 2;
right:70%;
margin-right:50px;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	/*background-color: transparent;*/
	/*   opacity: 0.9;
    filter: alpha(opacity=80);*/
	background-color: lightgray;
	opacity: 0.9;
}

.dropdown {
    border-radius: 50px:
	margin-bottom: 20px;
    background-color: #94def3;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	color: brown;
	background-color: transparent;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: rgb(120, 197, 179);
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus, .dropdown:hover {
	background: #94def3;
}

.postLocation {
	outline-style: groove;
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
}

.postTitle {
	outline-style: groove;
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
}
    .text {
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
    color: black;
    }

    
p {
     font-family: 'Indie Flower', cursive;;
     font-size: 19px;
      margin-bottom: 10px;
      margin-top: 10px;
      font-weight: 600;
 }    
    
    .button {
        border-radius: 25px:
    }

 #map {
        height: 100%;
        width: 40%;
        top: 30%;
        left: 50%;'
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 70%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
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

<jsp:include page="header.jsp" />

<c:if test="${sessionScope.user != null }">
<div class="form">
	<form class="wrap" action="newPost" method="post" enctype="multipart/form-data">
		<div class="dropdownPost">
			<p>Choose a categoty</p>
			<select class="dropdown" name="category">
				<option value="1">Nature</option>
				<option value="2">Animals</option>
				<option value="3">Food</option>
				<option value="4">People</option>
			</select>
		</div>
		<div>
            <p>Post Title</p>
			<div class="postTitle">
				<input class="text" type="text" name="title" placeholder="Title" required="required"/>
			</div>
            <p>Please select a location from the search box above the map</p>
			 <div class="postLocation">
				<input id="location" type="text" name="location" placeholder="Location" required="required"/>
				
			</div> 
			
		</div>
		<div class="textArea">
			<p>So what do you want to share with this post</p>
			<textarea  style="background-color: lightgray" name="description"
				rows="5" cols="20" required="required"></textarea>
		</div>
		<div class="postImage">
			<p>Add your images(s)</p>
			<input type="file" name="picture" multiple required="required" onchange="previewFile()"/>
			<img src="" height="200" alt="Image preview...">
		</div>
		<button class="button" type="submit">Submit post</button>
	</form>
</div>
<input id="pac-input" class="controls" type="text" placeholder="Location" name="location">
    <div id="map"></div>


	<script>
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13,
          mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
       
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
        	var src = document.getElementById("pac-input"),
            dst = document.getElementById("location");
       // src.addEventListener('input', function() {
            dst.value = src.value;
       // });
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
      }

    </script>


<script type="text/javascript">

window.onkeydown = function() {
    var src = document.getElementById("pac-input"),
        dst = document.getElementById("location");
    src.addEventListener('input', function() {
        dst.value = src.value;
    });
};

// jQuery implementation

/* $(function () {
    var $src = $('#three'),
        $dst = $('#four');
    $src.on('input', function () {
        $dst.val($src.val());
    });
}); */

</script>
 <script type="text/javascript">
 function previewFile() {
	    var preview = document.querySelector('img');
	    // The button where the user chooses the local image to display
	    var file = document.querySelector('input[type=file]').files[0];
	    // FileReader instance
	    var reader  = new FileReader();

	    // When the image is loaded we will set it as source of
	    // our img tag
	    reader.onloadend = function () {
	      preview.src = reader.result;
	    }

	    
	    if (file) {
	      // Load image as a base64 encoded URI
	      reader.readAsDataURL(file);
	    } else {
	      preview.src = "";
	    }
	  }
 
 </script>
	
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDn71hrTuEuIOj38M-tZ2tQN6KHIvZmvjU&libraries=places&callback=initAutocomplete"
         async defer></script>
</body>
    <footer class="footer"><jsp:include page="footer.jsp" /></footer>
     </c:if>
	 
    <c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>
</html>