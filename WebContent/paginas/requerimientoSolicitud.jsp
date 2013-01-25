<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%> 
<sx:head debug="true" cache="false" compressed="false" />

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
		<h2>Enviar Requerimiento</h2>
	</div>
	<div class="registro">
		<form method="post" action="insertar" id="selectForm">
		<s:url id="detailUrl" action="cargarCombo"/>
			<ul>
				<li>
					<label><b>Titulo de Requerimiento: </b></label><input type="text" required="required" name="requerimiento.req_titulo"/>
				</li>
				<li>
					<label><b>Sistema: </b></label>
					<sx:autocompleter name="requerimiento.req_sistema" list="sistemas" value="" 
						notifyTopics="changed" forceValidOption="true" id="sistema"/>
				</li>
				<li>
					<label><b>Modulo: </b></label>
					<sx:autocompleter href="%{#detailUrl}" formId="selectForm"
					listenTopics="changed" id="modu" name="requerimiento.req_modulo"/>
				</li>
				<li>
					<label><b>Archivo :</b></label><s:file name="requerimiento.req_obsr" />
				</li>
				<li>
					<s:submit src="img/send.png" type="image" value="ENTRAR"/>
				</li>
			</ul>
		</form>
	</div>
</article>