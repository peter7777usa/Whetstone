//
//  RepeatedStringMatch.swift
//  Whetstone
//
//  Created by Peter Fong on 6/19/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class RepeatedStringMatch {
    func string1IncrementIndex (currentIndex: Int, string1: String) -> Int {
        if currentIndex < (string1.count - 1) {
            return currentIndex + 1
        }
        return 0
    }
    
    func findRepeatedStringMatchStartingFromIndex (_ A: String, _ B: String, index: Int) -> Int {
        var currentString1Index = index
        var totalLoop = 1
        var string2Copy: String = B
        while string2Copy.count != 0 {
            if A[A.index(A.startIndex, offsetBy: currentString1Index)] == string2Copy.first {
                string2Copy.remove(at: string2Copy.startIndex)
                currentString1Index = string1IncrementIndex(currentIndex: currentString1Index, string1: A)
                if currentString1Index == 0 {
                    if string2Copy.count != 0 {
                        totalLoop = totalLoop + 1
                    }
                }
            } else {
                return -1
            }
        }
        
        return totalLoop
    }
    
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        var finalMaxLoopCount = -1
        for (index, character) in A.enumerated() {
            if character == B.first {
                let result = findRepeatedStringMatchStartingFromIndex(A, B, index: index)
                if finalMaxLoopCount == -1 {
                    finalMaxLoopCount = result
                } else {
                    if finalMaxLoopCount > result && result != -1 {
                        finalMaxLoopCount = result
                    }
                }
            }
        }
        return finalMaxLoopCount
    }
}

class RepeatedStringMatch2 {
    //Given two strings A and B, find the minimum number of times A has to be repeated such that B is a substring of it. If no such solution, return -1.
    //For example, with A = "abcd" and B = "cdabcdab".
    //Return 3, because by repeating A three times (“abcdabcdabcd”), B is a substring of it; and B is not a substring of A repeated two times ("abcdabcd").
    
    
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        var stringTotal = ""
        var maxLoop = (B.count / A.count) + 2
        
        for _ in 0..<maxLoop {
            stringTotal.append(A)
        }
        if stringTotal.contains(B) {
            
            while stringTotal.count > B.count {
                let lowBound =  stringTotal.startIndex
                let highBound = stringTotal.index(stringTotal.startIndex, offsetBy: A.count)
                let range = lowBound ..< highBound
                stringTotal.removeSubrange(range)
                if !stringTotal.contains(B) {
                    return maxLoop
                }
                maxLoop = maxLoop - 1
            }
            return maxLoop
        }
        return -1
    }
}
