//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// let is final
var a = 0

// ---------------------

class Car {
    // ? = Maybe has a value
    var model: String?
    
    func drive(){
        
    }
}

var cars: [Car]?
var uno: Car?

cars = [Car]()

uno = Car()
uno?.model = "uno"

cars?.append(uno!)

if let cs = cars, cs.count > 0 {
    // only execute if not nil and if more than 0 elements
    print("Cars" + " - \(cs.count)")
}else {
    
}

//Inheritance
class SportsCar : Car{
    
    override init(){
        super.init()
    }
    
    override func drive(){
    }
}

// ---------------------

class Person {
    // ! = Have a a value, for sure
    private var _age: Int!
    
    // property /w getter
    var age: Int {
        if(_age == nil){
            _age = 0
        }
        
        return _age
    }
    
    func setAge(newAge: Int){
        self._age = newAge
    }
    
}

var joao = Person()
print(joao.age)


// ---------------------

class Dog {
    var species: String
    
    init(species: String){
        self.species = species
    }
}

var pug = Dog(species: "Pug")
print(pug.species)

var p = ""
var o :String? = nil

p.isEmpty

o?.isEmpty



