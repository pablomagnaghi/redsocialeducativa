<%@ page import="com.encuesta.Encuesta" %>
<%@ page import="com.fiuba.UsuarioService" %>
<%@ page import="com.fiuba.MediadorService" %>
<%@ page import="com.fiuba.AprendizService" %>
<%@ page import="com.encuesta.PreguntaChoice" %>
<%@ page import="com.encuesta.PreguntaDesarrollo" %>
<%@ page import="com.encuesta.PreguntaPuntaje" %>
<%
	def usuarioService = grailsApplication.classLoader.loadClass('com.fiuba.UsuarioService').newInstance()
	def mediadorService = grailsApplication.classLoader.loadClass('com.fiuba.MediadorService').newInstance()
	def aprendizService = grailsApplication.classLoader.loadClass('com.fiuba.AprendizService').newInstance()
%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="red">
        <g:set var="entityName" value="${message(code: 'encuesta.label', default: 'Encuesta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    	<!-- Para el header y el panel lateral -->
    	<g:set var="varUsuarioService" bean="usuarioService"/>
    	<g:set var="varMediadorService" bean="mediadorService"/>
    	<g:set var="varAprendizService" bean="aprendizService"/>
    	<g:set var="varPreguntaChoiceService" bean="preguntaChoiceService"/>
    	<g:set var="varPreguntaDesarrolloService" bean="preguntaDesarrolloService"/>
    	<g:set var="varPreguntaPuntajeService" bean="preguntaPuntajeService"/>

    	<g:set var="usuario" value="${varUsuarioService.usuarioActual()}"/>
    	<g:set var="cursosMediador" value="${varMediadorService.obtenerCursos(usuario)}"/>
    	<g:set var="cursosAprendiz" value="${varAprendizService.obtenerCursos(usuario)}"/>

    	<div class="container-fluid-full">
			<div class="row-fluid">   
	            <g:render template="/templateRed/panel" />
	            <!-- start: Content -->
	            <!-- PANEL CENTRAL -->
	            <div id="content" class="span10">
	            	<div class="span2"></div>
					<div class="span8"> 
						<!-- comienzo: BREADCRUM -->
						<div class="box-content buttons">
							<p class="btn-group">
								<g:link controller="curso" action="aprendiz" params="['cursoId': params.cursoId]">
									<button class="btn">${com.cursado.Curso.get(params.cursoId)}</button></g:link>
							</p>
						</div>
						<!-- Fin: BREADCRUM -->  
						<div class="box">
	           				<g:render template="encuestaCurso" />
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