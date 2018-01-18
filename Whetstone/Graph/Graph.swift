//
//  Graph.swift
//  Whetstone
//
//  Created by Peter Fong on 1/14/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

//let graph = Graph()
//graph.constructSampleGraph1()
////graph.printBFS(nodeIndex: 5)
//graph.printDFS(nodeIndex: 0)

class ConnectedNode {
    var node = GraphNode()
    var weight = 0
}

class GraphNode: Hashable {
    var data = ""
    var connectedNodes = [ConnectedNode]()
    
    var hashValue: Int {
        return data.hashValue
    }
    
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

class Graph: NSObject {
    var graph = [GraphNode]()
    
    var visited = [GraphNode: Bool]()
    
    func constructSampleGraph2() {
        let nodeA = GraphNode()
        nodeA.data = "A"
        
        let nodeB = GraphNode()
        nodeB.data = "B"
        
        let nodeC = GraphNode()
        nodeC.data = "C"
        
        let nodeD = GraphNode()
        nodeD.data = "D"
        
        let nodeE = GraphNode()
        nodeE.data = "E"
        
        graph.append(nodeA)
        graph.append(nodeB)
        graph.append(nodeC)
        graph.append(nodeD)
        graph.append(nodeE)
        
        //A
        let connectedNodeAB = ConnectedNode()
        connectedNodeAB.node = nodeB
        connectedNodeAB.weight = 7
        
        let connectedNodeAC = ConnectedNode()
        connectedNodeAC.node = nodeC
        connectedNodeAC.weight = 3
        
        nodeA.connectedNodes.append(connectedNodeAB)
        nodeA.connectedNodes.append(connectedNodeAC)
        
        //B
        let connectedNodeBA = ConnectedNode()
        connectedNodeBA.node = nodeA
        connectedNodeBA.weight = 7
        
        let connectedNodeBC = ConnectedNode()
        connectedNodeBC.node = nodeC
        connectedNodeBC.weight = 1
        
        let connectedNodeBD = ConnectedNode()
        connectedNodeBD.node = nodeD
        connectedNodeBD.weight = 2
        
        let connectedNodeBE = ConnectedNode()
        connectedNodeBE.node = nodeE
        connectedNodeBE.weight = 6
        
        nodeB.connectedNodes.append(connectedNodeBC)
        nodeB.connectedNodes.append(connectedNodeBA)
        nodeB.connectedNodes.append(connectedNodeBD)
        nodeB.connectedNodes.append(connectedNodeBE)
        
        //C
        let connectedNodeCA = ConnectedNode()
        connectedNodeCA.node = nodeA
        connectedNodeCA.weight = 3
        
        let connectedNodeCB = ConnectedNode()
        connectedNodeCB.node = nodeB
        connectedNodeCB.weight = 1
        
        
        let connectedNodeCD = ConnectedNode()
        connectedNodeCD.node = nodeD
        connectedNodeCD.weight = 2

        nodeC.connectedNodes.append(connectedNodeCD)
        nodeC.connectedNodes.append(connectedNodeCA)
        nodeC.connectedNodes.append(connectedNodeCB)
        
        //D
        let connectedNodeDE = ConnectedNode()
        connectedNodeDE.node = nodeE
        connectedNodeDE.weight = 4
        
        let connectedNodeDC = ConnectedNode()
        connectedNodeDC.node = nodeC
        connectedNodeDC.weight = 2
        
        let connectedNodeDB = ConnectedNode()
        connectedNodeDB.node = nodeB
        connectedNodeDB.weight = 2
        
        nodeD.connectedNodes.append(connectedNodeDE)
        nodeD.connectedNodes.append(connectedNodeDC)
        nodeD.connectedNodes.append(connectedNodeDB)
        
        //E
        let connectedNodeEB = ConnectedNode()
        connectedNodeEB.node = nodeB
        connectedNodeEB.weight = 6
        
        let connectedNodeED = ConnectedNode()
        connectedNodeED.node = nodeD
        connectedNodeED.weight = 4
        
        nodeE.connectedNodes.append(connectedNodeEB)
        nodeE.connectedNodes.append(connectedNodeED)
        
        clearVisited()
    }

