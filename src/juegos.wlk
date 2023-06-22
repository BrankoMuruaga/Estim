import descuentos.*
import paises.*

class Juego{
	var property precioDeLista
	var property descuentoAplicado = sinDescuento
	const property caracteristicas
	const property criticas = []
	
	
	method tieneCriticasLiterario() = criticas.any{c => c.texto().size() > 100}
	
	method tieneMasDe_CriticasPositivas(unNumero) = self.cantidadDeCriticasPositivas() > unNumero
	
	method cantidadDeCriticasPositivas() = criticas.count{c => c.esPositiva()}
	
	method cantidadDeCriticasNegativas() = criticas.count{c => !c.esPositiva()}
	
	method precio() = precioDeLista - descuentoAplicado.descuentoAAplicarA_(self)
	
	method registarCritica(unaCritica){
		criticas.add(unaCritica)
	}
	
	method esAptoParaMenoresEn_(unPais) {
		return !caracteristicas.any{c => unPais.caracteristicasProhibidas().contains(c)}
	}
	
	method precioEn_(unPais) = precioDeLista*unPais.valorDeDolarPorCadaMoneda()
}