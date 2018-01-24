//
//  File.swift
//  Whetstone
//
//  Created by Peter Fong on 1/23/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class Solution {
    class func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
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
    
    
    class func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //var node1 = ListNode(1)
        //let node2 = ListNode(2)
        //let node3 = ListNode(4)
        //
        //let node4 = ListNode(1)
        //let node5 = ListNode(3)
        //let node6 = ListNode(4)
        //
        //node1.next = node2
        //node2.next = node3
        //
        //node4.next = node5
        //node5.next = node6
        //
        //node1 = Solution.mergeTwoLists(ListNode(2), ListNode(1))!
        //var tempNode:ListNode? = node1
        //while tempNode != nil {
        //    print (tempNode?.val)
        //    tempNode = tempNode?.next
        //}

        
        var root = ListNode(-1)
        var nextPointer: ListNode? = root
        var currentL1 = l1
        var currentL2 = l2
        while currentL1 != nil || currentL2 != nil {
            if currentL1 == nil {
                nextPointer?.next = currentL2
                nextPointer = nextPointer?.next
                currentL2 = currentL2?.next
            }else if currentL2 == nil {
                nextPointer?.next = currentL1
                nextPointer = nextPointer?.next
                currentL1 = currentL1?.next
            }else{
                if currentL1!.val < currentL2!.val {
                    nextPointer?.next = currentL1
                    nextPointer = nextPointer?.next
                    currentL1 = currentL1?.next
                }else{
                    nextPointer?.next = currentL2
                    nextPointer = nextPointer?.next
                    currentL2 = currentL2?.next
                }
            }
        }
        return root.next
    }
}

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
