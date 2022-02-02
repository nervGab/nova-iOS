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
print( "Unusual Animals \(unusualAnimals.count) characters")

var welcomeToSwift = "Grettings"
welcomeToSwift.insert("!", at: welcomeToSwift.endIndex)
welcomeToSwift.insert(contentsOf: "to all", at: welcomeToSwift.endIndex)

print(welcomeToSwift)

// MARK: - Arrays (matrices, Colecciones)

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR", "iPhone X"]
var iPads = ["iPad Air", "iPad Pro", "iPad Mini retina"]

var dispositivos = iPhones + iPads

dispositivos.append("Mac Book Pro")
dispositivos.insert("iWatch 24mm", at: 0)
dispositivos.remove(at: 5)
dispositivos.sort(by: >)

print(dispositivos)

let iPhone5 = dispositivos[2]

let lastPosition = dispositivos.last
let firstPosition = dispositivos.first

let aux = dispositivos.filter { $0.contains("iP") }

print(aux)


// MARK: - Diccionarios  (matrices, Colecciones)

var emptyDictionary: [String: String] = [:]
var otherDictionary = Dictionary<String,Any>()

var car:[String: String] = ["brand": "Mazda",
                            "model": "Megane",
                            "power": "145 hp"]

let brand: String? = car["brand"]

if car["model"] != nil {
    print(car["model"]!)
}

if let model = car["model"] {
    print(model)
//    print(brand as Any)
    print(brand ?? "")
} else {
    
}

for (clave, valor) in car {
    print("key: \(clave) y value: \(valor)")
}

for clave in car.keys {
    print(clave)
}

for value in car.values {
    print(value)
}

// MARK: - Opcionales (Optional binding)

var numberInt = 34
var numberString = "3"

var addNumberIntString = numberInt + Int(numberString)!

var newAdd: String = String(addNumberIntString)

var newAddStr: String = numberString + String(numberInt)

var nameAA: String? = "Nerv"
nameAA = "JuanMa"

var nameBB: String? = nil
var nameModA: String!

if let nameModAWgr = nameModA {
    print("my name is: \(nameModAWgr)")
}

var xOptional: Int?
xOptional = 2
var newOptionalValue: String?
newOptionalValue = String(xOptional ?? 0)

var yAddition: Int = 20
var additionResultXY = newOptionalValue! + String(yAddition)

if let additionResult = newOptionalValue {
    print(additionResult)
}
