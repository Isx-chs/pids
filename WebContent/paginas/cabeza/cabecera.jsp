<%@page import="model.Area"%>
<%@page import="service.GestionUsuarioBusinessDelegate"%>
<%@page import="service.UsuarioService"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page import="model.Usuario"%>

<%
	 Map ses= ActionContext.getContext().getSession();
     Usuario user = (Usuario)ses.get("usuario");
     UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
     Area area = new Area();
     area = usuarioService.buscarArea(user.getUs_area_id());
 %>
<h1>Sistema SEDW</h1>
<ul>
	<li class="admin">Usuario :  <%=user.getUs_nombre() %> </li>
	<li class="tipo">Cargo: <%=area.getArea_descripcion() %></li>
	<li class="mensaje">Mensajes <div>3</div></li>
</ul>
			