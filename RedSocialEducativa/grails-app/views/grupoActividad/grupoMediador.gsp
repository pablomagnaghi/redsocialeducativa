<%@ page import="com.cursado.GrupoActividad" %>
<%@ page import="com.fiuba.UsuarioService" %>
<%@ page import="com.fiuba.MediadorService" %>
<%@ page import="com.fiuba.AprendizService" %>
<%
	def usuarioService = grailsApplication.classLoader.loadClass('com.fiuba.UsuarioService').newInstance()
	def mediadorService = grailsApplication.classLoader.loadClass('com.fiuba.MediadorService').newInstance()
	def aprendizService = grailsApplication.classLoader.loadClass('com.fiuba.AprendizService').newInstance()
	def grupoActividadService = grailsApplication.classLoader.loadClass('com.cursado.GrupoActividadService').newInstance()
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="red">
        <g:set var="entityName" value="${message(code: 'grupoActividad.label', default: 'GrupoActividad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
		<!-- Para el header y el panel lateral -->
    	<g:set var="varUsuarioService" bean="usuarioService"/>
    	<g:set var="varMediadorService" bean="mediadorService"/>
    	<g:set var="varAprendizService" bean="aprendizService"/>
    	<g:set var="varGrupoActividadService" bean="grupoActividadService"/>
    	<g:set var="usuario" value="${varUsuarioService.usuarioActual()}"/>
    	<g:set var="cursosMediador" value="${varMediadorService.obtenerCursos(usuario)}"/>
    	<g:set var="cursosAprendiz" value="${varAprendizService.obtenerCursos(usuario)}"/>
 	
    	<div class="container-fluid-full">
			<div class="row-fluid">   
	            <g:render template="/templateRed/panel" />
	            <!-- start: Content -->
	            <!-- PANEL CENTRAL -->
	            <div id="content" class="span10">
					<!-- comienzo: BREADCRUM -->
					<div class="box-content buttons">
						<p class="btn-group">
							<g:link controller="curso" action="mediador" params="['cursoId': params.cursoId]">
								<button class="btn">${com.cursado.Curso.get(params.cursoId)}</button></g:link>
							<g:link controller="actividad" action="index" params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]">
								<button class="btn">Actividades del cuatrimestre ${com.cursado.Cuatrimestre.get(params.cuatrimestreId)}</button></g:link>	
							<g:link controller="grupoActividad" action="gruposMediador" 
	                			params="['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId, 'actividadId': params.actividadId]">
	                			<button class="btn">Grupos de la actividad ${com.cursado.Actividad.get(params.actividadId)}</button></g:link>
						</p>
				    </div>
					<!-- Fin: BREADCRUM -->
	                <g:render template="grupoMediador" />		
 				</div>
            	<!-- end: Content -->
        	</div>
        	<!--/fluid-row-->
        </div>
        <!--CLAVE ESTE DIV, SI SE SACA, NO APARECE NADA -->
        <div class="clearfix"></div>					
	</body>
</html>