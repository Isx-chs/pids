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
		<h2>Sistemas</h2>
		<li><a href="#"><img src="img/excel.png" width="20" alt="excel"> Exportar a excel</a></li>
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
					<th>Detalle</th>
					<th>Informe</th>
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
						<s:if test="req_etapa_id == 3">
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
						<s:elseif test="req_id_estado == 3">
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
					<td class="center">
						<s:if test="req_etapa_id == 2">
						<s:if test="req_id_estado != 3">
							<s:url action="sistemaDetalle" id="m_sistemaDetalle">
								<s:param name="id_requerimiento">
				 					<s:property value="req_id"/>
				 				</s:param>
							</s:url>
							<s:a href="%{m_sistemaDetalle}"><img src="img/detalle.png" alt="detalle" width="30"/></s:a>
						</s:if>
						</s:if>
					</td>
					<td><img src="img/file2.png" alt="archivo" width="30px"/>
					<ul class="sis-fin">
						<li>
							<a href="sistema.html"><img src="img/aprobar.png" width="20px"/></a>
						</li>
						<li>
							<a href="sistema.html"><img src="img/remove.png" width="20px"/></a></td>
						</li>
					</ul>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</article>