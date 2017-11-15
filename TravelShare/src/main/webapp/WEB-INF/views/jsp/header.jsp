<!DOCTYPE html>

<html>
    <head>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/styleHeader.css">
        
     <style type="text/css">
     


.container {
    text-align: center;
    vertical-align: middle;
    background-color: transparent;
}
.nav  {
    color: forestgreen;
    text-decoration-color: fuchsia;
    font-family: 'Indie Flower', cursive;
    font-size: 26px;
/*
    font-family: serif;
    font-size: 16px;
*/
    
    font-style: normal;
    font-weight: 900;
    font-variant-caps: petite-caps;
    font-stretch: expanded;
}

.dropdown-menu {
    font-size: 26px;
    background-color: beige;
}

.dropdown-toggle {
/*
    font-size: 26px;
    background-color: bisque;
*/
}

.title {
    background-color: transparent;
    color: beige;
    font-family: 'Indie Flower', cursive;
    font-size: 40px;
    font-style: oblique;
    font-weight: 900;
    font-variant-caps: petite-caps;
    font-stretch: expanded;
}
#smallText {
    font-size: 40px;
    color: cornsilk;
}
/*Footer*/

.footerContainer {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height:50px;
    background:#ccc;
}

.social {
    list-style-type: none;
}

.about li {
    font-size: 15px;
    display: inline;
    float: left;
    padding: 10px;
    color: dimgray;
    -o-transition: .5s;
    -m-transition: .5s;
    -moz-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s;

}
.social li {
    font-size: 15px;
    display: inline;
    float: right;
    padding: 10px;
    color: dimgray;
    -o-transition: .5s;
    -m-transition: .5s;
    -moz-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s;
}

.social li a:hover {
    color: darkseagreen;
}
     
     </style>
    </head>

        <div class="container-fluid">
            <div class="row">
                <form class="col-xs-12">
                    
                    <ul class="nav nav-pills nav-justified ">
                        <li><h1 class="title">Travel <small id="smallText">Share</small></h1></li>
                        <li class="active"><a href="/TravelShare/home">Home</a></li>
                        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">My Profile<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/TravelShare/myProfile">Settings</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="/TravelShare/myPosts">My Posts</a></li>
                                <li role="presentation" class="divider"></li>
                                 <li><a href="/TravelShare/myFollowers">My Followers</a></li>
                            </ul>      
                        </li>
                        <li><a href="/TravelShare/posts">Latest Posts</a></li>
                        <li><a href="/TravelShare/newPost">New Post</a></li>
                        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories<span class="caret"></span> </a>
                            <ul class="dropdown-menu">
                                <li><a href="/TravelShare/postsByCategoryNature">Nature</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="/TravelShare/postsByCategoryAnimals">Animals</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="/TravelShare/postsByCategoryFood">Food</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="/TravelShare/postsByCategoryPeople">People</a></li>
                               <!--alternative button stylse
                                <input class="btn btn-lg btn-outline-secondary" type="button" aria-pressed="true" value="Nature">
                                <li role="presentation" class="divider"></li>
                                <input class="btn btn-secondary" type="button" aria-pressed="true" value="Animals">
                                <li role="presentation" class="divider"></li>
                                <input class="btn btn-secondary" type="button" aria-pressed="true" value="Food">
                                <li role="presentation" class="divider"></li>
                                <input class="btn btn-secondary" type="button" aria-pressed="true" value="People">-->
                            </ul>                        
                        </li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </form>
            
            </div>
        
        </div>

    
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    </body>

</html>