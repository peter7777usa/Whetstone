//
//  main.swift
//  Whetstone
//
//  Created by Peter Fong on 1/7/18.
//  Copyright 	© 2018 Peter Fong. All rights reserved.
//


import Foundation


var visited = [Int]()
var route = [[Int]]()
var resultStepArray = [Int]()

func removeObstacle(numRows:Int, numColumns:Int, lot:[[Int]]) -> Int
{
    // WRITE YOUR CODE HERE
    route.append([0,0])
    findRoute(currentPosition: [0, 0], numRows: numRows, numColumns: numColumns, lot: lot)
    
    return 3
}

func findRoute(currentPosition: [Int], numRows:Int, numColumns:Int, lot:[[Int]]){
    let rightResult = checkRight(currentPosition: currentPosition, numRows: numRows, numColumns: numColumns, lot: lot)
    if  rightResult == 0 {
        route.removeLast()
    } else if rightResult == 9 {
        resultStepArray.append(route.count)
    }
    
    
    
    
    print (checkTop(currentPosition: currentPosition, numRows: numRows, numColumns: numColumns, lot: lot))
}

func checkLeft(currentPosition: [Int], numRows:Int, numColumns:Int, lot:[[Int]]) -> Int {
    if currentPosition[1] - 1 >= 0 {
        route.append([currentPosition[0], currentPosition[1] - 1])
        return lot[currentPosition[0]][currentPosition[1] - 1]
    }
    return -1
}

func checkRight(currentPosition: [Int], numRows:Int, numColumns:Int, lot:[[Int]]) -> Int {
    if currentPosition[1] - 1 <= numColumns - 1 {
        route.append([currentPosition[0], currentPosition[1] + 1])
        return lot[currentPosition[0]][currentPosition[1] + 1]
    }
    return -1
}

func checkTop(currentPosition: [Int], numRows:Int, numColumns:Int, lot:[[Int]]) -> Int {
    if currentPosition[0] - 1 >= 0 {
        route.append([currentPosition[0] - 1, currentPosition[1]])
        return lot[currentPosition[0] - 1][currentPosition[1]]
    }
    return -1
}

func checkBottom(currentPosition: [Int], numRows:Int, numColumns:Int, lot:[[Int]]) -> Int {
    if currentPosition[1] - 1 <= numRows - 1 {
        route.append([currentPosition[0] + 1, currentPosition[1]])
        return lot[currentPosition[0] + 1][currentPosition[1]]
    }
    return -1
}

_ = removeObstacle(numRows: 3, numColumns: 3, lot: [[1,0,0], [1,0,0], [1,9,1]])
