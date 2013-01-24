<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='proyecto'}">
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
		<h2>Registro</h2>
	</div>
	<div class="detalle">
		<ul>
			<li><b>Código de Solicitud:</b>  RS<s:property value="requerimiento.req_id"/></li>
			<li><b>Código de Área:</b> CA<s:property value="requerimiento.req_id_area"/></li>
			<li><b>Nombre de Área:</b> <s:property value="area.area_descripcion"/></li>
			<li><b>Jefe de Área:</b> <s:property value="solicitante.us_nombre"/> , <s:property value="solicitante.us_apellido"/></li>
			<li><b>Nombre del Requerimiento:</b> <s:property value="requerimiento.req_titulo"/></li>
			<li><b>Descripcion:</b> <s:property value="requerimiento.req_obsr"/></li>
		</ul>
	</div>
	<div class="registro">
		<form action="registrarProyecto">
			<s:hidden value="%{requerimiento.req_id}" name="requerimiento.req_id" id="requerimiento.req_id"></s:hidden>
			<ul>
				<li>
					<label><b>Importancia: </b></label>
					<select name="requerimiento.req_importancia">
						<option value="3">Alta</option>
						<option value="2">Media</option>
						<option value="1">Baja</option>
					</select>
				</li>
				<li>
					<label><b>Prioridad: </b></label>
					<select name="requerimiento.req_prioridad">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3" >3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</li>
				<li>
					<label><b>Responsable de Desarrollo:</b></label>
					<s:select name="requerimiento.req_id_responsable" list="responsables" listKey="us_id" listValue="'RD'+us_id +' / '+us_nombre + ' ' + us_apellido">
						
					</s:select>
				</li>
				<li>
					<label for="descr"><b>Recursos Disponibles:</b></label><textarea name="requerimiento.req_recursos" id="descr"></textarea>
					<s:actionerror/>
				</li>
				<li>
					<input type="image" class="centrado" src="img/aprobar.png" width="60px"/>
				</li>
			</ul>
		</form>
	</div>				
</article>