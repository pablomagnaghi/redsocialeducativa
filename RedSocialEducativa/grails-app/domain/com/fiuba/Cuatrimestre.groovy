package com.fiuba

class Cuatrimestre {

	//	// validar que sea mayor a 2000
	Short anio
	//	// 1er o 2do cuatrimestre
	Short numero
	//	// Si el curso esta habilitado para formar grupos
	boolean habGrupos
	//	// numero de grupos actuales, debe cambiarse a cero cuando habGrupos es falso
	Short nroUltGrupo
		
	static belongsTo = [curso: Curso]	
	
	static hasMany = [aprendices: Aprendiz]
	
    static constraints = {
    }
}