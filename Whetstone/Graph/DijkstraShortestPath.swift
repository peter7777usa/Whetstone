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
    
    var nodeDistanceTable = [GraphNode: [GraphNode: PathInfo]]()
    var graph = Graph()
    
    func populateShortestDistanceTable(node: GraphNode) {
        
        var shortestKnownDest = [GraphNode: PathInfo]()
        let initialPathInfo = PathInfo()
        initialPathInfo.destinationNode = node
        initialPathInfo.shortestDistance = 0
        shortestKnownDest[node] = initialPathInfo
        
        var currentPathInfo = getNextClosestUnvisitedNode(shortestKnownDest: shortestKnownDest)
        while currentPathInfo != nil {
            
            for connectedNode in (currentPathInfo?.destinationNode.connectedNodes)! {
                let existingPathToConnectedNode = shortestKnownDest[connectedNode.node]
                if  existingPathToConnectedNode == nil { //Add new Path into Table
                    let newPathInfo = PathInfo()
                    newPathInfo.destinationNode = connectedNode.node
                    newPathInfo.shortestDistance = (shortestKnownDest[(currentPathInfo?.destinationNode)!]?.shortestDistance)! + connectedNode.weight
                    newPathInfo.previousNode = (currentPathInfo?.destinationNode)!
                    shortestKnownDest[newPathInfo.destinationNode] = newPathInfo
                }else { //New Path Exist, update it if necessary
                    let shortestDistanceRecordedWithCurrentConnectedNode = existingPathToConnectedNode?.shortestDistance
                    let distanceToCurrentConnectedNode = (shortestKnownDest[(currentPathInfo?.destinationNode)!]?.shortestDistance)! + connectedNode.weight
                    if shortestDistanceRecordedWithCurrentConnectedNode! > distanceToCurrentConnectedNode {
                        existingPathToConnectedNode?.shortestDistance = distanceToCurrentConnectedNode
                        existingPathToConnectedNode?.previousNode = (currentPathInfo?.destinationNode)!
                    }
                }
            }
            currentPathInfo = getNextClosestUnvisitedNode(shortestKnownDest: shortestKnownDest)
        }
    }
    
    func getNextClosestUnvisitedNode(shortestKnownDest: [GraphNode: PathInfo]) -> PathInfo? {
        var shortestUnVisistedNode: PathInfo? = nil
        for pathInfo in shortestKnownDest.values {
            if let unvisitedNode =  shortestUnVisistedNode {
                if pathInfo.shortestDistance < unvisitedNode.shortestDistance {
                     shortestUnVisistedNode = pathInfo
                }
            }else {
                if pathInfo.visited == false {
                    shortestUnVisistedNode = pathInfo
                }
            }
        }
        return shortestUnVisistedNode
    }
    
    func calculateDistanceToAdjacentNodesWithNode(pathInfo: PathInfo) {
        
    }
}
