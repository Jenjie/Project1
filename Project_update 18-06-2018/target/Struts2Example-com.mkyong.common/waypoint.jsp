<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 03/07/2018
  Time: 00:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<String> list = (ArrayList<String>) request.getAttribute("id.idplace");
    String mode = request.getParameter("mode");
    mode = mode.toUpperCase();
    ArrayList<String> nameplace = (ArrayList<String>) request.getAttribute("id.nameplace");
    String username = (String) request.getParameter("username");
    String email = (String) request.getParameter("email");


%>
<html>
<head>
    <title>Trip planner</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Travel Guide</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="icon" href="Image/travel.png">
    <!-- Custom styles for this template -->
    <link href="css/trip-css.css" rel="stylesheet">
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="bootstrap/css/bootstrap.min.css"></script>
    <link href="bootstrap/css/table.css" rel="stylesheet">
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
        .col-md-8 {

            background-color: #FFFFFF;
        }
        table,th,td {
            border : 1px solid black;
            border-collapse: collapse;
            margin:10% 10% 0 10%;
            text-align: center;
            font-size: 15px;
        }
        th,td {
            padding: 5px;
        }
        p{
            padding: 0% 10% 10% 10%;
            color: #556B2F;
            font-style: oblique;
        }
        #map {
            height: 100%;


            height: 100%;
        }
        #right-panel {
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
            margin-top: 20px;
        }

        #right-panel select, #right-panel input {
            font-size: 15px;
        }

        #right-panel select {
            width: 100%;
        }

        #right-panel i {
            font-size: 12px;
        }
        #right-panel {
            height: 100%;


            overflow: auto;
        }.col-md-3 {
             background-color: #FFFFFF;
         }
    </style>
</head>
<body style="padding-top: 30px">
<!-- Navigation -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-wide w3-padding w3-card">
        <a href="index.jsp" class="w3-bar-item w3-button"><b>Travel Guide</b><img src="Image/ICON.png" style="height: 40px"></a>
        <!-- Float links to the right. Hide them on small screens -->
        <div class="w3-right w3-hide-small">
            <a href="#" class="w3-bar-item w3-button">Welcome <%=username%></a>
            <a target="_blank" href="history.jsp?email=<%=email%>&username=<%=username%>" class="w3-bar-item w3-button">History</a>
        </div>
    </div>
</div>
<div id="bg">
    <img src="Image/bg.png" alt="">
</div>
<div class="container-fluid">
    <br><br>
    <div class="row content" >
        <div class="col-md-9">
            <input type="hidden" id="mode" name="mode" value="<%=mode%>">
            <input type="hidden" id="start" name="start" value="<%=list.get(0)%>">
            <%for(int i=1; i<list.size()-1; i++) { %>
            <input type="hidden" id="waypoints<%=i%>" class="waypoints" value="<%=list.get(i)%>">
            <%}%>
            <input type="hidden" id="end" name="end" value="<%=list.get(list.size()-1)%>">
            <br>
            <input type="hidden" id="nameplace" class="nameplace" value="Start">
            <%for(int i=1; i<nameplace.size(); i++) { %>
            <input type="hidden" id="nameplace<%=i%>" class="nameplace" value="<%=nameplace.get(i)%>">
            <%}%>
            <div id="map"></div>
        </div>


        <div class="col-md-3">
            <div id="right-panel">
                <div id="info"></div>
                <div id="waypoints" ></div>
                <div id="directions-panel"></div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        var map;
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: {lat: 41.85, lng: -87.65}
            });
            directionsDisplay.setMap(map);
            calculateAndDisplayRoute(directionsService, directionsDisplay);
        }
        function geocodePlaceId(placeId) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode(placeId, function(results, status) {
                if (status === 'OK') {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                    document.getElementById('info').innerHTML += "placeId:"+placeId.placeId+" "+results[0].geometry.location+"<br>";
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value ;
            var inputs = document.getElementsByClassName('waypoints');
            var mode = document.getElementById('mode').value ;
            var name = document.getElementsByClassName('nameplace');
            var waypts = [];

            for (var i = 0; i < inputs.length; i++) {
                waypts.push({
                    location:{placeId: inputs[i].value} ,
                    stopover: true
                });
                console.log(waypts);
            }

            directionsService.route({
                origin: {placeId: start},
                destination: {placeId: end},
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: mode
            }, function(response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    var summaryPanel = document.getElementById('directions-panel');
                    var position = "ABCDEFGHIJKLMNOP"

                    summaryPanel.innerHTML = '';
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        summaryPanel.innerHTML += '<span style="background-color: #0000ee">';
                        summaryPanel.innerHTML += '<span style="color:#e04050"><b>Route Segment: ' + routeSegment +
                            '</b></span><br>';
                        summaryPanel.innerHTML += '<b>' + position[i]+' : ';
                        summaryPanel.innerHTML += '<b>' +name[i].value+' <br>';
                        summaryPanel.innerHTML += '<b>Address :</b>'+route.legs[i].start_address + '<br> ';
                        summaryPanel.innerHTML += '<span style="color: #00b0ef">Distance '+route.legs[i].distance.text + ' , </span> ';
                        summaryPanel.innerHTML += '<span style="color: #00b0ef">Duration '+route.legs[i].duration.text + '</span><br>';
                        summaryPanel.innerHTML += '<b>' + position[routeSegment]+' : ';
                        summaryPanel.innerHTML += '<b>' +name[routeSegment].value+' <br>';
                        summaryPanel.innerHTML += '<b>Address :</b>'+route.legs[i].end_address + '<br><br><hr>';
                    }
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }
    </script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlRFoNxssW_DU4KLwhDFAuDf7UgbnrQM&callback=initMap">
    </script>
</body>
</html>
