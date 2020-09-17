//
//  main.swift
//  strategy_design_patterns
//
//  Created by Quadref on 09/09/2020.
//  Copyright © 2020 Quadref. All rights reserved.
//


print("Input: ")
var str = readLine()
print("--------------------")
print("Input method:\n" +
        "0 - number validator\n" +
        "1 - lower validator\n" +
        "2 - upper validator\n ")
var num = readLine()

class Input {
    var main = Main()
    func makeAction() {
        switch Int(num!) {
            case 0:
                main.set(strategy: InputNumber())
            case 1:
                main.set(strategy: InputLowerCase())
            case 2:
                main.set(strategy: InputUppercase())
            default:
                print("This method does not exist!")
            }
        main.operation(input: str!)
        }
}

protocol Validator {
    func isValid(input: String)
}

class InputNumber: Validator {
    func isValid(input: String) {
        let possibleInt = str ?? ""

        if let _ = Int(possibleInt) {
            print("\(possibleInt) is an Int")
        }else{
            print("Is not an Int")
        }
    }
}

class InputLowerCase: Validator {
    func isValid(input: String) {
        
        if input == input.lowercased() {
            print("\(str) is an lower case")
        }else {
            print("Is not an lower case")
        }
    }
}

class InputUppercase: Validator {
    func isValid(input: String) {
        
        if input == input.uppercased() {
            print("\(str) is an uppercase")
        }else {
            print("Is not an uppercase")
        }
    }
}

class Main {

    var strategy: Validator?
    
    func set(strategy: Validator) {
        self.strategy = strategy
    }
    
    func operation(input: String) {
        self.strategy?.isValid(input: input)
    }

}


var inputUsr = Input()
inputUsr.makeAction()
