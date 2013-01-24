<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet/less" type="text/css" href="less/menu.less">
		<script src="js/less-1.3.0.min.js" type="text/javascript"></script>
<s:head/>
</head>
<body>
	<h3> </h3>
	
	<p><s:text name="login.item1"/> </p>
	
	<s:form action="identificarAction">
		<s:textfield label="%{getText('form.usuario')}" name="usuario.username" required="required"></s:textfield>
		<s:password key="form.contrasena" name="usuario.password" required="required"></s:password>
		<s:submit value="Login"></s:submit>
	</s:form>
	
	
	<s:actionerror/>
	
</body>
</html>





