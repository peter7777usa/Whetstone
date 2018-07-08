//
//  main.swift
//  Whetstone
//
//  Created by Peter Fong on 1/7/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

var bloomedFlowersArray = [Int]()

func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
    bloomedFlowersArray = Array(repeating: 0, count: flowers.count)
    for (i, bloomedFlowerBucket) in flowers.enumerated() {
        if i > 0 {
            if (checkCurrentFlowerBucket(index: i, k: k)) {
                return i
            }
        }
        bloomedFlowersArray[bloomedFlowerBucket - 1] = 1
    }
    return -1
}

func checkBloomedFlowersInBetweenK (fromIndex: Int, toIndex: Int , k: Int) -> Bool {
    for (index, flowerBucket) in bloomedFlowersArray.enumerated() where index > fromIndex && index < toIndex {
        if flowerBucket == 1 {
            return true
        }
    }
    return false
}

func checkCurrentFlowerBucket (index: Int, k: Int) -> Bool {
    if index - 1 - k >= 0 {
        return !checkBloomedFlowersInBetweenK(fromIndex: index - 1 - k, toIndex: index, k: k)
    }
    if index + k + 1 < bloomedFlowersArray.count {
        return !checkBloomedFlowersInBetweenK(fromIndex: index, toIndex: index + k + 1, k: k)
    }
    return false
}

print (kEmptySlots([1,2,3], 1))

//print (kEmptySlots([1,3,2], 1))
