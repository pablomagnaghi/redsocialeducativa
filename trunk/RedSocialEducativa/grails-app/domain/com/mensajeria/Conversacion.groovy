package com.mensajeria

class Conversacion {
	
	Carpeta padre
	
	static belongsTo = [hilo : Hilo]
	static hasMany = [mensajes : Mensaje]

    static constraints = {
    }
}
