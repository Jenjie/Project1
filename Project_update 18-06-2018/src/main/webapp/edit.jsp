<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Const" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 02/06/2018
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String p_id = (String) request.getParameter("p_id");
    String username = (String) request.getParameter("username");
    String email = request.getParameter("email");
    String stay = (String) request.getParameter("stay");
    String mode = request.getParameter("mode");
    int staytime = Integer.parseInt(stay);
    List<String> idplace = new ArrayList<>();
    List<String> nameplace = new ArrayList<>();

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
            color: #556B2F;
            font-style: oblique;
            margin-top: 0px;
            font-size: 12px;
            padding-left: 10%;
        }
        a:active {
            background-color: cyan;
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
    <br><br><br><br>
    <div class="row content" >
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <br>
            <form action="result" method="post">
                    <%
                Connection connect = null;
                Statement s = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connect = DriverManager.getConnection(Const.urlConnect);
                    s = connect.createStatement();
                    //query id
                    String sql = "SELECT nameplace,id_place,orderplace,lat,lng " +
                            "FROM travel " +
                            "WHERE  id = '"+ p_id +"' " +
                            "ORDER BY orderplace ASC ";
                    ResultSet rec = s.executeQuery(sql);
                    int i = 0;
                    while((rec!=null) && (rec.next())) {
                        String id = rec.getString("id_place");
                        String name = rec.getString("nameplace");
                        idplace.add(id);
                        nameplace.add(name);
                    }
            %>
                <div class="datagrid">
                    <table style="text-align: center;">
                        <thead><tr style="background-color: #2a6496">
                            <th width="30"> <div align="center"></div></th>
                            <th width="500"> <div align="center">name </div></th>
                            <th width="100"> <div align="center">time stay place (mins) </div></th>
                        </tr></thead>
                        <tbody>
                        <tr style="background-color: #98FB98">
                            <td></td>
                            <td>
                                <%=nameplace.get(0)%>
                                <input type="hidden" id="start" name="param.idplace" value="<%=idplace.get(0)%>">
                            </td>
                            <td>
                                <p style="font-size: 20px"><b>Start</b></p>
                            </td>
                        </tr>
                        <%for (int j=1; j<idplace.size() ;j++) {%>
                        <tr class="alt">
                            <td>
                                <input type="checkbox" id="idplace<%=i%>" name="param.idplace" value="<%=idplace.get(j)%>" checked>
                            </td>
                            <td>
                                <a target="_blank" href="show_data.jsp?username=<%=username%>&email=<%=email%>&idplace=<%=idplace.get(j)%>">
                                <%=nameplace.get(j)%>
                                </a>
                            </td>
                            <td><input type="text" id="stay<%=i%>" name="time<%=idplace.get(j)%>" value="<%=staytime%>" style="width:50px;"></td>
                        </tr>
                        <% i++;
                        }%>
                        </tbody>
                    </table>
                    <p>1.Click name to see detail this place</p>
                    <p>2.Choose name to travel</p>
                    <center><button type="submit" class="btn btn-success">Confirm</button></center><br>
                </div>
                <input type="hidden" name="param.f_id" id="f_id" value="<%=p_id%>">
                <input type="hidden" name="param.mode" id="mode" value="<%=mode%>">
                <input type="hidden" name="i" id="i" value="<%=i%>">
                <input type="hidden" name="username" id="username" value="<%=username%>">
                <input type="hidden" name="email" id="email" value="<%=email%>">
        </div>
        </form>
        <%
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            try {
                if(s!=null){
                    s.close();
                    connect.close();
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        %>
        <div class="col-md-2">
        </div>
    </div>
</div>
</body>
</html>
