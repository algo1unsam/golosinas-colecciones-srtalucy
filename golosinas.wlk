//PARTE 1
class Golosina{
    var property precio
    var property sabor
    var property peso
    var property gluten
}

object bombon inherits Golosina (precio=5, sabor="frutilla", peso = 15, gluten=false){
    method mordisco(){
        peso=(peso*0.8)-1
        return peso
    }
}

object alfajor inherits Golosina (precio=12, sabor="chocolate", peso = 300, gluten=true){
    method mordisco(){
        peso=(peso*0.8)
        return peso
    }
}

object caramelo inherits Golosina (precio=1, sabor="frutilla", peso = 5, gluten=false){
    method mordisco(){
        peso=peso-1
        return peso
    }
}

object chupetin inherits Golosina (precio=2, sabor="naranja", peso = 7, gluten=false){
    method mordisco(){
        if(peso<2){
            return peso
        }else{
            peso=peso*0.9
            return peso
        }
    }
}
object oblea inherits Golosina (precio=5, sabor="vainilla", peso = 250, gluten=true){
    method mordisco(){
       if (peso>70){
        peso=peso*0.5
        return peso
       }else{
        peso=peso*0.25
        return peso
       }
    }
}

object chocolatin inherits Golosina (precio=0, sabor="chocolate", peso = 0, gluten=false){
   var pesoInicial=peso
   method asignarPeso(nuevoPeso) {
        pesoInicial = nuevoPeso
        peso = nuevoPeso
       const precios = pesoInicial * 0.5
       precio = precios
        return precio
    }
    method mordisco(){

    if(peso>0.5){
        peso=(peso-2)
        return peso
        }else{
            peso=0
            return peso
        }
 
    }
}


object uwu inherits Golosina (precio=0, sabor=" ", peso = 0, gluten=false){
    var golosinaBase = null 
    var uwuRestante = 4 
    method queGolosinaEs(golosina){
        golosinaBase= golosina
        peso=golosinaBase.peso()+4
        precio=golosinaBase.precio()+2
        sabor=golosinaBase.sabor()
        gluten=golosinaBase.gluten()
    }
    method mordisco(){
        if (uwuRestante>0){
            uwuRestante-=2
            golosinaBase.mordisco()
            peso-=golosinaBase.peso()-2
        }else{
            golosinaBase.mordisco()
            peso=golosinaBase.peso()
        }
        return peso
    }
}

object pastilla inherits Golosina (precio=0, sabor="frutilla", peso = 5, gluten=false){
    var property sabores = ["frutilla", "chocolate", "naranja"]
    var gusto = sabores.first()

    method tieneGluten(decime){
        gluten = decime
        return gluten
    }

    method cuantoCuesta(){
        
        if(gluten){
            precio=10
        }else{
            precio=7
        }
        return precio
    }
    method mordisco(){
        sabores.remove(gusto)
        sabores.add(gusto)
        gusto=sabores.first()
        sabor=gusto
        return sabor
    }
}

//PARTE 2

object mariano {
    var property bolsa = []
    var property flavors = #{}
    var property golosinasDeseadas=#{"oblea, bombon, caramelo"}
    var property gustosDeseados=#{"chocolate", "vainilla"}


    method comprar(unaGolosina){
        bolsa.add(unaGolosina)
        return bolsa
    }
    method desechar(unaGolosina){
        bolsa.remove(unaGolosina)
        return bolsa
    }

    method probarGolosinas(){
        bolsa.forEach({golosina =>golosina.mordisco()})
    }

    method hayGolosinaSinTacc(){

        const si=true
        return bolsa.any({golosina=> golosina.gluten()==si})
        
        
    }

    method preciosCuidados(){
        return bolsa.all({golosina=>golosina.precio()<=10})
    }

    method golosinaDeSabor(unSabor){
        bolsa.find({golosina=>golosina.sabor()==unSabor})
    }
    
    method sabores(){
        flavors.clear()
     bolsa.forEach({golosina=>flavors.add(golosina.sabor())})
      return flavors
    }

    method golosinaMasCara(){
        return bolsa.max({golosina=> golosina.precio()})
    }

    method pesoGolosinas(){
        return bolsa.sum({golosina=>golosina.peso()})
    }
    
    method golosinasFaltantes(){
        const faltantes=#{}

        golosinasDeseadas.forEach({golosinaDeseada=> if (!bolsa.contains(golosinaDeseada)){faltantes.add(golosinaDeseada)}})
        return faltantes
    }

    method gustosFaltantes(){
        const faltantes=#{}
        gustosDeseados.forEach({gustoDeseado=>
        if(!bolsa.contains(gustoDeseado)){
            faltantes.add(gustoDeseado)
        }})
        return faltantes
    }
}
