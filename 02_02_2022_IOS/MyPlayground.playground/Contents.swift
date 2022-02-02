import UIKit

// -> una línea

/*
 ->  varias líneas
 */

// MARK: - TIPOS BASICOS

var nombre: String = "pepe" // var -> define una propiedad mutable
 let apellido: String = "ramirez" // let -> define una propiedad inmutable

let profesion = "iOS Developer"
print(profesion)

print("El Sr \(nombre + apellido), es \(profesion)")

//NSLog("El Sr %@, es %@", nombre, profesion)

var numeroA: Int = 4
var numeroB = 3.5

var multiplicacion = Double(numeroA) *  numeroB

typealias EnteroAndres = Int
typealias EnteroAndres2 = () -> Void

var numeroC: EnteroAndres = 5

multiplicacion = multiplicacion + Double(numeroC)

var numeroH = 1, numeroD = 4, numeroL = 5
print(numeroH)


// MARK: - OPERADORES

var numeroJ = 0

numeroJ = 2 + 5 + 7

numeroJ -= 10

var sino: Bool = true

if sino {
  print("Correcto")
} else {
    print("Incorrecto")
}

if nombre.isEmpty || apellido.isEmpty {
    print("introduce datos")
} else {
  print("ya existen datos")
}


if numeroJ >= 7 {
    print("Correcto")
} else {
    print("Incorrecto")
}

var resultado = numeroJ != 0 ? numeroA / Int(numeroB) : 0
print(resultado)

// MARK: -  STRING - CHARACTERS

var emptyString = ""
var anoterEmptyString = String()
var despedida = "Hola"

emptyString.isEmpty
despedida.isEmpty

var variableStringMutable = "Juan"
variableStringMutable += "Manuel"
variableStringMutable += "Pereira"
variableStringMutable += "Sanchez"

for index in despedida {
    print(index)
}

let exclamacion: Character = "!"
despedida += String(exclamacion)

var categoryCharacters: [Character] = ["C","b","r","T"]

categoryCharacters.append("G")

var catString = String(categoryCharacters)

print(catString)

let unusualAnimals = "koala _ ?, Rinoceronte ?, Finguino ?, domedariusAlexusGregours ?"
print( "Unusual Animals \(unusualAnimals.count) caracteres")

var welcomeToSwift = "Grettings"
welcomeToSwift.insert("!", at: welcomeToSwift.endIndex)
welcomeToSwift.insert(contentsOf: "to all", at: welcomeToSwift.endIndex)

print(welcomeToSwift)
