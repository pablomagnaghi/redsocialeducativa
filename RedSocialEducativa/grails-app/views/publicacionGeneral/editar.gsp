<%@ page import="com.fiuba.PublicacionGeneral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publicacionGeneral.label', default: 'PublicacionGeneral')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-publicacionGeneral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link class="create" controller="foroGeneral" action="general">
					<g:message code="Foro General" /></g:link></li>
				<li><g:link class="list" controller="foroGeneral" action="publicaciones" id="${params.pubInicialId}">
					<g:message code="Tema actual" /></g:link></li>
			</ul>
		</div>
		
		<h3>PARAMS : ${params}</h3>
		<h3>usuario; ${usuario}</h3>
		
		<div id="edit-publicacionGeneral" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${publicacionGeneralInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${publicacionGeneralInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="actualizar" method="PUT" id="${publicacionGeneralInstance.id}" params="['pubInicialId': params.pubInicialId]">
				<g:hiddenField name="version" value="${publicacionGeneralInstance?.version}" />
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
