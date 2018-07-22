<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta name="google-site-verification" content="dk7W2ZKlZVUOWWAnNRgt79uwnUCn6-l2pjtDBfMZm9E" />
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
            <br><br>
            <p style="color: red; font-size: 12px">Please login here if don't have account gmail !!</p>
            Name : <input type="text" id="inputFullname" class="form-control" name="person.username" required autofocus>
            E-mail : <input type="email" id="inputEmail" class="form-control" name="person.email" required ><br>
            <p style="font-size: 12px; color: #0000ee">login with google. Click</p>
            <button  class="g-signin "
                     data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
                     data-requestvisibleactions="http://schemas.google.com/AddActivity"
                     data-clientId="1038384716327-5f00ne49c2gusautapltl6g9fn1o8uhr.apps.googleusercontent.com"
                     data-accesstype="offline"
                     data-callback="mycoddeSignIn"
                     data-theme="dark"
                     data-cookiepolicy="single_host_origin">
            </button>
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
<script type="text/javascript">
    var gpclass = (function(){
        //Defining Class Variables here
        var response = undefined;
        return {
            mycoddeSignIn:function(response){
                // The user is signed in
                if (response['access_token']) {
                    //Get User Info from Google Plus API
                    gapi.client.load('plus','v1',this.getUserInformation);

                } else if (response['error']) {
                }
            },
            getUserInformation: function(){
                var request = gapi.client.plus.people.get( {'userId' : 'me'} );
                request.execute( function(profile) {
                    var email = profile['emails'].filter(function(v) {
                        return v.type === 'account'; // Filter out the primary email
                    })[0].value;
                    var fName = profile.displayName;
                    $("#inputFullname").val(fName);
                    $("#inputEmail").val(email);
                });
            }
        }; //End of Return
    })();

    function mycoddeSignIn(gpSignInResponse){
        gpclass.mycoddeSignIn(gpSignInResponse);
    }
</script>
<script type="text/javascript">
    (function() {
        var po = document.createElement('script');
        po.type = 'text/javascript'; po.async = true;
        po.src = 'https://plus.google.com/js/client:plusone.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(po, s);
    })();

</script>
<script type="text/javascript">
    function canSubmit() {
        return true;
    }
</script>
</html>
