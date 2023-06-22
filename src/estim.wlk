import juegos.*
import descuentos.*

object estim {
	const property juegos = []
	
	method agregarJuego(unJuego){
		juegos.add(unJuego)
	}
	
	method quitaJuego(unJuego){
		juegos.remove(unJuego)
	}
	
	method juegoGalardonado(){
		const existeJuegoGalardonado = juegos.any{j => j.cantidadDeCriticasNegativas() == 0}
		var juegoGalardonado
		if(existeJuegoGalardonado){
			juegoGalardonado = juegos.find{j => j.cantidadDeCriticasNegativas() == 0}	
		}
		else{
			self.error("no existe un juego galardonado")
		}
		return juegoGalardonado
	} 
	
	method AplicarDescuentosDirectosMasivosDe_(unPorcentaje){
		const descuentoDirecto = new DescuentoDirecto(porcentajeADescontar = unPorcentaje)
		
		self.juegosAAplicarElDescuentoMasivo().forEach{j => j.descuentoAplicado(descuentoDirecto)}
	}
	
	method juegosAAplicarElDescuentoMasivo(){
	    return	juegos.filter{j => j.precioDeLista() > self.juegoMasCaro().precioDeLista()*0.75}
	}
	
	method juegoMasCaro() = juegos.max{j => j.precioDeLista()}
	
}
