package com.fiuba

abstract class Foro {

	String nombre
	
	String toString() {
		"${nombre}"
	}
	
    static constraints = {
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
