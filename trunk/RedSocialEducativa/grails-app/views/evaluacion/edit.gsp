<%@ page import="com.fiuba.Evaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evaluacion.label', default: 'Evaluacion')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-evaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index" params="['cursoId': params.cursoId]">
					<g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create" params="['cursoId': params.cursoId]">
					<g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<h3>curso: ${params.cursoId}</h3>
		<h3>cuatri: ${params.cuatrimestreId}</h3>
		<div id="edit-evaluacion" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${evaluacionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${evaluacionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="update" method="PUT" id="${evaluacionInstance.id}" params="['cursoId': params.cursoId]">
				<g:hiddenField name="version" value="${evaluacionInstance?.version}" />
				<fieldset class="form">
					<g:render template="formEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>