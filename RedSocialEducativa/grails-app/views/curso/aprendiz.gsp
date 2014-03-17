<%@ page import="com.cursado.Curso" %>
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
        <g:set var="entityName" value="Red Social Login" />
        <title><g:message code="Red Social Login" args="[entityName]" /></title>
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
	            	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<div class="row-fluid">
						<div class="box span12">
							<div class="box-header">
								<h2><i class="icon-th-large"></i><span class="break"></span>
									Bienvenido aprendiz ${usuario} al curso ${com.cursado.Curso.get(params.cursoId)} 
									de la asignatura ${com.cursado.Curso.get(params.cursoId).asignatura}</h2>
								<div class="box-icon">
									<a href="#" class="btn-minimize"><i class="icon-chevron-up"></i></a>
								</div>
							</div>
							<div class="box-content">
								<div class="page-header">
									<g:render template="tituloGeneral"></g:render>
										<h2>Curso id: ${params.cursoId}</h2>
										<h2>Dicta cuatrimestre: ${dictaCuatrimestre}</h2>
										<h2>cuat id: ${cuatrimestre?.id}</h2>
										<h2>Noticia curso: ${noticiasCurso}</h2>
										<h2>"PARTICIPA: ${aprendiz.participa}"</h2>	
										<h2>"APRENDIZ CURSNADO": ${aprendiz.cursando}</h2>
										<h2>"CURSANDO: ${cursando}"</h2>
										<h2>APRENDIZ: ${aprendiz}-${aprendiz.id}</h2>
								</div>         
								<div class="row-fluid">            	 
									<div class="span9">
										<g:if test="${aprendiz.cursando}">	
										<g:render template="noticias"></g:render>
										</g:if>
									</div>
									<div class="span3">
										<div>
											<g:link controller="materialCurso" action="index" params="['cursoId': params.cursoId]">
												<g:message code="Material del curso" /></g:link>
										</div>
										<div>
											<g:link controller="tema" action="index" params="['cursoId': params.cursoId]">
												<g:message code="Temas del curso" /></g:link>
										</div>
										<g:if test="${aprendiz.cursando}">	
											<div>

												<g:link controller="actividad" action="index"
													params="['cursoId': params.cursoId, 'cuatrimestreId': cuatrimestre?.id]">
													<g:message code="Actividades del cuatrimestre" /></g:link>
											</div>	
											<div>

												<g:link controller="actividad" action="actividadesAprendiz"
													params="['cursoId': params.cursoId, 'cuatrimestreId': cuatrimestre?.id]">
													<g:message code="Mis actividades" /></g:link>
											</div>	
											<div>
												<g:link controller="foroCurso" action="general" params="['cursoId': params.cursoId, 'cuatrimestreId': cuatrimestre?.id]">
													<g:message code="Foro del curso"/></g:link>
											</div>
										</g:if>
									    <g:else>
											<p>Usted curso la materia durante el cuatrimestre: ${aprendiz.cuatrimestre.anio} - ${aprendiz.cuatrimestre.numero}</p>
										</g:else>	 	    
										<div>
											<g:link controller="evaluacion" action="evaluacionesCurso" params="['cursoId': params.cursoId]">
											<g:message code="Evaluaciones del curso" /></g:link>
										</div>
										<div>
											<g:link action="evaluacionesAprendiz" controller="evaluacion" params="['cursoId': params.cursoId]">
											<g:message code="Mis evaluaciones en el curso" /></g:link>
										</div>
										<div>
										<g:link controller="aprendiz" action="cambiarEstado" id="${aprendiz.id}" 
											params="['cursoId': params.cursoId,  'cuatrimestreId': cuatrimestre?.id]" 
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"> 
											DEJAR DE PARTICIPAR </g:link></div>
				
										
									</div>
								</div>
							</div>
						</div><!--/span-->
					</div>	
					<div class="row-fluid">
					</div>
				</div>	
			</div><!--/fluid-row-->	
		</div>
		<!-- end: Content -->
				
        <!--CLAVE ESTE DIV, SI SE SACA, NO APARECE NADA -->
        <div class="clearfix"></div>					
	</body>
</html>
