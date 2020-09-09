//
//  main.swift
//  strategy_design_patterns
//
//  Created by Quadref on 09/09/2020.
//  Copyright © 2020 Quadref. All rights reserved.
//

import Foundation

var str = readLine()

print("Input: ")

protocol BasicStrategy {
    func inputNumber()
    func inputLowerCase(input: String) -> Bool
    func inputUppercase(input: String) -> Bool
}

class IStrategy: BasicStrategy {
    func inputNumber() {
        let possibleInt = str ?? ""

        if let convertedNumber = Int(possibleInt) {
            print("\(possibleInt) is an Int")
        }
        
    }
    
    func inputLowerCase(input: String) -> Bool {
        for str in input {
           if (!(str >= "a" && str <= "z") && !(str >= "а" && str <= "я") ) {
            return false
           }
        }
        print("\(str) is an lower case")
        return true
    }
    
    func inputUppercase(input: String) -> Bool {
        for str in input {
           if (!(str >= "A" && str <= "Z") && !(str >= "А" && str <= "Я") ) {
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
        self.strategy.inputNumber()
        self.strategy.inputLowerCase(input: str ?? "")
        self.strategy.inputUppercase(input: str ?? "")
    }
    
    func changeStrategy(aStrategy: BasicStrategy) {
        self.strategy = aStrategy
    }
}

let a = IStrategy()
let p = Main(strategy: a)
p.makeAction()
