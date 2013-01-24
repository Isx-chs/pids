<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tiles" 
		  uri="http://tiles.apache.org/tags-tiles"%>
		  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<link rel="stylesheet" href="css/reset.css"/>
		<link href='http://fonts.googleapis.com/css?family=Buenard' rel='stylesheet' type='text/css'>
		<link href="css/menu.css"  rel='stylesheet' type='text/css'/>
		<tiles:insertAttribute name="linkyscript"/>	
		<title>DAW I</title>		
	</head>
	<body>
		<div class="contenedor">
			<header id="principal">
				<tiles:insertAttribute name="cabecera"/>	
			</header>
			<section id="menu">
				<tiles:insertAttribute name="menu"/>	
			</section>
			<footer>
				<tiles:insertAttribute name="pie"/>		
			</footer>
		</div>
	</body>
</html>