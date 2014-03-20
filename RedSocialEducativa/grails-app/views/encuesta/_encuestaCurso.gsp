<div class="box-header" data-original-title="">
	<h2><i class="icon-table"></i><span class="break"></span>Encuesta ${encuestaInstance}</h2>
	<div class="box-icon">	
		<g:link action="encuestasCurso" params="['cursoId': params.cursoId]"><i class="icon-table"></i></g:link>
	</div>
</div>
<div class="box-content">
	<g:if test="${flash.message}">
		<div class="box-content alerts">
			<div class="alert alert-info"><button class="close" data-dismiss="alert" type="button"></button><strong>${flash.message}</strong></div>
		</div>
	</g:if>	
	<dl>
		<dt>Titulo: ${fieldValue(bean: encuestaInstance, field: "nombre")}</dt>
		<dt>Preguntas choice: </dt>
			<g:set var="cant" value="${1}" />
			<g:each in="${encuestaInstance.preguntasChoice}" var="choice">
				
				<dd><div class="message" style="width:100%">${cant} - ${choice}</div></dd>
				<g:if test="${choice.opciones}">
					<ul>
						<g:each in="${choice.opciones}" var ="op">
						
							<p>${op}</p>
						</g:each>
					</ul>
				</g:if>	
				<g:set var="cant" value="${cant + 1}" />
				<br>
				<hr>
			</g:each>
		<dt>Preguntas a desarrollar: </dt>	
			<g:each in="${encuestaInstance.preguntasDesarrollo}" var="desarrollo">
				<dd><div class="message" style="width:100%">${cant} - ${desarrollo}</div></dd>
				<g:set var="cant" value="${cant + 1}" />
				<br>
				<hr>
			</g:each>
		<dt>Preguntas de puntajate: </dt>	
			<g:each in="${encuestaInstance.preguntasPuntaje}" var="puntaje">
				<dd>${cant} - ${puntaje}</dd>
				<dd>Puntaje: </dd>
				<g:set var="cant" value="${cant + 1}" />
				<br>
				<hr>
			</g:each>
	</dl>
</div>