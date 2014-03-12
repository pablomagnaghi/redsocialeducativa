package com.fiuba

import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

class MaterialCursoController {

	//static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def usuarioService
	def materialCursoService

	@Secured('isFullyAuthenticated()')
	def index() {
		params.max = Utilidades.MAX_PARAMS
		def curso = Curso.get(params.cursoId)
		def usuario = usuarioService.usuarioActual()
		[materialCursoInstanceList: MaterialCurso.findAllByCurso(curso), mediador: Mediador.findByUsuarioAndCurso(usuario, curso), params: ['cursoId': params.cursoId]]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def show(MaterialCurso materialCursoInstance) {
		respond materialCursoInstance, params: ['cursoId': params.cursoId]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def create() {
		def mediador = Mediador.findByUsuarioAndCurso(usuarioService.usuarioActual(), Curso.get(params.cursoId))
		respond new MaterialCurso(params), model: [mediador: mediador], params: ['cursoId': params.cursoId]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def save(MaterialCurso materialCursoInstance) {
		if (materialCursoInstance == null) {
			notFound()
			return
		}
		if (materialCursoService.existe(materialCursoInstance, params.cursoId.toLong())) {
			flash.message = "Ya existe el material ${materialCursoInstance.titulo} en el curso ${Curso.get(params.cursoId)}"
			redirect action: "create", params:['cursoId': params.cursoId]
			return
		}
		if (!materialCursoService.guardar(materialCursoInstance)) {
			def mediador = Mediador.findByUsuarioAndCurso(usuarioService.usuarioActual(), Curso.get(params.cursoId))
			render view:'create', model: [materialCursoInstance: materialCursoInstance, mediador: mediador], params:['cursoId': params.cursoId]
			return
		}
		flash.message = "Material ${materialCursoInstance} creado"
		redirect action: "index", params:['cursoId': params.cursoId]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def edit(MaterialCurso materialCursoInstance) {
		respond materialCursoInstance, model:[usuario: usuarioService.usuarioActual()],  params:['cursoId': params.cursoId]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def update(MaterialCurso materialCursoInstance) {
		if (materialCursoInstance == null) {
			notFound()
			return
		}
		if (!materialCursoService.guardar(materialCursoInstance)) {
			render view:'edit', model: [materialCursoInstance: materialCursoInstance], params:['cursoId': params.cursoId]
			return
		}
		flash.message = "Material ${materialCursoInstance} actualizado"
		redirect action: "index", params:['cursoId': params.cursoId]
	}

	@Secured("hasRole('ROL_MEDIADOR')")
	def delete(MaterialCurso materialCursoInstance) {
		if (materialCursoInstance == null) {
			notFound()
			return
		}
		materialCursoService.eliminar(materialCursoInstance)
		flash.message = "Material ${materialCursoInstance} eliminado"
		redirect action:"index", params:['cursoId': params.cursoId], method:"GET"
	}

	protected void notFound() {
		flash.message = "No se encuentra ese material"
		redirect action: "index", params:['cursoId': params.cursoId], method: "GET"
	}
}
