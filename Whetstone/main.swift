//
//  main.swift
//  Whetstone
//
//  Created by Peter Fong on 1/7/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

print("Hello, World! \n")

let tree = Tree()
tree.constructTestTree()
//tree.printBFS()
//tree.printPreOrder(treeNode: tree.root)
tree.printInOrder(treeNode: tree.root)
