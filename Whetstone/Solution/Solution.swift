//
//  Solution.swift
//  Whetstone
//
//  Created by Peter Fong on 1/24/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class Solution {
    class func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        
        var firstFound = false
        var awaitWord = ""
        var foundWord = ""
        var gap = 0
        var lowestGap = 0
        for word in words {
            if firstFound == true {
                
                gap = gap + 1
                if awaitWord == word {
                    if lowestGap == 0 {
                        lowestGap = gap
                    }else {
                        if gap < lowestGap{
                            lowestGap = gap
                        }
                    }
                    awaitWord = foundWord
                    foundWord = word
                    gap = 0
                }
                if word == foundWord {
                    gap = 0
                }
            }
            
            if firstFound == false {
                if word == word1 {
                    firstFound = true
                    foundWord = word1
                    awaitWord = word2
                }
                if word == word2 {
                    firstFound = true
                    foundWord = word2
                    awaitWord = word1
                }
            }
        }
        return lowestGap
    }
}
