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
		<h2>Planificación de Desarrollo</h2>
		<ul>
			<li>
				<s:url action="desarrolloRegistro" id="m_desarrolloRegistro"></s:url>
				<s:a href="%{m_desarrolloRegistro}">Registrar Pruebas</s:a>
			</li>
			<s:if test="#session.usuario.us_per_id != 1">
				<li><a href="#"><img src="img/excel.png" width="20" alt="excel"> Exportar a excel</a></li>
			</s:if>
		</ul>
	</div>
	<div class="data">
		<s:if test="#session.usuario.us_per_id != 1">				
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Archivo</th>
					<th>Fecha</th>
					<th>Detalle</th>
					<th>Envio a QA</th>
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
						<s:if test="req_etapa_id == 4">
							<s:url action="desarrolloDetalle" id="m_desarrolloDetalle_1">
								<s:param name="id_requerimiento">
				 					<s:property value="req_id"/>
				 				</s:param>
							</s:url>
							<s:a href="%{m_desarrolloDetalle_1}"><img src="img/actividad.png" alt="detalle" width="30"/></s:a>
						</s:if>
					</td>
					<td class="center">
						<s:if test="req_etapa_id >= 5">
							<!-- ###### APROBADO######## -->
							<img src="img/send.png" alt="detalle" width="30"/>
							<a class="msjtt6"><div class="aprob"></div></a>
						</s:if>
						<s:elseif test="req_id_estado == 5">
							<!-- ###### APROBADO######## -->
							<img src="img/send.png" alt="detalle" width="30"/>
							<a class="msjtt6"><div class="aprob"></div></a>
						</s:elseif>	
						<s:elseif test="req_id_estado == 3">
							<!-- ###### RECHAZADO ######## -->
							<img src="img/send.png" alt="detalle" width="30"/>
							<a class="msjtt5"><div class="ero"></div></a>
						</s:elseif>
						<s:elseif test="req_id_estado == 4">
							<!-- ###### EN PROCESO ######## -->
							<img src="img/send.png" alt="detalle" width="30"/>
							<a class="msjtt2"><div class="proc"></div></a>
						</s:elseif>
											
						<s:else>
							<!-- ###### PENDIENTE ######## -->
							<img src="img/send.png" alt="detalle" width="30"/>
							<a class="msjtt4"><div class="pend"></div></a>
						</s:else>
					</td>
				</tr>
			</s:iterator>
			</tbody>
		</table>
		</s:if>
		<s:else>
			Lo sentimos no tiene acceso a esta vista
		</s:else>
		<div id="ero03" style="width:400px;display: none;">
			El requermiento necesita ser mas especificado para ser evaluado
		</div>
	</div>
</article>