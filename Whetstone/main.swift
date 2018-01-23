//
//  main.swift
//  Whetstone
//
//  Created by Peter Fong on 1/7/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

print("Hello, World! \n")

var unsortedArray = [ 58, 99, 12, 22, 23, 22]
print ("sorting Array ", unsortedArray)
var quickSortedArray = Sorting.quickSort(sortingArray: &unsortedArray, fromIndex: 0, toIndex: unsortedArray.count - 1)
print ("sorted ", quickSortedArray)
