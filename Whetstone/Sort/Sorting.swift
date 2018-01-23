//
//  Sorting.swift
//  Whetstone
//
//  Created by Peter Fong on 1/22/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Cocoa

class Sorting: NSObject {

    class func quickSort (sortingArray: inout [Int], fromIndex: Int, toIndex: Int) -> [Int] {
        
        var pivotIndex = 0
        
        if sortingArray.count > 1 {
            pivotIndex = Sorting.partition(sortingArray: &sortingArray, leftIndex: fromIndex, rightIndex: toIndex)
        
            if fromIndex < (pivotIndex - 1) {
                _ = quickSort(sortingArray: &sortingArray, fromIndex: fromIndex, toIndex: pivotIndex - 1)
            }
            
            if (pivotIndex < toIndex) {
                _ = quickSort(sortingArray: &sortingArray, fromIndex: pivotIndex, toIndex: toIndex)
            }
            
        }
        
        return sortingArray
    }
    
    fileprivate class func partition ( sortingArray: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
        let pivotItem = sortingArray[(leftIndex + rightIndex) / 2]
        var left = leftIndex
        var right = rightIndex
        
        while (left <= right) {
            
            while (sortingArray[left] < pivotItem ) {
                left = left + 1
            }
            
            while (sortingArray[right] > pivotItem ) {
                right = right - 1
            }

            if left <= right {
                sortingArray.swapAt(left, right)
                print ("sorting Array ", sortingArray)
                left = left + 1
                right = right - 1
            }
        }
        
        return left
    }
}
