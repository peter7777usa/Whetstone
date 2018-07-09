//
//  kemptyslot.swift
//  Whetstone
//
//  Created by Peter Fong on 7/8/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class KEmptySlot {
    
    var bloomedFlowersArray = [Int]()
    
    func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
        bloomedFlowersArray = Array(repeating: 0, count: flowers.count)
        for (i, bloomedFlowerBucket) in flowers.enumerated() {
            bloomedFlowersArray[bloomedFlowerBucket - 1] = 1
            if i > 0 {
                if (checkCurrentFlowerBucket(index: bloomedFlowerBucket - 1, k: k)) {
                    return i + 1
                }
            }
        }
        return -1
    }
    
    func checkNoBloomedFlowersInBetweenK (fromIndex: Int, toIndex: Int , k: Int) -> Bool {
        if bloomedFlowersArray[fromIndex] == 1 && bloomedFlowersArray[toIndex] == 1 {
            for (index, flowerBucket) in bloomedFlowersArray.enumerated() where index > fromIndex && index < toIndex {
                if flowerBucket == 1 {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func checkCurrentFlowerBucket (index: Int, k: Int) -> Bool {
        if index - 1 - k >= 0 {
            if checkNoBloomedFlowersInBetweenK(fromIndex: index - 1 - k, toIndex: index, k: k) {
                return true
            }
        }
        if index + k + 1 < bloomedFlowersArray.count {
            if checkNoBloomedFlowersInBetweenK(fromIndex: index, toIndex: index + k + 1, k: k) {
                return true
            }
        }
        return false
    }
}import Foundation

class KEmptySlot {
    
    var bloomedFlowersArray = [Int]()
    
    func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
        bloomedFlowersArray = Array(repeating: 0, count: flowers.count)
        for (i, bloomedFlowerBucket) in flowers.enumerated() {
            bloomedFlowersArray[bloomedFlowerBucket - 1] = 1
            if i > 0 {
                if (checkCurrentFlowerBucket(index: bloomedFlowerBucket - 1, k: k)) {
                    return i + 1
                }
            }
        }
        return -1
    }
    
    func checkNoBloomedFlowersInBetweenK (fromIndex: Int, toIndex: Int , k: Int) -> Bool {
        if bloomedFlowersArray[fromIndex] == 1 && bloomedFlowersArray[toIndex] == 1 {
            for (index, flowerBucket) in bloomedFlowersArray.enumerated() where index > fromIndex && index < toIndex {
                if flowerBucket == 1 {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func checkCurrentFlowerBucket (index: Int, k: Int) -> Bool {
        if index - 1 - k >= 0 {
            if checkNoBloomedFlowersInBetweenK(fromIndex: index - 1 - k, toIndex: index, k: k) {
                return true
            }
        }
        if index + k + 1 < bloomedFlowersArray.count {
            if checkNoBloomedFlowersInBetweenK(fromIndex: index, toIndex: index + k + 1, k: k) {
                return true
            }
        }
        return false
    }
}
//print (kEmptySlots([1,2,3], 1))
//print (kEmptySlots([1,2,3,4], 1))
//print (kEmptySlots([1,3,2], 1))
//print (kEmptySlots([6, 5, 8, 9, 7, 1, 10, 2, 3, 4], 2))
//print (kEmptySlots([3, 9, 2, 8, 1, 6, 10, 5, 4, 7], 1))
