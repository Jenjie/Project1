<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="util.Const" %><%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 12/07/2018
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String date = request.getParameter("date");
%>
<%
    int j=0;
    List<String> nameplace = new ArrayList<>();
    List<String> id_place = new ArrayList<>();
    List<String> duration = new ArrayList<>();
    List<String> stayplace = new ArrayList<>();
    List<String> placeid = new ArrayList<>();

    Connection connect = null;
    Statement s = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection(Const.urlConnect);

        s = connect.createStatement();

        String sql = "SELECT duration,nameplace,stayplace,placeid " +
                "FROM historytravel " +
                "WHERE id='"+id+"'" +
                "AND email = '"+email+"' " +
                "AND user_date = '"+date+"' " ;
        ResultSet resultSet = s.executeQuery(sql);

        while ((resultSet!=null)&&(resultSet.next())){
            duration.add(resultSet.getString(1));
            nameplace.add(resultSet.getString(2));
            stayplace.add(resultSet.getString(3));
            placeid.add(resultSet.getString(4));
        }
        %>
<html>
<head>
    <title>History</title>
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
            margin: 30px;
        }
        table,th,td {
            border : 1px solid black;
            border-collapse: collapse;
            margin:0 10% 10% 10% ;
            text-align: center;
        }
        th,td {
            padding: 5px;
        }
        p{
            font-style: oblique;
            font-size: 20px;
            color: #DAA520;
            margin: 30px 30px 30px 10%;
        }
        a{
            color: #23272b;
        }
    </style>
</head>
<body style="padding-top: 30px; background-color: #2a6496">
<div id="bg">
    <img src="Image/bg.png" alt="">
</div>
<div class="container-fluid">
    <div class="row content" >
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <p>Plan Date History : <%=date%></p>
        <table style="text-align: center;">
            <tr>
                <th width="500"> <div align="center">name </div></th>
                <th width="200"> <div align="center">time stay place </div></th>
            </tr>
            <tr>
                <td><%=nameplace.get(0)%></td>
                <td><b>Start</b></td>
            </tr>
            <%for (int i =1 ;i<nameplace.size() ;i++){ %>
            <%
                if(j < duration.size()){
            %>
            <tr>
                <td style="border-right: hidden; color: #3366FF	">Travel Time : <%=duration.get(j)%></td>
                <td></td>
            </tr>
            <%}%>
            <tr>
                <td>
                    <a href="show_data.jsp?idplace=<%=placeid.get(i)%>&email=<%=email%>&username=<%=username%>" target="_blank">
                    <%=nameplace.get(i)%>
                </td>
                <td>
                    <%=stayplace.get(i)%> mins
                </td>
            </tr>
            <%i++;%>
            <%}%>
        </table>
    </div>
    <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>
<%
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
%>
<%
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
