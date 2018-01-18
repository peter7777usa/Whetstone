//
//  Fibonacci.swift
//  Whetstone
//
//  Created by Peter Fong on 1/15/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class Fibonacci {
    func fib (i: Int) -> Int {
        if i <= 1 { return i }
        return fib(i: i - 1) + fib(i: i - 2)
    }
}
