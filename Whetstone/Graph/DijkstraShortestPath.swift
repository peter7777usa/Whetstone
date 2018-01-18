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
        //var pathInfo = [PathInfo]()
        
    }
    
    func findShortestDistanceOnNode(node: GraphNode) {
        let smallestDistance = node.connectedNodes.first?.weight
        for node in node.connectedNodes {
            smallestDistance
        }
    }
}