    func constructSampleGraph() {
        let nodeA = GraphNode()
        nodeA.data = "A"
        
        let nodeB = GraphNode()
        nodeB.data = "B"
        
        let nodeC = GraphNode()
        nodeC.data = "C"
        
        let nodeD = GraphNode()
        nodeD.data = "D"
        
        let nodeE = GraphNode()
        nodeE.data = "E"
        
        graph.append(nodeA)
        graph.append(nodeB)
        graph.append(nodeC)
        graph.append(nodeD)
        graph.append(nodeE)
        
        //A
        let connectedNodeAE = ConnectedNode()
        connectedNodeAE.node = nodeE
        connectedNodeAE.weight = 4
        
        let connectedNodeAC = ConnectedNode()
        connectedNodeAC.node = nodeC
        connectedNodeAC.weight = 2
        
        let connectedNodeAB = ConnectedNode()
        connectedNodeAB.node = nodeB
        connectedNodeAB.weight = 3
        
        nodeA.connectedNodes.append(connectedNodeAE)
        nodeA.connectedNodes.append(connectedNodeAC)
        nodeA.connectedNodes.append(connectedNodeAB)
        
        //B
        let connectedNodeBA = ConnectedNode()
        connectedNodeBA.node = nodeA
        connectedNodeBA.weight = 3
       
        let connectedNodeBC = ConnectedNode()
        connectedNodeBC.node = nodeC
        connectedNodeBC.weight = 8
        
        nodeB.connectedNodes.append(connectedNodeBC)
        nodeB.connectedNodes.append(connectedNodeBA)
        
        //C
        let connectedNodeCD = ConnectedNode()
        connectedNodeCD.node = nodeD
        connectedNodeCD.weight = 1
        
        let connectedNodeCA = ConnectedNode()
        connectedNodeCA.node = nodeA
        connectedNodeCA.weight = 2
        
        let connectedNodeCB = ConnectedNode()
        connectedNodeCB.node = nodeB
        connectedNodeCB.weight = 8
        
        nodeC.connectedNodes.append(connectedNodeCD)
        nodeC.connectedNodes.append(connectedNodeCA)
        nodeC.connectedNodes.append(connectedNodeCB)
        
        //D
        let connectedNodeDE = ConnectedNode()
        connectedNodeDE.node = nodeE
        connectedNodeDE.weight = 3
        
        let connectedNodeDC = ConnectedNode()
        connectedNodeDC.node = nodeC
        connectedNodeDC.weight = 1
        
        nodeD.connectedNodes.append(connectedNodeDE)
        nodeD.connectedNodes.append(connectedNodeDC)
        
        //E
        let connectedNodeEA = ConnectedNode()
        connectedNodeEA.node = nodeA
        connectedNodeEA.weight = 4
        
        let connectedNodeED = ConnectedNode()
        connectedNodeED.node = nodeD
        connectedNodeED.weight = 3
        
        nodeE.connectedNodes.append(connectedNodeEA)
        nodeE.connectedNodes.append(connectedNodeED)
        
        clearVisited()
    }
    
    func clearVisited() {
        for node in graph {
            visited[node] = false
        }
    }
    
    func printBFS(nodeIndex: Int) {
        
        var queue = [GraphNode]()
        var tempNode: GraphNode? = graph[nodeIndex]
        
        while tempNode != nil {
            
            if !visited[tempNode!]!{
                print (String(tempNode!.data) + " " )
                for node in (tempNode?.connectedNodes)! {
                    print (" - " + String(node.node.data) + ", weight = ", String(node.weight) )
                }
                visited[tempNode!] = true
            }
            for node in tempNode!.connectedNodes {
                if !visited[node.node]! {
                    queue.append(node.node)
                }
            }
            tempNode = queue.first
            if queue.first != nil{
                queue.remove(at: 0)
            }
        }
    }
}

//    func findNodeIndexBasedOnContent (content: Int) -> Int {
//
//        for i in 0 ..< graph.count{
//            if graph[i].dataNumber == content {
//                return i
//            }
//        }
//        return 0
//    }
//

//
//    func printDFS(nodeIndex: Int){
//        if !visited[graph[nodeIndex].dataNumber]!{
//            print (String(graph[nodeIndex].dataNumber) + "" )
//            visited[graph[nodeIndex].dataNumber] = true
//        }
//        for node in graph[nodeIndex].graphNodes {
//            if !visited[node.dataNumber]!{
//
//                printDFS(nodeIndex: findNodeIndexBasedOnContent(content: node.dataNumber))
//            }
//        }
//    }
