package com.fiuba

class Mediador extends UsuarioRol {

	Boolean activo = true
	String jerarquia

	static belongsTo = [curso: Curso]

	static hasMany = [noticiasCurso: NoticiaCurso]

	static constraints = {
		jerarquia inList:["Profesor", "JTP", "AP", "AS", "Colaborador"]
	}
}
