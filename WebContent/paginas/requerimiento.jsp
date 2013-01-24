<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='requerimiento'}">
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
		<h2>Búsqueda de Requerimientos</h2>
		<ul>
			<li>
				<s:url action="requerimientoSolicitud" id="r_Envio"></s:url>
				<s:a href="%{r_Envio}">Envio </s:a>
			</li>
			<li>
			<s:url action="requerimientoReporte" id="r_DetalleReporte"></s:url>
			<s:a href="%{r_DetalleReporte}">
			Visualizar Reporte
			 <img src="img/Estadisticas.png" width="20" alt="excel"> 
			 </s:a>
			 </li>
		</ul>
	</div>
	<div class="data">
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Archivo</th>
					<th>Fecha</th>
					<th>Estado</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="requerimientos">
				<tr>
					<td>RS<s:property value="req_id"/></td>
					<td><s:property value="req_titulo"/></td>
					
					<td class="center">
					
					
					<a href="javascript:location.href='Doc/RS<s:property value="req_id" />.docx'"> '
					
					
					<img src="img/icono_word.png" alt="word" width="30px"/></a>
					
					
					</td>
					<td class="center"><s:property value="req_fecha"/></td>
					<td class="center">
						<s:if test="req_estado_final == 1">
							Aprobado
						</s:if>
						<s:elseif test="req_estado_final == 3">
							Desaprobado
							<span>
								<s:a cssClass="fancybox" title="rechazo" href="#ero%{req_id}" >
									<img src="img/interrogacion.png" width="30px"alt="word"/>
								</s:a>
							</span>
							<s:div id="ero%{req_id}" cssStyle="width:400px;display: none;">
								<s:property value="req_obsr"/>
							</s:div>
						</s:elseif>
						<s:else>
							Pendiente
						</s:else>
					</td>
									
									
				</tr>
				</s:iterator>
				
			</tbody>
		</table>
		
	</div>
</article>


