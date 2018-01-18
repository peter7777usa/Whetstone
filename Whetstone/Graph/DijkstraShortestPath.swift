//
//  DijkstraShortestPath.swift
//  Whetstone
//
//  Created by Peter Fong on 1/17/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Cocoa

class PathInfo: NSObject {
    
    var destinationNode = GraphNode()
    var shortestDistance = -1
    var previousNode = GraphNode()
    var visited = false
}

class DijkstraShortestPath: NSObject {
    
    var nodeDistanceTable = [GraphNode: [PathInfo]]()
    var graph = Graph()
    
    func populateDistanceTable(node: GraphNode) {
        var shortestKnownDest = [PathInfo]()
        var pathInfo = PathInfo()
        pathInfo.destinationNode = node
        pathInfo.shortestDistance = 0
        shortestKnownDest.append(pathInfo)
        
    }
    
    func findShortestDistanceOnNode(shortestKnownDest: [PathInfo]) {
        var shortestUnVisistedNode: PathInfo? = nil
        for pathInfo in shortestKnownDest {
            if pathInfo.visited == false && pathInfo.shortestDistance < shortestUnVisistedNode!.shortestDistance{
                shortestUnVisistedNode = pathInfo
            }
        }
        
//        let smallestDistance = node.connectedNodes.first?.weight
//        for node in node.connectedNodes {
//            if smallestDistance! > node.weight {
//                smallestDistance == node.weight
//            }
//        }
    }
}
