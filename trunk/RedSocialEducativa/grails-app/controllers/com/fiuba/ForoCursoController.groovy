package com.fiuba

import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Secured("hasAnyRole('ROL_MEDIADOR', 'ROL_APRENDIZ')")
class ForoCursoController {

	def usuarioService
	def foroCursoService
	def aprendizService
	
	def general() {
		
		params.max = Utilidades.MAX_PARAMS

		[publicaciones: PublicacionCurso.findAllByForoAndPublicacionInicial(ForoCurso.findByCuatrimestre(Cuatrimestre.get(params.cuatrimestreId)), 
			null, [max: params.max, offset: params.offset]), publicacionesCant: PublicacionCurso.findAllByForoAndPublicacionInicial(
			ForoCurso.findByCuatrimestre(Cuatrimestre.get(params.cuatrimestreId)), null).size(),
			params:['cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]]
	}
	
	def publicaciones() {

		params.max = Utilidades.MAX_PARAMS
		Integer offset = params.offset?.toInteger() ?: 0
		
		def cuatrimestre = Cuatrimestre.get(params.cuatrimestreId)
		def respuestas = foroCursoService.obtenerRespuestas(cuatrimestre, params.id.toLong(), params.max, offset)
		def respuestasCant = PublicacionCurso.findAllByPublicacionInicialAndForo(PublicacionCurso.get(params.id),
			ForoCurso.findByCuatrimestre(cuatrimestre)).size()+1
		
		[publicacion: PublicacionCurso.get(params.id), respuestas: respuestas, respuestasCant: respuestasCant,
			mediador: Mediador.findByUsuarioAndCurso(usuarioService.usuarioActual(), cuatrimestre.curso),
			aprendiz: aprendizService.obtenerPorCurso(usuarioService.usuarioActual().id, params.cursoId.toLong()),
			params:['pubInicialId': params.id, 'cursoId': params.cursoId, 'cuatrimestreId': params.cuatrimestreId]]
	}
}