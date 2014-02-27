package com.fiuba

import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Secured('isFullyAuthenticated()')
class PublicacionGeneralController {

	//static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def usuarioService
	def publicacionGeneralService

	def nueva() {
	
		respond new PublicacionGeneral(params), model: [usuario: usuarioService.usuarioActual()], 
			params: ['pubInicialId': params.pubInicialId]
	}

	def guardar(PublicacionGeneral publicacionGeneralInstance) {
		def pubInicialId = params.pubInicialId

		if (publicacionGeneralInstance == null) {
			notFound()
			return
		}

		if (params.pubInicialId) {
			// TODO
			if (!publicacionGeneralService.guardarRespuesta(publicacionGeneralInstance, params.pubInicialId.toLong(), usuarioService.usuarioActual())) {	
				flash.message = "No hay ingresado comentario"
				redirect controller: "foroGeneral", action: "publicaciones", params: ['id': params.pubInicialId,'pubInicialId': params.pubInicialId]
				return
			}
			flash.message = message(code: 'default.created.message', args: [message(code: 'publicacionGeneralInstance.label', default: 'PublicacionGeneral'), publicacionGeneralInstance.id])
			redirect controller: "foroGeneral", action: "publicaciones", params:['id': params.pubInicialId]
			return
		}
		
		if	(!publicacionGeneralService.guardar(publicacionGeneralInstance, usuarioService.usuarioActual())) {
			render view:'nueva', model: [publicacionGeneralInstance: publicacionGeneralInstance, usuario: usuarioService.usuarioActual()],
				params: ['pubInicialId': params.pubInicialId]
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'publicacionGeneralInstance.label', default: 'PublicacionGeneral'), publicacionGeneralInstance.id])
		redirect controller: "foroGeneral", action: "general"
	}

	def eliminar(PublicacionGeneral publicacion) {

		if (publicacion == null) {
			notFound()
			return
		}

		def esTema = false
		if (!publicacion.publicacionInicial) {
			esTema = true
		}

		publicacionGeneralService.eliminar(publicacion)

		flash.message = message(code: 'default.deleted.message', args: [message(code: 'PublicacionGeneral.label',
			default: 'PublicacionGeneral'), publicacion.id])

		if (esTema) {
			redirect controller: "foroGeneral", action:"general"
			return
		}

		redirect controller: "foroGeneral", action:"publicaciones", method:"GET", params:['id': params.pubInicialId]
	}

	def editar(PublicacionGeneral publicacionGeneralInstance) {

		respond publicacionGeneralInstance, model: [usuario: usuarioService.usuarioActual()], 
			params: ['publicacionId': params.id, 'pubInicialId': params.pubInicialId]
	}

	def actualizar(PublicacionGeneral publicacionGeneralInstance) {

		if (publicacionGeneralInstance == null) {
			notFound()
			return
		}

		if (!publicacionGeneralService.guardar(publicacionGeneralInstance, usuarioService.usuarioActual())) {
			render view:'editar', model: [publicacionGeneralInstance: publicacionGeneralInstance, usuario: usuarioService.usuarioActual()]
				params: ['publicacionId': params.id, 'pubInicialId': params.pubInicialId]
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'PublicacionGeneral.label', default: 'PublicacionGeneral'), publicacionGeneralInstance.id])
		redirect controller: "foroGeneral", action: "publicaciones", params: ['id': params.pubInicialId, 'pubInicialId': params.pubInicialId]
	}

	protected void notFound() {
		flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicacionGeneralInstance.label', default: 'PublicacionGeneral'), params.id])
		redirect controller: "foroGeneral", action: "general", method: "GET"
	}
}
