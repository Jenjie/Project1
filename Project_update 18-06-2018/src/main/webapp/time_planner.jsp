<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 02/06/2018
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Const" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String p_id = (String) request.getParameter("param.f_id");
    String username = (String) request.getParameter("username");
    String email = (String) request.getParameter("email");
    String mode = (String) request.getParameter("param.mode");
    ArrayList<String> list = (ArrayList<String>) request.getAttribute("param.idplace");
    List<String> placeid = new ArrayList<>();
    String time[] = new String[list.size()];
    for(int i=1 ;i<list.size() ;i++ ){
        time[i] = request.getParameter("time"+list.get(i));
    }
%>
<html>
<head>
    <title>Travel Guide</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/trip-css.css" rel="stylesheet">
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="bootstrap/css/bootstrap.min.css"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="bootstrap/css/table.css" rel="stylesheet">
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
            margin-top: 5%;
            background-color: #FFFFFF;
        }
        table,th,td {
            border : 1px solid black;
            border-collapse: collapse;
            margin: 10% 10% 0 10%;
            text-align: center;
            width: auto;
            height: auto;
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

    <div class="row content" >
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <br>
            <div class="datagrid">
                <table style="text-align: center">
                    <thead><tr>
                        <th width="500"> <div align="center">name </div></th>
                        <th width="100"> <div align="center">time stay place </div></th>
                    </tr></thead>
                    <%
                        int i = 0,k=0;
                        List<String> nameplace = new ArrayList<>();
                        List<String> id_place = new ArrayList<>();
                        List<String> duration = new ArrayList<>();
                        for(String idplace : list){
                            Connection connect = null;
                            Statement s = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                connect = DriverManager.getConnection(Const.urlConnect);

                                s = connect.createStatement();
                                //query id
                                String sql = "SELECT nameplace,orderplace,duration,id_place,person_email " +
                                        "FROM travel1 " +
                                        "WHERE id='"+p_id+"' AND id_place='"+idplace+"' " +
                                        "ORDER BY orderplace ASC ";
                                ResultSet rec = s.executeQuery(sql);
                    %>
                    <%while((rec!=null) && (rec.next())) {
                        nameplace.add(rec.getString("nameplace"));
                        id_place.add(rec.getString("id_place"));
                        duration.add(rec.getString("duration"));
                    }%>
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
                        }
                    %>
                    <tbody>
                    <tr style="height:50px; background-color: #98FB98">
                        <td>
                            <%=nameplace.get(0)%>
                        </td>
                        <td> <b>Start</b> </td>
                    </tr>
                    <%for(int j=1 ;j<id_place.size() ;j++){ %>
                    <%
                        if(i < duration.size()){
                    %>
                    <tr style="height:30px ">
                        <td style="border-right: hidden; color: #3366FF	">Travel Time : <%=duration.get(i)%></td>
                        <td></td>
                    </tr>
                    <%}%>
                    <tr class="alt" style="height: 50px">
                        <td>
                            <%=nameplace.get(j)%>
                        </td>
                        <td>
                            <%=time[j]%> mins
                        </td>
                    </tr>
                    <%i++;%>
                    <%} %></tbody>
                </table>
                <p>1.Click <b>Show data</b> to see all datail </p>
                <p>2.Click <b>save & Show on Map</b> to see detail on map</p>
                <div class="row">
                    <div class="col-md-6">
                        <center><form action="showdata" method="post">
                            <%for(String id : list) {%>
                            <input type="hidden" name="id.idplace" value="<%=id%>">
                            <%}%>
                            <input type="hidden" name="id.p_id" id="p_id" value="<%=p_id%>">
                            <input type="hidden" name="username" id="username" value="<%=username%>">
                            <input type="hidden" name="email" id="email" value="<%=email%>">
                            <button type="submit" class="btn btn-default"><b>Show data</b></button>
                        </form></center>
                    </div>

                    <div class="col-md-6">
                        <center><form action="waypoint" method="post">
                            <%for(String id : list) {%>
                            <input type="hidden" name="id.idplace" value="<%=id%>">
                            <input type="hidden" name="id.nameplace" value="<%=nameplace.get(k)%>">
                            <input type="hidden" name="id.time" value="<%=time[k]%>">
                            <%k++; }%>
                            <input type="hidden" name="id.p_id" id="p_id" value="<%=p_id%>">
                            <input type="hidden" name="mode" id="mode" value="<%=mode%>">
                            <input type="hidden" name="username" id="username" value="<%=username%>">
                            <input type="hidden" name="email" id="email" value="<%=email%>">
                            <button type="submit" class="btn btn-warning"><b>Save & Show on map</b></button>
                        </form></center>
                    </div>
                </div>
            </div>
            <br>
            <div class="col-md-2">
            </div>
        </div>
    </div>
    <br>
</div>
</body>
</html>
