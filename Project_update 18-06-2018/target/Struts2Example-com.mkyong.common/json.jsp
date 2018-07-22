<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 03/06/2018
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String p_id = request.getParameter("p_id");
%>
<html>
<head>
    <title>json</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/trip-css.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
            text-align: center;;
        }
    </style>
</head>
<body>
    <%
        ArrayList<JSONObject> MyArrJson = new ArrayList<JSONObject>();
        JSONObject object;
        String  location_name;
        String  lat ;
        String  lng ;
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/project" +
                    "?user=root");
            s = connect.createStatement();

            String sql = "SELECT location_name,lat,lng " +
                    "FROM filebt " +
                    "WHERE f_id = '"+ p_id +"' ";
            ResultSet rec = s.executeQuery(sql);
            while ((rec != null) && (rec.next())) {

                location_name = rec.getString("location_name");
                lat = rec.getString("lat");
                lng = rec.getString("lng");

                object = new JSONObject();
                object.put("title",location_name);
                object.put("lat", lat);
                object.put("lng", lng);
                MyArrJson.add(object);
            }
            JSONArray json = new JSONArray(MyArrJson);
            System.out.println(json);
    %>
    <span id="json"><%=json%></span>
    <% } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            if (connect != null) {
                s.close();
                connect.close();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    %>
    <div id="map-canvas"></div>
</body>
</html>
