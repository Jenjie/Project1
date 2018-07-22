<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trip Planner</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <style>
        tr{
            height:30% ;
        }
        table{
            text-align: left;
        }
        html,body{
            height: 100%;
            padding: 0;
            text-align: center;;
        }

    </style>
</head>
<body>
<!---------table----------------------------->
    <%
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/project" +
                    "?user=root");
            s = connect.createStatement();

            String p_id= request.getParameter("p_id");
            String sql = "SELECT location_name ,area " +
                    "FROM filebt " +
                    "WHERE  f_id = '" + p_id + "' ";
            ResultSet rec = s.executeQuery(sql);
    %>
    <table class="table table-bordered"style=" margin-top: 0">
        <tr class="success">
            <th width="200"> <div align="center">name </div></th>
            <th width="500"> <div align="center">Address </div></th>
        </tr>
        <% while((rec!=null) && (rec.next())) { %>
        <tbody>
        <tr class="success">
            <td><%=rec.getString(1)%></td>
            <td><%=rec.getString(2)%></td>
        </tr>
        </tbody>
        <%}%>
    </table>
<div class="row">
    <div class="col-sm-5" style="margin-bottom:10% ">
        <input type="hidden" id="p_id" name="p_id" value="<%=p_id%>">
        <button type="submit" class="btn btn-default" style="margin-top: 10%;margin-left: 10%; width: 100px;">Plan</button>
    </div>
    <div class="col-sm-5" style="margin-bottom:10%">
        <form action="mapAction" method="post">
            <input type="hidden" id="p_id" name="p_id" value="<%=p_id%>">
        <button type="submit" class="btn btn-success" style="margin-top: 10%; width: 100px">Map</button>
        </form>
    </div>
</div>
    <%
        } catch (SQLException e) {
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
<script type="text/javascript">
    function callmap(p_id) {
        $.ajax({
            type: "POST",
            url: "map.jsp",
            data: {p_id : p_id},
            success: function (result) {
                $("#displaymap").html(result);
            }
        });
    }
</script>
</body>
</html>
