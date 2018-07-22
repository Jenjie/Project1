<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="en">

<head>
    <title>Travel Guide</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9GssMwF8bMW6iHpUNpLDqUuMX0P85Tmg&libraries=geometry,places">
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="icon" href="Image/travel.png">

    <style>
        #bg {
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
        }
        #bg img {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            min-width: 50%;
            min-height: 50%;
        }
        .col-md-6 {
            background-color: #FFFFFF;
        }
        table,tr,td{
            margin: auto;
        }
        p{
            font-size: 10px;
            color: red;
        }

    </style>
</head>

<body style="padding-top: 50px">
<div id="bg">
    <img src="Image/bg.png" alt="">
</div>
<!-- Navigation -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-wide w3-padding w3-card">
        <a href="index.jsp" class="w3-bar-item w3-button"><b>Travel Guide</b><img src="Image/ICON.png" style="height: 40px"></a>
        <!-- Float links to the right. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="#" class="w3-bar-item w3-button">Welcome <s:property value="%{person.username}"/></a>
            <a target="_blank" href="history.jsp?email=<s:property value="%{person.email}"/>&username=<s:property value="%{person.username}"/>" class="w3-bar-item w3-button">History</a>
        </div>
    </div>
</div>
<!-----container------>
<div class="container">
    <div class="row" >
        <div class="col-lg-3">
            <script type="text/javascript">
                function canSubmit() {
                    return true;
                }
            </script>
        </div>
        <div class="col-md-6" >
            <!-----------Show Loading------------>
            <form  class="form-horizontal" id="formssearch" method="post" action="list" onsubmit="return canSubmit()">
                <h1 style="padding: 30px;"><center>Welcome to :<s:property value="%{person.username}"/></center></h1>
                <input type="hidden" value="<s:property value="%{person.email}"/>" name="person.email" id="email">
                <input type="hidden" value="<s:property value="%{person.username}"/>" name="person.username" id="username">
                <div class="form-group" style="padding: 30px 30px 0 30px">
                    <label ><b>Start Location :</b></label>
                    <div >
                        <input class="form-control " name="req.slocation" id="slocation" type="text" placeholder="Start Place" value="" required>
                        <button class="btn btn-default" type="button" onclick="getLocation()">get location</button>
                        <p>*Please click "get location" for access current location</p>
                        <input type="hidden" value="" name="req.lat" id="lat">
                        <input type="hidden" value="" name="req.lng" id="lng">
                        <input type="hidden" value="" name="req.idplace" id="idplace">
                    </div>
                </div>
                <div class="form-group" style="padding: 0 30px 0 30px">
                    <label><b>Travel Mode :</b></label>
                    <select class="form-control" id="mode" name="req.mode">
                        <option value="driving">driving</option>
                        <option value="walking">walking</option>
                        <option value="bicycling">bicycling</option>
                    </select>
                </div>
                <label style="padding-left:20px "><b>Time Travel :</b></label>
                <div class="form-group row" style="padding-left: 20px">
                    <div class="col-sm-3">
                        <input style="width: auto" type="text" class="form-control" id="hour" name="req.hour" placeholder="hour" value="5">
                        <label for="hour" class="col-form-label">hour</label>
                    </div>
                    <div class="col-sm-3" style="margin: auto">
                        <input style="width: auto" type="text" class="form-control" id="mins" name="req.mins" placeholder="mins" value="00">
                        <label for="mins" class="col-form-label">mins</label>
                    </div>
                </div>

                <label for="stay" class="col-form-label" style="padding-left: 20px"><b>Time stay place (mins) : </b></label>
                <div class="form-group-row">
                    <div class="col-sm-5">
                        <input style="width: auto" type="text" class="form-control" id="stay" name="req.stay" placeholder="time stay" value="90">
                        <label for="mins" class="col-form-label">mins</label>
                    </div>
                </div>
                <br><br>
                <div style="text-align: left; font-size: 18px; padding: 30px">
                    <label><b>Catagories interest</b></label><br>
                    <table>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-01" value="museum">&nbsp;<img src="Image/museums.png">&nbsp;Museums</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-02" value="restaurant">&nbsp;<img src="Image/restaurant.png">&nbsp;Restaurant</label></td>
                        </tr>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-03" value="aquarium">&nbsp;<img src="Image/hotel.png">&nbsp;Aquarium</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-04" value="park">&nbsp; <img src="Image/park.png">&nbsp;Park</label></td>
                        </tr>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-05" value="supermarket">&nbsp;<img src="Image/market.png">&nbsp;Market</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-06" value="store">&nbsp;<img src="Image/store.png">&nbsp;Store</label></td>
                        </tr>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-07" value="zoo">&nbsp;<img src="Image/zoo.png">&nbsp;Zoo</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-08" value="spa">&nbsp;<img src="Image/spa.png">&nbsp;Spa</label></td>
                        </tr>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-09" value="shopping_mall">&nbsp;<img src="Image/mall.png">&nbsp;Shopping Mall</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-10" value="cafe">&nbsp;<img src="Image/coffee.png">&nbsp; Coffee </label></td>
                        </tr>
                        <tr>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-11" value="amusement_park">&nbsp;<img src="Image/park.png">&nbsp;Amusement Park</label></td>
                            <td><label class="checkbox-inline"><input type="checkbox" name="req.types" id="type-12" value="hindu_temple">&nbsp;<img src="Image/temple.png">&nbsp; Temple & Religion</label></td>
                        </tr>
                    </table>
                </div>
                <center><button type="submit" id="myDiv" class="btn btn-info" style="text-align: left ; margin:30px;">Search</button></center>
            </form>
            <div id="loader" style="display:none; text-align: center;">
                <img src="Image/loader.gif" alt="loading data">
            </div>
        </div>
        <div class="col-lg-3"></div>
        <!-- /.col-lg-3 -->
        <script>
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition,PositionError);
                } else {
                    lat.innerHTML = "Geolocation is not supported by this browser.";
                }
            }
            function showPosition(position) {
                var lat = position.coords.latitude ;
                var lng = position.coords.longitude ;
                document.getElementById("lat").value = lat ;
                document.getElementById("lng").value = lng ;
                console.log(lat+""+lng);


                var geocoder = new google.maps.Geocoder();
                var latLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                if (geocoder) {
                    geocoder.geocode({ 'latLng': latLng}, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            console.log(results[0].formatted_address);
                            var x = results[0].formatted_address;
                            var idplace = results[0].place_id;
                            document.getElementById("slocation").value = x ;
                            document.getElementById("idplace").value = idplace ;
                            console.log(x);
                        }
                        else {
                            console.log("Geocoding failed: " + status);
                        }
                    });
                }
            }
            function PositionError(error) {
                console.log(error.message);
            }
        </script>
        <!-------------Loading Image------------------>
        <script>
            $(document).ready(function(){
                var myVar;
                $( "#myDiv" ).click(function() {
                    myFunction(this);
                });
                function myFunction(div) {
                    $("#loader").toggle();
                    $(div).toggle();
                }
            });
        </script>

    </div>
</div>
</body>

</html>
