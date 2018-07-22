<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple markers</title>
    <style>
        #map-canvas {
            height: 100%;
            width: 100%;
            padding: 0px ;
            align-content:center;
        }
        html,body{
            height: 100%;
            margin: 40px;
            padding: 0;
            text-align: center;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script type="text/javascript">
        function initialize() {

 //           var json = [{"lng":"100.5316815","title":"Madame Tussauds Museum BANGKOK","lat":"13.7463917"},{"lng":"100.4915972","title":"Thawornwatthu Building","lat":"13.7543168"}];
            var data = document.getElementById('json').innerHTML ;
            var json = JSON.parse(data)
  //          alert("json:" +json);

            var myLatlng = new google.maps.LatLng(13.8194, 100.593599);
            var mapOptions = {
                zoom : 10,
                center : myLatlng
            }
            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

            for ( var i = 0, length = json.length; i < length; i++) {
                var data = json[i], latLng = new google.maps.LatLng(data.lat,
                    data.lng);

                // Creating a marker and putting it on the map
                var marker = new google.maps.Marker({
                    position : latLng,
                    map : map,
                    title : data.title
                });

                marker.setMap(map);
            }
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body>
<span id="json"><s:property value="%{json.json}"/></span>
<div id="map-canvas"></div>
<div class="row">
    <div class="col-sm-5">
        <button type="button" class="btn btn-default" style="margin-top: 10%; margin-bottom: 10%; width: 200px">Result</button>
    </div>
</div>
</body>
</html>