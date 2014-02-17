
<%@ page import="com.fiuba.GrupoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupoCurso.label', default: 'GrupoCurso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grupoCurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="mediador" controller="curso" params="['cursoId': params.cursoId]">
					<g:message code="Pagina principal de mediador"/></g:link></li>		
				<li><g:link class="create" controller="curso" action="menuMediador" params="['cursoId': params.cursoId]">
					<g:message code="Tareas mediador" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="menuMed" params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
					<g:message code="Lista de grupos" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<h2>Params: ${params}</h2>
		<h2>Curso: ${com.fiuba.Curso.get(params.cursoId)}</h2>
		<h2>Curso Id: ${params.cursoId}</h2>
		<h2>Cuatrimestre Id: ${params.cuatrimestreId}</h2>
		<div id="show-grupoCurso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grupoCurso">

	<g:if test="${grupoCursoInstance?.materiales}">
		<li class="fieldcontain"><span id="materiales-label"
			class="property-label"> <g:message
					code="grupoCurso.materiales.label" default="Materiales" /></span> <g:each
				in="${grupoCursoInstance.materiales}" var="m">
				<span class="property-value" aria-labelledby="materiales-label">
					<g:link controller="materialGrupo" action="muestraMediador"
						id="${m.id}"
						params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId, 'grupoId': grupoCursoInstance.id]">
						${m?.encodeAsHTML()}
					</g:link>
				</span>
			</g:each></li>
	</g:if>

	<g:if test="${grupoCursoInstance?.aprendices}">
		<li class="fieldcontain"><span id="aprendices-label"
			class="property-label"><g:message
					code="grupoCurso.aprendices.label" default="Aprendices" /></span> <g:each
				in="${grupoCursoInstance.aprendices}" var="a">
				<span class="property-value" aria-labelledby="aprendices-label">
					<g:link controller="usuario" action="muestraMenuMed"
						id="${a.usuario.id}"
						params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
						${a?.encodeAsHTML()}
					</g:link>
				</span>
			</g:each></li>
	</g:if>

	<g:if test="${grupoCursoInstance?.numero}">
		<li class="fieldcontain"><span id="numero-label"
			class="property-label"><g:message
					code="grupoCurso.numero.label" default="Numero" /></span> <span
			class="property-value" aria-labelledby="numero-label"><g:fieldValue
					bean="${grupoCursoInstance}" field="numero" /></span></li>
	</g:if>

	<g:if test="${grupoCursoInstance?.nombre}">
		<li class="fieldcontain"><span id="nombre-label"
			class="property-label"><g:message
					code="grupoCurso.nombre.label" default="Nombre" /></span> <span
			class="property-value" aria-labelledby="nombre-label"><g:fieldValue
					bean="${grupoCursoInstance}" field="nombre" /></span></li>
	</g:if>



</ol>
			<g:form action="eliminar" method="DELETE" id="${grupoCursoInstance.id}" 
				params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
				<fieldset class="buttons">
					<g:actionSubmit class="delete" action="eliminar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" 
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>