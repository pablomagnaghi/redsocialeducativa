
<%@ page import="com.fiuba.MaterialGrupoActividad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialGrupoActividad.label', default: 'MaterialGrupoActividad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialGrupoActividad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link controller="grupoActividad" action="menuAprendiz" params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId, 'actividadId': params.actividadId]">
					<g:message code="Lista de grupos del curso ${com.fiuba.Curso.get(params.cursoId)}" args="[entityName]" /></g:link></li>
				<li><g:link controller="grupoActividad" action="muestraMed" id="${params.grupoActividadId}" 
					params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId, 'actividadId': params.actividadId]">
					<g:message code="Grupo: ${com.fiuba.GrupoActividad.get(params.grupoActividadId)}" args="[entityName]" /></g:link></li>
			</ul>
		</div>
					<h2>Params: ${params}</h2>
		<h2>Curso: ${com.fiuba.Curso.get(params.cursoId)}</h2>
		<h2>Curso Id: ${params.cursoId}</h2>
		<h2>Cuatrimestre Id: ${params.cuatrimestreId}</h2>
		<h2>Actividad Id: ${params.actividadId}</h2>
		<div id="show-materialGrupoActividad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialGrupoActividad">
			
				<g:if test="${materialGrupoActividadInstance?.autor}">
				<li class="fieldcontain">
					<span id="autor-label" class="property-label"><g:message code="materialGrupoActividad.autor.label" default="Autor" /></span>
					
						<span class="property-value" aria-labelledby="autor-label"><g:fieldValue bean="${materialGrupoActividadInstance}" field="autor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialGrupoActividadInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label">
						<g:message code="materialGrupoActividad.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label">
							${materialGrupoActividadInstance?.categoria?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${materialGrupoActividadInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="materialGrupoActividad.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${materialGrupoActividadInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialGrupoActividadInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="materialGrupoActividad.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:fieldValue bean="${materialGrupoActividadInstance}" field="fecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialGrupoActividadInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="materialGrupoActividad.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label"><g:fieldValue bean="${materialGrupoActividadInstance}" field="responsable"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialGrupoActividadInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="materialGrupoActividad.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${materialGrupoActividadInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>