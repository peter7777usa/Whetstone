//
//  DijkstraShortestPath.swift
//  Whetstone
//
//  Created by Peter Fong on 1/17/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Cocoa

//Dijkstra Shodtest Path
//let graph = Graph()
//graph.constructSampleGraph2()
//graph.printBFS(nodeIndex: 0)
//let shortestPath = DijkstraShortestPath()
//shortestPath.graph = graph
//shortestPath.populateShortestDistanceTable(node: graph.graph.first!)
//shortestPath.printShortestDistanceTable()
//*******

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
            currentPathInfo?.visited = true
            currentPathInfo = getNextClosestUnvisitedNode(shortestKnownDest: shortestKnownDest)
        }
        
        nodeDistanceTable[node] = shortestKnownDest
    }
    
    func getNextClosestUnvisitedNode(shortestKnownDest: [GraphNode: PathInfo]) -> PathInfo? {  //Probably should Heap sort this
        
        var shortestUnVisistedNode: PathInfo? = nil
        var allUnvisitedPath = [PathInfo]()
        
        for pathInfo in shortestKnownDest.values {

                if pathInfo.visited == false {
                    allUnvisitedPath.append(pathInfo)
                }
        }
        
        if let firstUnvisitedPathInfo = allUnvisitedPath.first {
            shortestUnVisistedNode = firstUnvisitedPathInfo
            for pathInfo in allUnvisitedPath {
                if pathInfo.shortestDistance < shortestUnVisistedNode!.shortestDistance {
                    shortestUnVisistedNode = pathInfo
                }
            }
        }
        
        return shortestUnVisistedNode
    }

    func printShortestDistanceTable() {
        for key in nodeDistanceTable.keys{
            print ("\nFrom Node " + key.data)
            for pathInfo in (nodeDistanceTable[key]?.values)! {
                print ("  to Node " + pathInfo.destinationNode.data + " " + String(pathInfo.shortestDistance))
            }
        }
    }
}
