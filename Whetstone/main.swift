//
//  main.swift
//  Whetstone
//
//  Created by Peter Fong on 1/7/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

print("Hello, World! \n")

let priorityQueue = PriorityQueue()
priorityQueue.createPriorityQueue(heap: [4])
priorityQueue.insertValue(value: 8)
priorityQueue.insertValue(value: 3)
priorityQueue.insertValue(value: 5)
priorityQueue.insertValue(value: 7)
priorityQueue.insertValue(value: 6)
priorityQueue.insertValue(value: 1)
priorityQueue.insertValue(value: 9)
priorityQueue.insertValue(value: 2)
priorityQueue.insertValue(value: 10)

print ("Priority Q", priorityQueue.queue)

print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
print ("poped ", priorityQueue.popFirstQueueItem()!)
