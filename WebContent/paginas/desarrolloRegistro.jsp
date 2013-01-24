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
		<h2>Actividades Asignadas</h2>
	</div>
	<div class="registro">
		<s:form name="actualizar" action="actualizarDetalle">
			<ul>
				<li>
					<label><b>Codigo:</b></label>
					<s:textfield readonly="true" value="CA%{detalleRequerimiento.det_id}"> </s:textfield>
					<s:hidden  value="%{detalleRequerimiento.det_id}" name="id_requerimiento"></s:hidden>
				</li>	
				<li>
					<label><b>Archivo:</b></label>
					<input type="file"/>
						<a href="#" class="submit">
							<img class="agregar"src="img/aprobar.png" alt="agregar" width="40px"/>
						</a>
				</li>	
				<li>
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
						<thead>
							<tr>
								<th>Codigo</th>
								<th>Actividad</th>							
								<th>Descripcion</th>							
							</tr>
						</thead>
						<tbody>
							<s:iterator value="detalleRequermientos">
							<tr>
								<td>
									<s:url action="obtenerRegistro" id="m_desarrolloRegistro">
										<s:param name="id_requerimiento">
						 					<s:property value="det_id"/>
						 				</s:param>
									</s:url>
									<s:a href="%{m_desarrolloRegistro}">
										CA<s:property value="det_id"/>
									</s:a>
								</td>
								<td><s:property value="det_actividad"/></td>
								<td class="center">
									<span>
										<s:a cssClass="fancybox" title="actividad" href="#ero%{det_id}" >
											<img src="img/lupa.png" width="30px"alt="word"/>
										</s:a>
									</span>
									<s:div id="ero%{det_id}" cssStyle="width:400px;display: none;">
										<s:property value="det_descripcion"/>
									</s:div>
								</td>
							</tr>
							</s:iterator>
						</tbody>
					</table>
				</li>
			</ul>
		</s:form>
	</div>					
</article>

<script type="text/javascript">
$(document).ready(function(){
	$(".submit").click(function(){
		document.actualizar.submit();
	});
});
</script>