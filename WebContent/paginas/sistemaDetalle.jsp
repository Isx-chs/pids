<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='sistema'}">
			<li class="selected">
		</s:if>		
		<s:else>
			<li>
		</s:else>
		
			<s:url action="#modu.mod_key" id="#modu.mod_key"></s:url>
			<s:a href="%{#modu.mod_key}"> <s:property value="#modu.mod_nombre" /></s:a>
		</li>
	</s:iterator>
</ul>
<article>
	<div id="cabecera">
		<h2>Detalle del Requerimiento de Sistema</h2>
	</div>
	<div class="detalle">
		<ul>
			<li><b>Código de Solicitud:</b> RS<s:property value="requerimiento.req_id"/></li>
			<li><b>Código de Área:</b> CA<s:property value="requerimiento.req_id_area"/></li>
			<li><b>Nombre de Área:</b> <s:property value="area.area_descripcion"/></li>
			<li><b>Jefe de Área:</b> <s:property value="solicitante.us_nombre"/> , <s:property value="solicitante.us_apellido"/></li>
			<li><b>Nombre del Requerimiento:</b> <s:property value="requerimiento.req_titulo"/></li>
		</ul>
	</div>
	<div class="registro">
		<form action="evaluarDetalle" name="detalleSistema">
			<s:hidden value="%{requerimiento.req_id}" name="requerimiento.req_id" id="requerimiento.req_id"></s:hidden>
			<s:hidden value="" name="requerimiento.req_id_estado" id="req_id_estado"></s:hidden>
			<ul>
				<li>
					<label for="descr"><b>Descripción:</b></label><textarea name="requerimiento.req_obsr" id=requerimiento.req_obsr></textarea>
					<s:actionerror/>
				</li>
				<li>
					<s:a href="#"><img id="1" class="eleccion" src="img/aprobar.png" alt="detalle" width="50px"/></s:a>
					<s:a href="#"><img id="3" class="eleccion" src="img/remove.png" alt="detalle" width="50px"/></s:a>
				</li>
			</ul>
		</form>
	</div>
</article>
<script type="text/javascript">
	$(document).ready(function(){
		$(".eleccion").click(function(){
			var id = $(this).attr("id");
			document.getElementById("req_id_estado").value=id;
			document.forms["detalleSistema"].submit();
			
		});
	});
</script>