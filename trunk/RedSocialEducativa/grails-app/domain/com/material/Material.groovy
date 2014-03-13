package com.material

import com.fiuba.*

class Material {

	String titulo
	String autor
	String descripcion 
	String fecha = new Date().format(Utilidades.FORMATO_FECHA)
	String responsable
	
	CategoriaMaterial categoria
	Long idArchivo

    static constraints = {
		titulo maxSize: Utilidades.MAX_TITULO
		autor nullable: true
		descripcion nullable: true, maxSize: Utilidades.MAX_SIZE
		idArchivo nullable: true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
	
	String toString() {
		"${titulo}"
	}
}
