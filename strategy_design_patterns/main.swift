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
                main.Set(strategy: InputNumber())
            case 1:
                main.Set(strategy: InputLowerCase())
            case 2:
                main.Set(strategy: InputUppercase())
            default:
                print("This method does not exist!")
            }
        main.Operation(input: str!)
        }
}

protocol Validator {
    func isValid(input: String)
}

class InputNumber: Validator {
    func isValid(input: String) {
        let possibleInt = str ?? ""

        if let convertedNumber = Int(possibleInt) {
            print("\(possibleInt) is an Int")
        }else{
            print("Is not an Int")
        }
    }
}

class InputLowerCase: Validator {
    func isValid(input: String) {
        for str in input {
           if (!(str >= "a" && str <= "z") && !(str >= "а" && str <= "я") ) {
            print("Is not an lower case")
            return;
           }
        }
        print("\(str) is an lower case")
    }
}

class InputUppercase: Validator {
    func isValid(input: String) {
        for str in input {
           if (!(str >= "A" && str <= "Z") && !(str >= "А" && str <= "Я") ) {
            print("Is not an uppercase")
            return;
           }
        }
        print("\(str) is an uppercase")
    }
}

class Main {

    var strategy: Validator?
    
    func Main(strategy: Validator)
    {
        self.strategy = strategy
    }
    
    func Set(strategy: Validator) {
        self.strategy = strategy
    }
    
    func Operation(input: String) {
        self.strategy?.isValid(input: input)
    }

}


var inputUsr = Input()
inputUsr.makeAction()
