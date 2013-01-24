<%@taglib prefix="s" uri="/struts-tags" %>

<ul class="principal">
	<s:iterator value="#session.modulo" var="modu">
		<s:if test="%{#modu.mod_key=='informe'}">
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
		<h2>Informes</h2>
		<li><a href="#"><img src="img/excel.png" width="20" alt="excel"> Exportar a excel</a></li>
	</div>
	<div class="registro">
		<form>
			<ul>
				<li>
					<label><b>Tipo</b></label>
					<select>
						<option>--Seleccione--</option>
						<option>Informe de Conformidad</option>
						<option>Informe de Inconformidad</option>
					</select>
				</li>
				<li>
					<label><b>Codigo:</b></label>
					<s:textfield readonly="true" value="RS%{requerimiento.req_id}"> </s:textfield>
					<s:hidden  value="%{requerimiento.req_id}" name="id_requerimiento"></s:hidden>
				</li>
				<li>
					<label><b>Informe:</b></label>
					<input type="file"/>
						<a href="#">
							<img class="agregar"src="img/aprobar.png" alt="agregar" width="40px"/>
						</a>
				</li>	
				<li>
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
						<thead>
							<tr>
								<th>Codigo</th>
								<th>Nombre</th>								
								<th>Archivo</th>							
								<th>Estado</th>							
								<th>Fecha</th>							
							</tr>
						</thead>
						<tbody>
							<s:iterator value="requerimientos">
							<tr>
								<td>
									<s:url action="obtenerRegistroInforme" id="m_desarrolloRegistro">
										<s:param name="id_requerimiento">
						 					<s:property value="req_id"/>
						 				</s:param>
									</s:url>
									<s:a href="%{m_desarrolloRegistro}">
										RS<s:property value="req_id"/>
									</s:a>
								</td>
								<td class="center"><s:property value="req_titulo"/></td>
								<td class="center"><img src="img/icono_word.png" alt="word" width="30"/></td>
								<td class="center">
									<img src="img/file2.png" width="30px"/>
										<s:if test="req_id_estado == 3">
											<!-- ###### RECHAZADO ######## -->
											<span>
												<s:a cssClass="fancybox" title="rechazo" href="#ero%{req_id}" >
													<img src="img/interrogacion.png" width="30px"alt="word"/>
												</s:a>
											</span>
											<a class="msjtt5"><div class="ero"></div></a>
										</s:if>
										<s:elseif test="req_estado_final == 3">
											<!-- ###### RECHAZADO ######## -->
											<span>
												<s:a cssClass="fancybox" title="rechazo" href="#ero%{req_id}" >
													<img src="img/interrogacion.png" width="30px"alt="word"/>
												</s:a>
											</span>
											<a class="msjtt5"><div class="ero"></div></a>
										</s:elseif>
										<s:elseif test="req_estado_final == 1">
											<a class="msjtt6"><div class="aprob"></div></a>
										</s:elseif>
										<s:else>
											<a class="msjtt4"><div class="pend"></div></a>
										</s:else>						
								</td>
								<td><s:property value="req_fecha"/> </td>
							</tr>
							</s:iterator>
						</tbody>
					</table>
					<div id="actv03" style="width:400px;display: none;">
						Se debe validar la operación agregar requerimiento para la area de ventas... 
					</div>
				</li>
			</ul>
		</form>
	</div>
</article>