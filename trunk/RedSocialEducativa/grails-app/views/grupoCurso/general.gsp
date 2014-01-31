<%@ page import="com.fiuba.GrupoCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'aprendiz.label', default: 'Aprendiz')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-aprendiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">
					<g:message code="default.home.label"/></a></li>
				<li><g:link class="create" controller="curso" action="aprendiz" params="['cursoId': cursoId]">
					<g:message code="Menu aprendiz" args="[entityName]" /></g:link></li>		
				<li><g:link class="create" action="crear" params="['cursoId': cursoId]">
					<g:message code="Crear grupo" args="[entityName]" /></g:link></li>		
			</ul>
		</div>
		<div id="list-aprendiz" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="usuario" title="${message(code: 'aprendiz.usuario.label', default: 'Usuario')}" 
							params="['cursoId': cursoId]" />
					
						<g:sortableColumn property="grupo" title="${message(code: 'aprendiz.grupo.label', default: 'Grupo')}"  
							params="['cursoId': cursoId]"/>
						
						<td>Detalle</td>	
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${aprendizInstanceList}" status="i" var="aprendizInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: aprendizInstance, field: "usuario")} (agregar link a datos del aprendiz)</td>	
					
						<td>${fieldValue(bean: aprendizInstance, field: "grupo")}</td>			
						
						<td><g:link action="mostrar" id="${aprendizInstance.grupo.id}" params="['cursoId': cursoId]">Ver detalle</g:link></td>	
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${aprendizInstanceCount ?: 0}" params="['cursoId': cursoId]" />
			</div>
		</div>
	</body>
</html>