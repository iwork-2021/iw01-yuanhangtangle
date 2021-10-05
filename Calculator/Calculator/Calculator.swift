//
//  Calculator.swift
//  Calculator
//
//  Created by yuanhang tangle on 2021/10/4.
//  Copyright © 2021 yuanhang. All rights reserved.
//

import UIKit

func factorial(op:Double)->Double{
    if(op<0 || !isInt(op: op)){
        return 0
    }
    var s = 1.0
    var i = 2.0
    let _op = round(op)
    while i <= _op {
        s *= i
        i += 1
    }
    return s
}

func isInt(op: Double)->Bool{
    let f = round(op)
    return abs(f-op) < 1e-8
}

func pow_1_2(op:Double)->Double{
    if op < 0 {return 0}
    else {return pow(op, 0.5)}
}

func pow_inv(op1:Double, op2:Double)->Double{
    if(op2 == 0) {return 0}
    else {return pow(op1, 1/op2)}
}

func log_e(op: Double)->Double{
    if op <= 0 {return 0}
    else {return log(op)}
}

func log_10(op:Double)->Double{
    if op <= 0 {return 0}
    else {return log(op)/log(10)}
}


class Calculator: NSObject {
    enum Operation {
        case UnaryOp((Double)->Double)
        case BinaryOp((Double,Double)->Double)
        case Constant(Double)
        case Equal
    }
    
    var Operations = [
        "+": Operation.BinaryOp{
            (op1, op2) in return op1 + op2
        },
        "-": Operation.BinaryOp{
            (op1, op2) in return op1 - op2
        },
        "x":Operation.BinaryOp{
            (op1, op2) in return op1 * op2
        },
        "/":Operation.BinaryOp{
            (op1, op2) in return op1 / op2
        },
        "=":Operation.Equal,
        
        "%":Operation.UnaryOp{
            op in return op/100.0
        },
        "+/-":Operation.UnaryOp{
            op in return -op
        },
        "AC":Operation.UnaryOp{
            _ in return 0
        },
        "sin":Operation.UnaryOp{
            op in return sin(op)
        },
        "cos":Operation.UnaryOp{
            op in return cos(op)
        },
        "tan":Operation.UnaryOp{
            op in return tan(op)
        },
        "sinh":Operation.UnaryOp{
            op in return sinh(op)
        },
        "cosh":Operation.UnaryOp{
            op in return cosh(op)
        },
        "tanh":Operation.UnaryOp{
            op in return tanh(op)
        },
        "x!":Operation.UnaryOp{
            op in return factorial(op: op)
        },
        "rand": Operation.UnaryOp{
            _ in return drand48()
        },
        "x^2": Operation.UnaryOp{
            op in return op*op
        },
        "x^3": Operation.UnaryOp{
            op in return op*op*op
        },
        "x^?": Operation.BinaryOp{
            (op1,op2) in return pow(op1, op2)
        },
        "e^x": Operation.UnaryOp{
            op in return exp(op)
        },
        "10^x": Operation.UnaryOp{
            op in return pow(10.0, op)
        },
        "^1/2": Operation.UnaryOp{
            op in return pow_1_2(op:op)
        },
        "^1/3": Operation.UnaryOp{
            op in return pow(op, 1.0/3)
        },
        "^1/?": Operation.BinaryOp{
            (op1, op2) in return pow_inv(op1: op1, op2: op2)
        },
        "ln": Operation.UnaryOp{
            op in return log_e(op:op)
        },
        "log10": Operation.UnaryOp{
            op in return log_10(op:op)
        },
        "pi": Operation.Constant(Double.pi),
        "e": Operation.Constant(2.7182818284)
    ]
    
    struct Intermediate{
        var firstop: Double
        var operation: (Double, Double)->Double
    }
    
    var pendingOp:Intermediate? = nil
    
    func performOp(operation: String, operand: Double)->Double?{
        if let op = Operations[operation]{
            switch op {
            case .BinaryOp(let function):
                pendingOp = Intermediate(firstop: operand, operation: function)
                return nil
            case .UnaryOp(let function):
                return function(operand)
            case .Constant(let value):
                return value
            case .Equal:
                return pendingOp!.operation(pendingOp!.firstop, operand)
            }
        }
        return nil
    }
    
    
}
