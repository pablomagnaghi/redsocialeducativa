<div class="row-fluid">
    <div class="box span12">
        <div class="box-header">
            <h2><i class="icon-edit"></i>Solicitud de membresía</h2>
            <div class="box-icon">
                <g:link class="list" controller="login" action="auth"><i class="icon-home"></i></g:link>
            </div>
        </div>
        <div class="box-content">
        	<g:if test="${flash.message}">
		  		<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${usuarioInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${usuarioInstance}" var="error">
						<g:if test="${error in org.springframework.validation.FieldError}">
							<p><g:message error="${error}"/></p>
						</g:if>
					</g:eachError>
				</ul>
			</g:hasErrors>
            <g:form class="form-horizontal" controller="red" action="revisarDatosUsuario">
	            <fieldset>
	                <div class="control-group">
	                    <label class="control-label" for="focusedInput">DNI</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="username" type="text" value="${usuarioInstance?.username}"  />
	                        <g:if test="${hasErrors(bean: usuarioInstance, field: 'username', 'error')}">
	                        	<g:renderErrors bean="${usuarioInstance}" as="list" field="username"/>
	                        	
	                        </g:if>
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Apellido</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="apellido" type="text" value="${usuarioInstance?.apellido}"" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Nombres</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="nombres" type="text" value="${usuarioInstance?.nombres}" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Legajo</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="legajo" type="text" value="${usuarioInstance?.legajo}" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Padron</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="padron" type="text" value="${usuarioInstance?.padron}" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Email</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="email" type="text" value="${usuarioInstance?.email}" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Password</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="password" type="password" value="${usuarioInstance?.password}" maxlength="12" />
	                    </div>
					</div> 
					<div class="control-group">
	                    <label class="control-label" for="focusedInput">Confirmar Password</label>
	                    <div class="controls">
	                        <input class="input-large focused" id="focusedInput" name="passwordConfirmado" type="password" maxlength="12" />
	                    </div>
					</div> 
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Enviar datos</button>
                	</div>	
					<div><g:hiddenField name="enabled" value="${false}"/></div>
	            </fieldset>
            </g:form>
        </div>
    </div>
    <!--/span-->
</div>
<!--/row-->