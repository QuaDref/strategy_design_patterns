//
//  main.swift
//  strategy_design_patterns
//
//  Created by Quadref on 09/09/2020.
//  Copyright © 2020 Quadref. All rights reserved.
//

import Foundation

print("Input: ")

var str = readLine()
print("--------------------")
print("Input method:\n" +
        "0 - number validator\n" +
        "1 - lower validator\n" +
        "2 - upper validator\n ")
print("--------------------")
var num = readLine()
print("--------------------")

//Создание базовой стратерии
protocol BasicStrategy {
    func inputNumber()
    func inputLowerCase(input: String) -> Bool
    func inputUppercase(input: String) -> Bool
}

//Создание класса, который содержит функции базовой стратерии с прописанной логикой
class IStrategy: BasicStrategy {
    
    //проверка, является ли введеное содержимое числом
    func inputNumber() {
        let possibleInt = str ?? ""

        if let convertedNumber = Int(possibleInt) {
            print("\(possibleInt) is an Int")
        }else{
            print("Is not an Int")
        }
        
    }
    
    //проверка, является ли введеное содержимое в нижнем регистре
    func inputLowerCase(input: String) -> Bool {
        for str in input {
           if (!(str >= "a" && str <= "z") && !(str >= "а" && str <= "я") ) {
            print("Is not an lower case")
            return false
           }
        }
        print("\(str) is an lower case")
        return true
    }
    
    //проверка, является ли введеное содержимое в верхнем регистре
    func inputUppercase(input: String) -> Bool {
        for str in input {
           if (!(str >= "A" && str <= "Z") && !(str >= "А" && str <= "Я") ) {
            print("Is not an uppercase")
            return false
           }
        }
        print("\(str) is an uppercase")
        return true
    }
    
}


class Main {
    var strategy: BasicStrategy
    
    init(strategy: BasicStrategy) {
        self.strategy = strategy
    }
    
    func makeAction() {
        switch Int(num!) {
        case 0:
            self.strategy.inputNumber()
        case 1:
            self.strategy.inputLowerCase(input: str ?? "")
        case 2:
            self.strategy.inputUppercase(input: str ?? "")
        default:
            print("This method does not exist!")
        }
        
    }
    
    func changeStrategy(aStrategy: BasicStrategy) {
        self.strategy = aStrategy
    }
}

let a = IStrategy()
let p = Main(strategy: a)
p.makeAction()
