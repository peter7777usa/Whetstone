//
//  Tree.swift
//  Whetstone
//
//  Created by Peter Fong on 1/13/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

//let tree = Tree()
//tree.constructTestTree()
////tree.printBFS()
////tree.printPreOrder(treeNode: tree.root)
//tree.printInOrder(treeNode: tree.root)



class copyTreeNodeContainer {
    var dataNumber = 0
    
}

class TreeNode: Hashable {
    var dataNumber = 0
    var treeNodes = [TreeNode]()
    
    var hashValue: Int {
        return self.dataNumber
    }
    
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.dataNumber == rhs.dataNumber
    }
}

class Tree: NSObject {
    var root = TreeNode()
    
    func constructTestTree(){
        let node1 = TreeNode()
        node1.dataNumber = 1
        
        let node2 = TreeNode()
        node2.dataNumber = 2
        
        let node3 = TreeNode()
        node3.dataNumber = 3
        
        let node4 = TreeNode()
        node4.dataNumber = 4
        
        let node5 = TreeNode()
        node5.dataNumber = 5
        
        let node6 = TreeNode()
        node6.dataNumber = 6
        
        let node7 = TreeNode()
        node7.dataNumber = 7
        
        node1.treeNodes.append(node2)
        node1.treeNodes.append(node3)
        node2.treeNodes.append(node4)
        node2.treeNodes.append(node5)
        node3.treeNodes.append(node6)
        node3.treeNodes.append(node7)
        
        root = node1
    }
    
    func copyNode(node: TreeNode) -> TreeNode{
        let copyNode = TreeNode()
        copyNode.dataNumber = node.dataNumber
        copyNode.treeNodes = node.treeNodes
        return copyNode
    }
    
    func pointAllNodesToNewCopies(node: TreeNode, treeHasMap: [TreeNode: TreeNode]) {
        let oldNodesRef = node.treeNodes
        var newNodesRef = [TreeNode]()
        for node in oldNodesRef {
            newNodesRef.append(treeHasMap[node]!)
        }
        node.treeNodes = newNodesRef
    }
    
    func copyTree() -> TreeNode{
        var treeHashMap = [TreeNode: TreeNode]()
        var queue = [TreeNode]()
        var tempNode: TreeNode? =  root
        while tempNode != nil {
            treeHashMap[tempNode!] = copyNode(node: tempNode!)
            queue.append(contentsOf: tempNode!.treeNodes)
            tempNode = queue.first
            if queue.first != nil{
                queue.remove(at: 0)
            }
        }
        
        for key in treeHashMap.keys {
            pointAllNodesToNewCopies(node: treeHashMap[key]!, treeHasMap: treeHashMap)
        }
        return treeHashMap[root]!
    }
    
    func printBFS () {
        var queue = [TreeNode]()
        var tempNode: TreeNode? =  root
        while tempNode != nil {
            print (String(tempNode!.dataNumber) + "" )
            queue.append(contentsOf: tempNode!.treeNodes)
            tempNode = queue.first
            if queue.first != nil{
                queue.remove(at: 0)
            }
        }
    }
    
    func printPreOrder(treeNode: TreeNode) {
        print (String(treeNode.dataNumber) + "" + " address " + String(format: "%p", unsafeBitCast(treeNode, to: Int.self)))
        for node in treeNode.treeNodes {
            printPreOrder(treeNode: node)
        }
    }
    
    func printInOrder(treeNode: TreeNode) {
        for node in treeNode.treeNodes {
            printInOrder(treeNode: node)
            if node.dataNumber == treeNode.treeNodes.first!.dataNumber {
                print (String(treeNode.dataNumber) + "" )
            }
        }
        if treeNode.treeNodes.count == 0 {
            print (String(treeNode.dataNumber) + "" )
        }
    }
    
    func printPostOrder(treeNode: TreeNode) {
        for node in treeNode.treeNodes {
            printPostOrder(treeNode: node)
        }
        print (String(treeNode.dataNumber) + "" )
    }
}
