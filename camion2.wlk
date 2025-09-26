import cosas2.*

object camion {

    const carga = []

    method cargar(unaCosa) {
      carga.add(unaCosa)
    }
    method descargar(unaCosa) {
      carga.remove(unaCosa)
    }
    // 1000 de la carga mas la suma del peso de las cosas que estan dentro de la carga
    // utilizando un plushure 
    method pesoTotal() = 1000 + carga.sum({cosa => cosa.peso()})
    // all es un plushure la cual se pone una condicion para que cualquier elemento que la cumpla 
    // pedimos el peso y a ese valor tiene que ser un numero par.
    method pesoPar() =  carga.all({c => c.peso().even()})

    // recorremos las cosas y le pedimos el peso, y este tiene que ser igual a unValor. Devuelve un bool
    method algunaCosaPesa(unValor) {
        return carga.any({c => c.peso() == unValor})
    }  
    // devuelve el primer objeto que cumple con esa condicion con find. Devuelve un objeto
    method primerCosasConPeligrosidad(unValor){
        return
        carga.find({c => c.peligrosidad() == unValor})
    }
    //Creamos una lista con todos los elemenos mas peligrosos desde un valor dado
    method todaslasQueSuperanMasPeligrosidadQue(unValor) {
        return 
        carga.filter({c => c.peligrosidad()} > unValor )
    }
    // Le damos un objeto en vez de un valor para comparar sus peligrosidades
    method cosasQueSuperanPeligrosidadDe(unaCosa) {
      return 
      carga.filter({c => c.peligrosidad()} > unaCosa )
    }

    method excedePesoMax() {
      return self.pesoTotal() > 2500
    }

// isEmpty nos devuelve que es verdadero o falso dependiendo si la lista de este esta vacia o no 
    method puedeCircularSinSuperarElExceso(unValor) { return 
    !self.excedePesoMax() &&
    self.cosasQueSuperanPeligrosidadDe(unValor).isEmpty()
    }

//  
    method algunaCosaPesaEntre(unValor, otroValor) { return
    carga.any({c => c.peso().between(unValor, otroValor)})
    }

    method laCosaMasPesada() {
      return carga.max({c => c.peso()})
    }
    
}