<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='calidad'}">
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
		<h2>Planificación de QA</h2>
		<ul>
			<li>
				<s:url action="calidadRegistro" id="m_calidadRegistro"></s:url>
				<s:a href="%{m_calidadRegistro}">Registrar Validaciones</s:a>
			</li>
			<s:if test="#session.usuario.us_per_id != 2">		
			<li><a href="#"><img src="img/excel.png" width="20" alt="excel"> Exportar a excel</a></li>
			</s:if>
		</ul>
	</div>
	<div class="data">
	<s:if test="#session.usuario.us_per_id != 2">		
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Archivo</th>
					<th>Fecha</th>
					<th>Detalle</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator value="requerimientos">
			
			

				<tr>
					<td>RS<s:property value="req_id"/></td>
					<td><s:property value="req_titulo"/></td>
					<td class="center"><img src="img/icono_word.png" alt="word" width="30px"/></td>
					<td class="center"><s:property value="req_fecha"/></td>
					<td class="center">
						<s:if test="req_etapa_id == 5">
							<s:url action="calidadDetalle" id="m_calidadDetalle">
								<s:param name="id_requerimiento">
				 					<s:property value="req_id"/>
				 				</s:param>
							</s:url>
							<s:a href="%{m_calidadDetalle}"><img src="img/actividad.png" alt="detalle" width="30"/></s:a>
							
							<s:elseif test="req_id_estado == 4">
							<!-- ###### EN PROCESO ######## -->
								<a class="msjtt2"><div class="proc"></div></a>
							</s:elseif>
							<s:elseif test="req_id_estado == 3">
							<!-- ###### RECHAZADO ######## -->
								<a class="msjtt5"><div class="ero"></div></a>
							</s:elseif>
						
							<s:else>
							<!-- ###### PENDIENTE ######## -->
								<a class="msjtt4"><div class="pend"></div></a>
							</s:else>
						</s:if>	
						<s:elseif test="req_etapa_id >= 6">
						<!-- ###### APROBADO######## -->
						<a class="msjtt6"><div class="aprob"></div></a>
						</s:elseif>
						<s:elseif test="req_id_estado == 6">
							<!-- ###### APROBADO######## -->
							<a class="msjtt6"><div class="aprob"></div></a>
						</s:elseif>						
					</td>
				</tr>
				
			</s:iterator>
			</tbody>
		</table>
	</s:if>
	<s:else>
		Lo sentimos no tiene acceso a esta vista
	</s:else>
	</div>
</article>