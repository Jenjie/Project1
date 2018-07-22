<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Trip Planner</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/trip-css.css" rel="stylesheet">
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="bootstrap/css/bootstrap.min.css"></script>
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
        .col-md-10 {
            background-color: #FFFFFF;
        }
        #map {
            height: 100%;
            align-content:center;
        }
        /* Optional: Makes the sample page fill the window. */
        html {
            height: 100%;
            margin: 30px;
            padding: 0;
            text-align: center;
        }

        #map {
            height: 500px;
            width: 100%;
            align-content:center;
        }
        list-group{
            size:100px;

        }
        table,th,td {
            border : 1px solid black;
            border-collapse: collapse;
        }
        th,td {
            padding: 5px;
        }
    </style>




</head>

<body style="padding-top: 50px">
<div id="bg">
    <img src="Image/bg.png" alt="">
</div>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Trip Planner</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                <li class="nav-item">
                    <a class="nav-link" href="#">Welcome</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->

<div class="container">

    <div class="row" >

        <div class="col-lg-1">
            <%
                Connection connect = null;
                Statement s = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/project" +
                            "?user=root");
                    s = connect.createStatement();
                    Date date = new Date();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");
                    String strDate = dateFormat.format(date);

                    String sql = "SELECT f_id,Rating,COUNT(Rating) quantity ,GROUP_CONCAT(DISTINCT location_name SEPARATOR ' --> ') AS place " +
                            "FROM filebt " +
                            "WHERE Date_user = '"+ strDate+ "' "  +
                            "GROUP BY f_id,Rating " +
                            "ORDER BY Rating DESC " ;
                    ResultSet resultSet = s.executeQuery(sql);
            %>
        </div>

        <div class="col-md-10" >
            <center><h1 style="margin: 10%">Welcome <s:property value="%{person.username}"/></h1></center>
            <div id="map"></div>
            <script>

                var locations = [
                    ['WAREHOUSE CAFE & RESTAURANT', 13.8194, 100.593599],
                    ['Itzaan Cafe & Bistro อิตสาน คาเฟ่ แอนด์ บิสโทร', 13.830675, 100.56137],
                    ['Teaw Cafe', 13.806491, 100.55785],
                    ['Tank Restaurant & Cafe', 13.8405726, 100.5489608],
                    ['Vietnamese Bowl & VB Cafe', 13.797762, 100.571827],
                    ['Greyhound Cafe', 13.8164687, 100.5613519],
                    ['At Home Cafe Bkk', 13.8209139, 100.5961995],
                    ['Diamond Dust Cafe', 13.8425145, 100.5466326],
                ];
                function initMap() {
                    var mapOptions = {
                        center: {lat: 13.8194, lng: 100.593599},
                        zoom: 15,
                    }

                    var maps = new google.maps.Map(document.getElementById("map"),mapOptions);

                    var marker, i, info;

                    for (i = 0; i < locations.length; i++) {

                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                            map: maps,
                            title: locations[i][0]
                        });
                        info = new google.maps.InfoWindow();
                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                info.setContent(locations[i][0]);
                                info.open(maps, marker);
                            }
                        })(marker, i));

                    }
                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHhsw_-_bGWp7LNTpAwl1EIA83smzGwnc&callback=initMap" async defer></script>
            <div class="list-group" style="text-align:left; margin-bottom: 10%">
                <% while ((resultSet!=null)&&(resultSet.next())) {%>
                <div class="list-group-item">
                    <a href="time_planner.jsp?f_id=<%=resultSet.getString(1)%>&stime=<s:property value="%{req.stime}"/>&etime=<s:property value="%{req.etime}"/> ">
                    <button type="button" class="btn btn-info" style="margin-right:2px">sumRating :<%=resultSet.getString(2)%></button>
                    </a>
                    <button type="button" class="btn btn-default ">quantity :<%=resultSet.getString(3)%></button>
                    <div id="content">
                        <br><b><%=resultSet.getString(4)%></b>
                    </div>
                </div>
                <% } %>
            </div>
            <script src='https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js'></script>
            <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
            <script src="js/pdf.js"></script>
        </div>
        <div class="col-lg-1">
            <%
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            %>
            <script type="text/javascript">
            </script>
            <%
                try {
                    if(s!=null){
                        s.close();
                        connect.close();
                    }
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    //out.println(e.getMessage());
                    e.printStackTrace();
                }
            %>
        </div>
    </div> <!-- /container -->
    <!-- /.col-lg-3 -->
</div>
</body>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script  src="js/index.js"></script>
</html>


