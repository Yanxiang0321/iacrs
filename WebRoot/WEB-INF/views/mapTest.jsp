<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
  <head>
  <title>${system_name}</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 100% }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDM379voz5ETctXTgtNGQL3kHGrMS4vFCU&sensor=true">
    </script>
    <script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(${lastposition.latitude}, ${lastposition.longitude}),
          zoom: 11
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
            
         var marker1 = new google.maps.Marker({
        	map:map,
		    position: new google.maps.LatLng(${lastposition.latitude},${lastposition.longitude}),
		    animation: google.maps.Animation.DROP
		}); 
		
		
		  /* var flightPlanCoordinates = [
		  
		    new google.maps.LatLng(37.772323, -122.214897),
		    new google.maps.LatLng(21.291982, -157.821856),
		    new google.maps.LatLng(-18.142599, 178.431),
		    new google.maps.LatLng(-27.46758, 153.027892)
		  ]; */
		  var lats = new Array();
		  var lons = new Array();
		  var flightPlanCoordinates = [];
		  <c:forEach var="p" items="${positions}">
	        lats.push(${p.latitude});
	        lons.push(${p.longitude});
	        //flightPlanCoordinates.push(google.maps.LatLng(${p.longitude},${p.latitude}));
          </c:forEach>
          
          var i=0;
      	  for (i=0;i<lats.length;i++){
        	var marker = new google.maps.Marker({
        	map:map,
        	position: new google.maps.LatLng(lats[i], lons[i])
		  });
		  flightPlanCoordinates.push(new google.maps.LatLng(lats[i], lons[i]));
          }
          
		  var flightPath = new google.maps.Polyline({
		    path: flightPlanCoordinates,
		    geodesic: true,
		    strokeColor: '#FF0000',
		    strokeOpacity: 1.0,
		    strokeWeight: 2
		  });
		
		  flightPath.setMap(map);
		
		// To add the marker to the map, call setMap();
		
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
    <div id="map-canvas"/>
  </body>
</html>