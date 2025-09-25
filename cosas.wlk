object knightRider {
    method peso() = 500
    method peligrosidad() = 10

}


object bumbleblee {
    var esAuto = true 
    method transformarEnAuto() {
      esAuto = true
    }
    method transformarEnRobot() {
      esAuto = false
    }
    // ternario me permite usar una condicional, de forma 
    //que si dice que es un auto da valor 15 significa que es flaso, de cualquier otra forma es falso
    method peligrosidad() = if(esAuto) 15 else 30
}


object ladrillos {
  var cantidad = 10

  method cantidad(nuevaCantidad) {
    cantidad = nuevaCantidad
  }

method peso() = 2 * cantidad
method peligrosidad() = 2
  
}

// method con = es lo mismo que poner llves y hacer un return 
// tambien existe una posibilidad de poner un var property que 
//te refleja en los test la posibilidad de dar un get y un set

object arena {
  var peso = 0

  method setpeso(nuevoPeso) {
    peso = nuevoPeso
  }

  method peso() {
    return peso
  }
}

object bateriaAntiaerea {
  var estaConMisiles = false
  method cargarMisile(){
    estaConMisiles = true
  }
  method descargarMisiles() {
    estaConMisiles = false
  }
  method peso () = if(estaConMisiles) 300 else 200
  method peligrosidad() = if(estaConMisiles) 100 else 0
}

object contenedor {
    const cosasAdentro = []
    
    method agregar(unaCosa) {
      cosasAdentro.add(unaCosa)
    }
    method agregarVarias(variasCosas) {
      cosasAdentro.addAll(variasCosas)
    }
    method quitarCosas(unaCosa) {
      cosasAdentro.remove(unaCosa)
    }
    method vaciarCosas() {
      cosasAdentro.clear()
    }
    // hacemos un plushure en que recorre la lista de todas las cosas  
    method peso() = 100 +  cosasAdentro.sum({cosas => cosas.peso()})
    //
    method peligrosidad() =
     if(cosasAdentro.isEmpty()) 0 
     else cosasAdentro.max({c => c.peligrosidad()}).peligrosidad()

}

object residuos {
    // lo utilizamos por que nos dice que su atributo es variable, y se puede cambiar en varios sentidos
     var property peso = 0

    method peligrosidad() {
      return 200
    }

}


object emblaje {

    var cosaEnvuelta = arena

    method cambiarCosaEnvuelta(unaCosa) {
      cosaEnvuelta = unaCosa
    }
    method peso() {
      return cosaEnvuelta.peso()
    }
    method peligrosidad() {
      return cosaEnvuelta.peligrosidad() * 0.5
    }
    
}
