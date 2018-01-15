//
//  Graph.swift
//  Whetstone
//
//  Created by Peter Fong on 1/14/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

class GraphNode {
    var dataNumber = 0
    var graphNodes = [GraphNode]()
}

class Graph: NSObject {
    var graph = [GraphNode]()
    
    var visited = [Int: Bool]()
    
    func clearVisited() {
        for node in graph {
            visited[node.dataNumber] = false
        }
    }
    
    func constructSampleGraph1() {
        
        let node1 = GraphNode()
        node1.dataNumber = 1
        
        let node2 = GraphNode()
        node2.dataNumber = 2
        
        let node3 = GraphNode()
        node3.dataNumber = 3
        
        let node4 = GraphNode()
        node4.dataNumber = 4
        
        let node5 = GraphNode()
        node5.dataNumber = 5
        
        let node6 = GraphNode()
        node6.dataNumber = 6
        
        node1.graphNodes.append(node2)
        node1.graphNodes.append(node3)
        
        node2.graphNodes.append(node1)
        node2.graphNodes.append(node5)
        node2.graphNodes.append(node4)
        
        node3.graphNodes.append(node5)
        node3.graphNodes.append(node1)
        
        node4.graphNodes.append(node2)
        node4.graphNodes.append(node5)
        node4.graphNodes.append(node6)
        
        node5.graphNodes.append(node6)
        node5.graphNodes.append(node4)
        node5.graphNodes.append(node2)
        node5.graphNodes.append(node3)
        
        node6.graphNodes.append(node4)
        node6.graphNodes.append(node5)
        
        graph.append(node1)
        graph.append(node2)
        graph.append(node3)
        graph.append(node4)
        graph.append(node5)
        graph.append(node6)
        clearVisited()
    }
    
    func printBFS(nodeIndex: Int) {
        var queue = [GraphNode]()
        var tempNode: GraphNode? = graph[nodeIndex]
        while tempNode != nil {
            if !visited[tempNode!.dataNumber]!{
                print (String(tempNode!.dataNumber) + "" )
                visited[tempNode!.dataNumber] = true
            }
            for node in tempNode!.graphNodes {
                if !visited[node.dataNumber]! {
                    queue.append(node)
                }
            }
            tempNode = queue.first
            if queue.first != nil{
                queue.remove(at: 0)
            }
        }
    }
}
