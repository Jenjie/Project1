
<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 01/04/2018
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String p_id = (String) request.getParameter("param.f_id");
    String username = (String) request.getParameter("username");
    ArrayList<String> idplace = (ArrayList<String>) request.getAttribute("param.idplace");
    List<String> placeid = new ArrayList<>();
    String time[] = new String[idplace.size()];
    for(int i=1 ;i<idplace.size() ;i++ ){
        time[i] = request.getParameter("time"+idplace.get(i));
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>SUCCESS</p>
<%for(String idlist : idplace){ %>
    <%=idlist%><br>
<%}%>
<br>
<%for(int j=1; j<time.length; j++){ %>
<%=time[j]%><br>
<%}%>
</body>
</html>
