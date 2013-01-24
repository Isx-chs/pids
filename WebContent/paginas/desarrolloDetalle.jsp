<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='desarrollo'}">
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
	<h2>Asignación de Actividades</h2>
</div>
<div class="detalle">
	<ul>
		<li><b>Código de Solicitud:</b>  RS<s:property value="requerimiento.req_id"/></li>
		<li><b>Nombre del Requerimiento:</b> <s:property value="requerimiento.req_titulo"/></li>
		<li><b>Descripcion:</b> <s:property value="requerimiento.req_obsr"/></li>
	</ul>
</div>
<div class="registro">
	<s:form action="guardarDetalle" name="guardarDetalle" cssStyle="margin-left:0px">
	<div class="formulario">
		<ul>
			<li>
				<label><b>Importancia:</b></label><s:if test="requerimiento.req_importancia == 3">Alta</s:if><s:elseif test="requerimiento.req_importancia == 2">Media</s:elseif><s:elseif test="requerimiento.req_importancia == 1">Baja</s:elseif>			
			</li>
			<li>
				<label><b>Prioridad:</b></label><s:property value="requerimiento.req_prioridad"/>
			</li>
			<li>
				<label><b>Responsable de Desarrollo:</b></label>RD<s:property value="responsable.us_id"/> / <s:property value="responsable.us_nombre"/> <s:property value="responsable.us_apellido"/>
			</li>
			<li>
				<label><b>Recursos Disponibles:</b></label><s:property value="requerimiento.req_recursos"/>
			</li>
			<li>
				<label><b>Desarrollador:</b></label>
				<s:select name="detalleRequerimiento.det_encargado" list="desarrolladores" listKey="us_id" listValue="'D'+us_id +' / '+us_nombre + ' ' + us_apellido">
						
				</s:select>
				</li>
				<li>
					<label><b>Actividad:</b></label>
					<input type="text" required="required" name="detalleRequerimiento.det_actividad"/>
						
						<s:submit type="image" cssStyle="margin-left: 20px;position: relative;top: 15px;margin-top: -20px;" src="img/agregar.png" alt="agregar" width="40px"></s:submit>
				</li>
				<li>
					<s:hidden  value="%{requerimiento.req_id}" name="detalleRequerimiento.det_id_req"></s:hidden>
					<label for="from"><b>Inicio:</b></label><input type="text" id="from" required="required" name="detalleRequerimiento.det_fec_ini" readonly="readonly"/>
				</li>	
				<li>
					<label for="to"><b>Fin:</b></label><input type="text"  required="required" id="to" name="detalleRequerimiento.det_fec_fin" readonly="readonly"/>
				</li>			
				<li>
					<label for="descr"><b>Descripcion:</b></label><textarea name="detalleRequerimiento.det_descripcion" id="descr"></textarea>
					<s:actionerror/>
				</li>	
									
				<li>
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
						<thead>
							<tr>
								<th>Codigo Desarrollador</th>
								<th>Nombre</th>
								<th>Codigo Actividad</th>
								<th>Actividad</th>
								<th>Inicio</th>
								<th>Fin</th>
								<th>Archivo</th>
								<th>Eliminar</th>										
							</tr>
						</thead>
						<tbody>
						<s:iterator value="detalleRequermientos">						
							<tr>											
								<td>D<s:property value="det_encargado"/></td>
								<td>renato arrascue</td>
								<td>CA<s:property value="det_id"/></td>
								<td><s:property value="det_actividad"/></td>
								<td><s:property value="det_fec_ini"/></td>
								<td><s:property value="det_fec_fin"/></td>
								<td></td>
								<td class="center"><a href="#"><img src="img/remove.png" width="30"></a></td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
				</li>
				<li>
					<s:url action="desarrollo" id="ir_Desarrollo"></s:url>
					<s:a href="%{ir_Desarrollo}"><img src="img/regresar.png" width="40px"/></s:a>
				</li>
			</ul>
		</div>
		</s:form>
	</div>				
</article>