<%@ page import="com.fiuba.PublicacionCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacionCurso.label', default: 'PublicacionCurso')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-publicacionCurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link class="create" controller="foroCurso" action="general" 
					params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
					<g:message code="Foro Curso" /></g:link></li>
				<li><g:link class="list" controller="foroCurso" action="publicaciones" id="${params.pubInicialId}" 
					params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
					<g:message code="Tema actual" /></g:link></li>
			</ul>
		</div>
		<div id="edit-publicacionCurso" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${publicacionCursoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${publicacionCursoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="actualizar" method="PUT" id="${publicacionCursoInstance.id}" 
				params="['pubInicialId': params.pubInicialId, 'cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
				<g:hiddenField name="version" value="${publicacionCursoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="actualizar" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>