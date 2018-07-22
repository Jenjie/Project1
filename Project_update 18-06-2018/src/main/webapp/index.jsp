<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Travel Guide</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/font-awesome-animation.css" rel="stylesheet" />
    <link href="assets/css/prettyPhoto.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="icon" href="Image/travel.png">
    <meta name="google-signin-client_id" content="1038384716327-thp80a88eobgqmimetd93nkdc9bmg399.apps.googleusercontent.com">
</head>
<body>
<!-- NAV SECTION -->
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-wide w3-padding w3-card">
        <a href="index.jsp" class="w3-bar-item w3-button"><b>Travel Guide</b><img src="Image/ICON.png" style="height: 40px"></a>
        <!-- Float links to the right. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="#welcome" class="w3-bar-item w3-button">Welcome </a>
            <a href="#history" class="w3-bar-item w3-button">History</a>
        </div>
    </div>
</div>
<!--END NAV SECTION -->

<!--HOME SECTION-->
<div id="home-sec">
    <div class="container"  >
        <div class="row text-center">
            <div  class="col-md-12" >
                <span class="head-main" >Trip Planner</span><br>
                <br>
                <br>
                <br>
                <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-green w3-large">Login</button>
                <button onclick="document.getElementById('id02').style.display='block'" class="w3-button w3-blue w3-large" style="margin-left: 30px">How To Use Application</button>
            </div>
        </div>
    </div>
</div>
<!----------------Login------------------>
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:500px">
        <div class="w3-center"><br></div>
        <form class="form-signin" role="form" id="login" action="search" method="post" onclick="canSubmit()" style="padding: 30px">
            <div id="status"></div>
            <center><h1 class="form-signin-heading" style="margin-top: 10%">User Login</h1></center>
            Name : <input type="text" id="name" class="form-control" name="person.username" required autofocus>
            E-mail : <input type="email" id="email" class="form-control" name="person.email" required ><br>
            <br>
            <div id="my-signin2" style="padding-left: 5%"></div>
            <br>
            <center><button type="submit" class="btn btn-default" style="text-align: left; margin-top: 5%; margin-bottom: 5%">Login</button></center>
        </form>
        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <center><button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button></center>
        </div>
    </div>
</div>
<!-------------How to use Modal----------------->
<div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom">
        <section  id="services-sec">
            <div class="container">
                <div id="howtouse" class="col-md-8 col-sm-8 alert-success" style=" text-align: left; margin:0 0 50px 30px">
                    <center><h4>How to use Web Application</h4></center>
                    1.Please Login for use this application, you can login by google account or other email.<br>
                    2.Fill in the details of where you want to travel.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.1. click "get location" for access your current location.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.2. Select your travel mode such as driving walking and  bicycling.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3. Fill time to travel for 1 day such as you want to travel time "7 hour 30 minute" in 1 day.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.4. Select your categories interest such as temple ,shopping ,museum<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.5. Click button "Search" to next page.<br>
                    3.Display recommend your list and click button "select" when to want this list travel.<br>
                    4.You can choose some place you want to travel and fill in the time at this place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1. you can click name place to see detail this place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2. when you choose the place finish,you can click button"Confirm" to next page.<br>
                    5.Display list place and time travel one place to another place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1. Click button"Show Data" for see detail all place to travel.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2. Click button"Confirm and Show on map" to save and show detail in map<br>
                    6 you can see your travel history click "history" on top bar<br><br>
                </div>
            </div>
        </section>
        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <center><button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Cancel</button></center>
        </div>
    </div>
</div>
<!-------------About and How to use-------------------->
<section  id="services-sec1">
    <div class="container">
        <div class="row ">
            <div class="text-center g-pad-bottom">
                <div class="col-md-4 col-sm-4 alert-info">
                    <h4>About</h4>
                    <p>
                        This web application can plan your trip now.<br>
                        We mark route to map.<br>
                        We save history your plan.<br>
                        We have many route to choose.<br>
                        We can Edit place If not want to go.<br>
                        We have detail of place.<br>
                    </p><br><br><br><br><br><br><br>
                </div>
                <div id="howtouse1" class="col-md-8 col-sm-8 alert-success" style=" text-align: left;">
                    <center><h4>How to use Web Application</h4></center>
                    1.Please Login for use this application, you can login by google account or other email.<br>
                    2.Fill in the details of where you want to travel.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.1. click "get location" for access your current location.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.2. Select your travel mode such as driving walking and  bicycling.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3. Fill time to travel for 1 day such as you want to travel time "7 hour 30 minute" in 1 day.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.4. Select your categories interest such as temple ,shopping ,museum<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.5. Click button "Search" to next page.<br>
                    3.Display recommend your list and click button "select" when to want this list travel.<br>
                    4.You can choose some place you want to travel and fill in the time at this place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1. you can click name place to see detail this place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2. when you choose the place finish,you can click button"Confirm" to next page.<br>
                    5.Display list place and time travel one place to another place.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1. Click button"Show Data" for see detail all place to travel.<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2. Click button"Confirm and Show on map" to save and show detail in map<br>
                    6 you can see your travel history click "history" on top bar<br><br>
                </div>
            </div>
        </div>
    </div>
</section>
<!--END HOME SECTION-->

<div id="footer">
</div>
</body>
<script src="assets/plugins/jquery-1.10.2.js"></script>
<script src="assets/plugins/bootstrap.min.js"></script>
<script src="assets/plugins/jquery.isotope.min.js"></script>
<script src="assets/plugins/jquery.prettyPhoto.js"></script>
<script src="assets/js/custom.js"></script>
<!---------Login---------->
<script>
    function onSuccess(googleUser) {
        console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
        console.log('Logged in as: ' + googleUser.getBasicProfile().getEmail());
        var name = googleUser.getBasicProfile().getName();
        var email = googleUser.getBasicProfile().getEmail();
        document.getElementById('name').value = name;
        document.getElementById('email').value = email;

    }
    function onFailure(error) {
        console.log(error);
    }
    function renderButton() {
        gapi.signin2.render('my-signin2', {
            'scope': 'profile email',
            'width': 200,
            'height': 35,
            'longtitle': true,
            'theme': 'dark',
            'onsuccess': onSuccess,
            'onfailure': onFailure
        });
    }
</script>

<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<script type="text/javascript">
    function canSubmit() {
        return true;
    }
</script>
</html>
