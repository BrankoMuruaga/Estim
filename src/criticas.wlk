import juegos.*
import estim.*
import paises.*
import descuentos.*

class Critica{
	method esPositiva()
	method texto()
	method prueba() = "hola"
}



class CriticaDeUsuario inherits Critica{
	var property esPositiva
	
	override method texto() = if(esPositiva) "SI" else "NO"
}

class CriticaPaga inherits Critica{
	const juegoACriticar
	const juegosPagados = []
	
	method agregarJuegoPagado(unJuego){
		juegosPagados.add(unJuego)
	}
	
	method quitarJuegoPagado(unJuego){
		juegosPagados.remove(unJuego)
	}
	
	override method texto(){
		var textoRandom = ""	
		(1.. 10).forEach{n =>
			if(10 > n){
				textoRandom = textoRandom + " " + self.palabraRandom()
			}
		}
		return textoRandom
	} 
	
	override method esPositiva() = juegosPagados.contains(juegoACriticar)
	
	method palabraRandom(){
		var palabra = ""
		const letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
		(1.. 1.randomUpTo(10).truncate(0)).forEach{n =>
			if(10 > n){
				palabra = palabra + letras.anyOne()
			}
		}
		return palabra
		
	} 
}

class CriticaDeRevista inherits Critica{
	const property criticos = []
	
	method agregarCritico(unCritico){
		criticos.add(unCritico)
	}
	
	method quitarCritico(unCritico){
		criticos.remove(unCritico)
	}
	
	override method esPositiva() = criticos.count{c => c.esPositiva()} > criticos.size()/2
	
	override method texto(){
		var texto = ""
		criticos.forEach{c => texto = texto + c.texto()}
		return texto	
	}
}
