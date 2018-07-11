//
//  LongestUnivaluePath.swift
//  Whetstone
//
//  Created by Peter Fong on 7/10/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

public class LTreeNode {
    public var val: Int
    public var left: LTreeNode?
    public var right: LTreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


//let root = LTreeNode(5)
//let node1 = LTreeNode(4)
//let node2 = LTreeNode(1)
//let node3 = LTreeNode(1)
//let node4 = LTreeNode(5)
//let node5 = LTreeNode(5)
//root.left = node1
//node1.left = node2
//node1.right = node3
//root.right = node4
//node4.right = node5

//let root = LTreeNode(5)
//let node1 = LTreeNode(5)
//let node2 = LTreeNode(4)
//let node3 = LTreeNode(4)
//let node4 = LTreeNode(5)
//let node5 = LTreeNode(5)
//root.left = node1
//node1.left = node2
//node1.right = node3
//root.right = node4
//node4.right = node5

//let root = LTreeNode(1)
//let node1 = LTreeNode(1)
//root.left = node1
//
//print ("ans ", longestUnivaluePath(root))

class LongestUnivaluePath {
    var ans = 0
    
    func recursionFunc (_ root: LTreeNode?) -> Int {
        var leftLength = 0
        var rightLength = 0
        if root?.left != nil {
            leftLength = leftLength + recursionFunc(root?.left)
            if root?.left?.val == root?.val { //
                leftLength = leftLength + 1
            } else {
                leftLength = 0
            }
        }
        if root?.right != nil {
            rightLength = rightLength + recursionFunc(root?.right)
            if root?.right?.val == root?.val { //
                rightLength = rightLength + 1
            } else {
                rightLength = 0
            }
        }
        if root?.left != nil || root?.right != nil {
            if root?.left?.val == root?.right?.val {
                if ans < (leftLength + rightLength) {
                    ans = leftLength + rightLength
                }
            } else {
                if ans < leftLength {
                    ans = leftLength
                }
                if ans < rightLength {
                    ans = rightLength
                }
            }
        }
        if leftLength > rightLength {
            return leftLength
        } else {
            return rightLength
        }
    }
    
    func longestUnivaluePath(_ root: LTreeNode?) -> Int {
        ans = 0
        _ = recursionFunc(root)
        return ans
    }
}
