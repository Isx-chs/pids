<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<link rel="stylesheet" href="css/reset.css"/>
		<link href='http://fonts.googleapis.com/css?family=Buenard' rel='stylesheet' type='text/css'>
		<link href="css/menu.css"  rel='stylesheet' type='text/css'/>
		<style type="text/css">
			.errorMessage{
				width: 150px;
				margin-top: 72px;
				margin-left: 140px;
				color: red;
			}
		</style>
		<title>DAW I</title>
	</head>
	<body>
		<div class="contenedor">
			<div id="login">
				<h2><s:text name="login.Bienvenida"/></h2> 
				<s:form method="post" action="loginEmpleado">
					<label>Usuario:</label><input type="text" name="usuario.us_user" required="required"/>
					<label>Contraseña:</label><input type="password" name="usuario.us_pass" required="required"/>
					<s:submit type="submit" value="ENTRAR"/>				
				</s:form>
				
				<s:actionerror/>
			</div>
		</div>
	</body>
</html>