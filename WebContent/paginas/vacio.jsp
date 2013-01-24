<%@page import="java.util.ArrayList"%>
<%@page import="model.Modulos"%>
<%@page import="java.util.List"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<li>
			<s:url action="#modu.mod_key" id="#modu.mod_key"></s:url>
			<s:a href="%{#modu.mod_key}"> <s:property value="#modu.mod_nombre" /></s:a>
		</li>
	</s:iterator>
	
</ul>
<article>
	<div id="cabecera">
		<h2>Bienvenido al Sistema SEDW</h2>
	</div>
	<div class="data">
		No ha seleccionado ningún modulo
	</div>
</article>