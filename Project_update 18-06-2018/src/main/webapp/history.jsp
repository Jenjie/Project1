<%@ page import="java.sql.*" %>
<%@ page import="util.Const" %>
<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 12/07/2018
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String username = request.getParameter("username");

%>
<%
    Connection connect = null;
    Statement s = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection(Const.urlConnect);

        s = connect.createStatement();
            String sql = "SELECT id,email,COUNT(id) cid,user_date " +
                    "FROM historytravel " +
                    "WHERE email ='"+ email +"' " +
                    "GROUP BY id " +
                    "ORDER BY user_date DESC ";
            ResultSet resultSet = s.executeQuery(sql);
%>
<html>
<head>
    <title>History</title>
    <link rel="icon" href="Image/travel.png">
    <style>
        table {
            width: 40em;
            margin: 2em auto;
            background-color: white;
            font-size: 18px;
        }
        thead {
            background: #000;
            color: #fff;
            font-size: 20px;
        }

        td {
            width: 10em;
            padding: 0.3em;
            text-align: center;
            font-size: 18px;
        }

        tbody {
            background: #ccc;
        }
        a{
            color: #c69500;
        }

    </style>
</head>
<body>
<table>
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Email</th>
        <th scope="col">Plan Date</th>
    </tr>
    </thead>
    <%if(resultSet!=null){ %>
    <%while((resultSet!=null) && (resultSet.next())) { %>
    <tbody>
    <tr>
        <td>
            <a target="_blank" href="ShowHistory.jsp?id=<%=resultSet.getString(1)%>&email=<%=resultSet.getString(2)%>&date=<%=resultSet.getString(4)%>&username=<%=username%>">
                <%=resultSet.getString(1)%>
            </a>
        </td>
        <td><%=resultSet.getString(2)%></td>
        <td><%=resultSet.getString(4)%></td>
    </tr>
    </tbody>
    <%}%>
    <%}else { %>
    <h4 style="text-align: center">your account don't have history travel</h4>
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
</body>
</html>
