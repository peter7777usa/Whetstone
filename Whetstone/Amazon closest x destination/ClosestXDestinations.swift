//
//  ClosestXDestinations.swift
//  Whetstone
//
//  Created by Peter Fong on 11/8/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

public class ClosestDestination {
    func ClosestXdestinations(numDestinations:Int, allLocations:[[Int]],
                              numDeliveries:Int) -> [[Int]]
    {
        var destinationDistanceDict = [Int: Double]()
    
        for locationIndex in 0...numDestinations - 1 {
            destinationDistanceDict[locationIndex] = getDistanceGivenXY(locationCoords: allLocations[locationIndex])
        }
    
        let sortedLocationDistance = destinationDistanceDict.sorted{$0.1 < $1.1}
        var resultIndexArray = [Int]()
        for locationIndex in 0...numDeliveries - 1{
            resultIndexArray.append(sortedLocationDistance[locationIndex].key)
        }
        var returnResult = [[Int]]()
        for result in resultIndexArray {
            returnResult.append(allLocations[result])
        }
    
    
        print ( returnResult[0])
        return [[Int]]()
    }
    
    func getDistanceGivenXY(locationCoords: [Int]) -> Double{
        return Double(locationCoords[0] * locationCoords[0] + locationCoords[1] * locationCoords[1]).squareRoot()
    }
    
    //ClosestXdestinations(numDestinations: 3, allLocations: [[1,2], [3,4], [1, -1]], numDeliveries: 2)

}
