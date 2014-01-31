
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
				<li><g:link class="create" controller="curso" action="menuMediador" params="['cursoId': cursoId]">
					<g:message code="Tareas mediador" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="menuMediador" params="['cursoId': cursoId]">
					<g:message code="Lista de grupos" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		
		<div id="show-grupoCurso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="realizarCambio" params="['cursoId': cursoId]">
				<fieldset class="form">
				<div>
					<g:message code="Elegir aprendiz a cambiar de grupo" />
					<g:select name="aprendizId" from="${aprendices}" optionKey="id"/>
				</div>
				<br>
				<div>
					<g:message code="Numero del nuevo grupo del aprendiz" />
					<g:field name="numero" type="number"/>
				</div>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="realizarCambio" 
						value="${message(code: 'Realizar cambios')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
