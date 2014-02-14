<div class="inbox-side-bar">
	<g:remoteLink action="redactarMensaje"
				update="[success:'contenidoMensajes']" onSuccess="when_ready();actualizar('redactar', null)" id="compose-mail"
				class="btn btn-primary btn-block">
				<span class="glyphicon glyphicon-envelope"></span>
				<strong>Redactar</strong>
	</g:remoteLink>
	<h6>
		Carpetas <a class="pull-right txt-color-darken"
			data-original-title="Refresh" data-placement="right" title=""
			rel="tooltip" href="javascript:void(0);"><i class="fa fa-refresh"></i></a>
	</h6>
	<ul class="inbox-menu-lg" id="lista_carpetas">
		<g:render template="carpetas"
			model="['etiquetasCarpetas' : etiquetasCarpetas, 'seleccionada' : carpetaSeleccionada]"></g:render>
	</ul>
</div>
<div id="contenidoMensajes" class="table-wrap custom-scroll animated fast fadeInRight"
	style="height: 950px; opacity: 1;">
	<table id="inbox-table" class="table table-striped table-hover">
		<tbody>
			<g:render template="conversaciones"
				model="['conversaciones' : conversaciones]"></g:render>
		</tbody>
	</table>
</div>
