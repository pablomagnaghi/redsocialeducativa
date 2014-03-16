<%@ page import="com.material.MaterialGrupoActividad" %>
<%@ page import="com.fiuba.UsuarioService" %>
<%@ page import="com.fiuba.MediadorService" %>
<%@ page import="com.fiuba.AprendizService" %>
<%
	def usuarioService = grailsApplication.classLoader.loadClass('com.fiuba.UsuarioService').newInstance()
	def mediadorService = grailsApplication.classLoader.loadClass('com.fiuba.MediadorService').newInstance()
	def aprendizService = grailsApplication.classLoader.loadClass('com.fiuba.AprendizService').newInstance()
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="red">
        <g:set var="entityName" value="${message(code: 'materialGrupoActividad.label', default: 'MaterialGrupoActividad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
		<!-- Para el header y el panel lateral -->
    	<g:set var="varUsuarioService" bean="usuarioService"/>
    	<g:set var="varMediadorService" bean="mediadorService"/>
    	<g:set var="varAprendizService" bean="aprendizService"/>
    	<g:set var="usuario" value="${varUsuarioService.usuarioActual()}"/>
    	<g:set var="cursosMediador" value="${varMediadorService.obtenerCursos(usuario)}"/>
    	<g:set var="cursosAprendiz" value="${varAprendizService.obtenerCursos(usuario)}"/>
 	
    	<div class="container-fluid-full">
			<div class="row-fluid">   
	            <g:render template="/templateRed/panel" />
	            <!-- start: Content -->
	            <!-- PANEL CENTRAL -->
	            <div id="content" class="span10">
						<h2>Params: ${params}</h2>
						<h2>Curso: ${com.fiuba.Curso.get(params.cursoId)}</h2>
						<h2>Curso Id: ${params.cursoId}</h2>
						<h2>Cuatrimestre Id: ${params.cuatrimestreId}</h2>
						<h2>Actividad Id: ${params.actividadId}</h2>
						<h2>Grupo actividad Id: ${params.grupoActividadId}</h2>
	                <div class="span2"></div>
					<div class="span8"> 
						<!-- comienzo: BREADCRUM -->
						<div class="box-content buttons">
							<p class="btn-group">
								<g:link controller="red" action="revisarRolEnCurso" params="['cursoId': params.cursoId]">
									<button class="btn">${com.cursado.Curso.get(params.cursoId)}</button></g:link>
							</p>
						</div>
						<!-- Fin: BREADCRUM -->  
						<div class="box">
	           				<g:render template="material" />
						</div>	
					</div>
					<!--/span-->
					<div class="span2"></div>	
 				</div>
            	<!-- end: Content -->
        	</div>
        	<!--/fluid-row-->
        </div>
        <!--CLAVE ESTE DIV, SI SE SACA, NO APARECE NADA -->
        <div class="clearfix"></div>					
	</body>
</html>
