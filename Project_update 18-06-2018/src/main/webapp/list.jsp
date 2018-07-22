<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Travel Guide</title>
    <link rel="icon" href="Image/travel.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script type="text/javascript"
            src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> </script>
    <style>
        body,html {
            height: 100%;
            padding: 0;
        }
        h1{
            text-align: center;
            margin: 40px;
            color: #330000;
        }
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
        table{
            margin: auto;
            margin-bottom: 40px;
        }
        tbody {
            border-style: solid;
            border-width: 1px;
        }

        div.pager {
            text-align: left;
            margin: 1em 0 1em 12% ;
            margin-bottom: 30px;
        }

        div.pager span {
            display: inline-block;
            width: 1.8em;
            height: 1.8em;
            line-height: 1.8;
            text-align: center;
            cursor: pointer;
            background: #000;
            color: #fff;
            margin-right: 0.5em;
        }
        div.pager span.active {
            background: #c00;
        }
        p{
            font-size: 12px;
            font-style: oblique;
            color: #556B2F;
        }
    </style>
</head>

<body style="margin-top: 50px">
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
<!------------List--------------->
<div class="container">
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-10" style="background-color: white; margin: 30px 0 30px 0">
            <%
                List<String> id = new ArrayList<>();
                List<String> sumrating = new ArrayList<>();
                List<String> quantity = new ArrayList<>();
                List<String> name = new ArrayList<>();
                List<String> type = new ArrayList<>();

                Connection connect = null;
                Statement s = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connect = DriverManager.getConnection(Const.urlConnect);

                    s = connect.createStatement();
                    Date date = new Date();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");

                    String strDate = dateFormat.format(date);
                    String email = (String) request.getAttribute("person.email");

//                    String email = "secreat.story@gmail.com";
//                    String strDate = "2018-28-17 11:28";

                    String sql = "SELECT id,sumRating,COUNT(id) quantity ,GROUP_CONCAT(DISTINCT nameplace ORDER BY orderplace ASC SEPARATOR '<br> - ') AS place, GROUP_CONCAT(DISTINCT type ORDER BY orderplace ASC SEPARATOR ', ') AS type  " +
                            "FROM travel " +
                            "WHERE user_date = '"+ strDate +"' AND person_email ='"+ email +"' " +
                            "GROUP BY id " +
                            "ORDER BY quantity DESC " ;
                    ResultSet resultSet = s.executeQuery(sql);

                    while((resultSet!=null)&&(resultSet.next())){
                        id.add(resultSet.getString(1));
                        sumrating.add(resultSet.getString(2));
                        quantity.add(resultSet.getString(3));
                        name.add(resultSet.getString(4));
                        type.add(resultSet.getString(5));
                    }
            %>
            <p style="margin: 10% 0 0 0; padding-left: 15%">Click <b>Select</b> for choose list<p>
            <table id="example">
            <%for(int j=0; j<id.size(); j++){%>
                <tbody>
                <tr>
                    <td style="margin: 20px; padding: 20px">
                        <a href="edit.jsp?p_id=<%=id.get(j)%>&email=<s:property value="%{person.email}"/> &username=<s:property value="%{person.username}"/>&stay=<s:property value="%{req.stay}"/>&mode=<s:property value="%{req.mode}"/> ">
                            <button type="button" class="btn btn-info"> SELECT </button>
                        </a>
                        <button type="button" class="btn btn-basic disabled">Rating :<%=sumrating.get(j)%></button>
                        <button type="button" class="btn btn-basic disabled"> <%=type.get(j)%></button>
                        <br>
                        <%=name.get(j)%>
                    </td>
                </tr>
                </tbody>
                <%}%>
            </table>
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
        </div>
        <div class="col-sm-1"></div>
    </div>
</div>
</body>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="jquery/jquery.simplePagination.js"></script>
<script>
    $(function() {
        $("#example").simplePagination({
            previousButtonClass: "btn btn-danger",
            nextButtonClass: "btn btn-danger"
        });
    });
</script>
</html>

