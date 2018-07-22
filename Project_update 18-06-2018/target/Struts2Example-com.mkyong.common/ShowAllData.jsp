<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="model.DatailPlace.Photos" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DatailPlace.Review" %>
<%@ page import="model.DatailPlace.PlaceDetail" %>
<%@ page import="java.net.URL" %>
<%--
  Created by IntelliJ IDEA.
  User: jane
  Date: 06/07/2018
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>See Datail</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="icon" href="Image/travel.png">
</head>
<%
    ArrayList<String> listid = (ArrayList<String>) request.getAttribute("id.idplace");
    String username = (String) request.getParameter("username");
    String email = request.getParameter("email");
    String key = "AIzaSyD10Kvbzi5iBuTuJ3l6EjRtx7JQS886XI4";
    String placeid = "ChIJkW2QhCya4jARcyT8c7AFblk";
    ObjectMapper objectMapper = new ObjectMapper();

    String name = null ;
    String phone_number = null;
    String inter_number = null ;
    String address = null ;
    String website = null;

    PlaceDetail detail = null;
    try {
        for(int j=1 ; j<listid.size() ;j++){
            List<String> openingHours = new ArrayList<>();
            List<Photos> photos = new ArrayList<>();
            List<Review> reviews = new ArrayList<>();

            detail = objectMapper.readValue(new URL("https://maps.googleapis.com/maps/api/place/details/json?placeid="+listid.get(j)+"" +
                    "&fields=name,website,photo,rating,formatted_phone_number,international_phone_number,opening_hours,formatted_address,review" +
                    "&key="+key+" "), PlaceDetail.class);
            name = detail.getResult().getName();
            phone_number = detail.getResult().getFormatted_phone_number();
            inter_number = detail.getResult().getInternational_phone_number();
            address = detail.getResult().getFormatted_address();
            website = detail.getResult().getWebsite();
            for(int i=0 ;i<7 ;i++){
                openingHours.add(detail.getResult().getOpening_hours().getWeekday_text().get(i));
            }
            for(int i=0 ;i<detail.getResult().getReviews().size() ;i++){
                reviews.add(detail.getResult().getReviews().get(i));
            }
            if(detail.getResult().getPhotos().size() >= 8){
                for(int i=0 ;i<8 ;i++){
                    photos.add(detail.getResult().getPhotos().get(i));
                }
            }else {
                for(int i=0 ;i<detail.getResult().getPhotos().size() ;i++){
                    photos.add(detail.getResult().getPhotos().get(i));
                }
            }
%>
<body>
<!-- Navbar (sit on top) -->
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
<!-------Header-------->
<div class="w3-content w3-padding" style="max-width:1564px ;background-color: #FFEFD5;margin-top: 10px">
    <div class="w3-container w3-padding-16" id="projects">
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><%=name%></h3>
    </div>
    <!----Content--->
    <div class="w3-row-padding">
        <%for(Photos photos1 : photos){
            if(photos1.getWidth() > photos1.getHeight()) {%>
        <div class="w3-col l3 m6 w3-margin-bottom">
            <div class="w3-display-container">
                <div class="w3-display-topleft w3-black w3-padding">Image</div>
                <img src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=800&photoreference=<%=photos1.getPhoto_reference()%>
                 &key=AIzaSyD10Kvbzi5iBuTuJ3l6EjRtx7JQS886XI4" alt="House" style="width:99%">
            </div>
        </div>
        <%}%><%}%>
    </div>
    <div class="w3-container w3-padding-10" style="margin-left: 10px" id="about">
        <h3 class="w3-padding-16">Detail</h3>
        <p><b><img src="/Image/address.png"> Address</b> : <%=address%></p>
        <%if(phone_number!=null){ %>
        <p><b><img src="/Image/phone.png"> Phone Number :</b> <%=phone_number%> </p>
        <p><b><img src="/Image/smartphone.png"> International Phone Number :</b> <%=inter_number%></p>
        <%}%>
        <%if(website!=null){ %>
        <p><b><img src="/Image/web.png" width="16px" height="16px"> Website :</b><a target="_blank" href="<%=website%>"><%=website%></a></p>
        <%}%>
        <h3><img src="/Image/open.png"> Open-Close</h3>
        <%for (String open : openingHours){ %>
        <%=open%><br>
        <% } %>
    </div>
</div>
<br>
<%} }catch (Exception e){
    e.printStackTrace();
}
%>
<button style="margin: 40px" type="button" class="btn btn-warning" onclick="goBack()">Back</button>
</body>
</html>
<script>
    function goBack() {
        window.history.back();
    }
</script>

