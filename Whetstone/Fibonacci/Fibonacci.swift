//
//  Fibonacci.swift
//  Whetstone
//
//  Created by Peter Fong on 1/15/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class Fibonacci {
    
    var fib = [Int]()
    
    class func fib (i: Int) -> Int {
        if i <= 1 { return i }
        return fib(i: i - 1) + fib(i: i - 2)
    }
    
    func fibonacci(n: Int) {
        fib = Array(repeating: 0, count: n+2)
        fib[0] = 0
        fib[1] = 1
        
        if n > 1 {
            for i in 2 ..< n+1 {
                fib[i] = fib[i-1] + fib[i-2]
            }
        }
        print("result = ", fib[n])
    }
    //fibonacci(7)
    
    
    // Using Recursion
    func fibonacciRecursiveNum1(num1: Int, num2: Int, steps: Int) {
        
        if steps > 0 {
            let newNum = num1 + num2
            fibonacciRecursiveNum1(num1: num2, num2: newNum, steps: steps-1)
        }
        else {
            print("result = \(num2)")
        }
    }
    // fibonacciRecursiveNum1(0, num2: 1, steps: 7)
}


