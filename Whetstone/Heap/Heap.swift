//
//  Heap.swift
//  Whetstone
//
//  Created by Peter Fong on 1/8/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Cocoa

//let heap = Heap()
//let originalHeap = [4, 3, 7, 1, 8, 5]
//print ("Org Heap ", originalHeap)
//
//print ("Min Heap ", heap.buildMinHeap(heap: originalHeap))
//
//print ("Max Heap ", heap.buildMaxHeap(heap: originalHeap))
//
//print ("Heap Sort ", heap.heapSort(heap: originalHeap))


class Heap: NSObject {
    
    //MARK: Min Heap
    func buildMinHeap (heap: [Int]) -> [Int] {
        
        var minHeap = heap
       
        var heapIndex = heap.count/2 - 1
        if heapIndex < 0{
            heapIndex = 0
        }
        for i in (0 ... heapIndex).reversed() {
            minHeap = minHeapify(heap:minHeap, nodeIndex: i)
        }
        return minHeap
    }
    
    func minHeapify(heap: [Int], nodeIndex: Int) -> [Int]{
        
        var newHeap = heap
        let left = 2 * nodeIndex + 1
        let right = 2 * nodeIndex + 2
        var smallest = nodeIndex
        
        if left < newHeap.count && right < newHeap.count{
            
            if (newHeap[left] < newHeap [nodeIndex]) {
                smallest = left
            }
            
            if (newHeap[right] < newHeap[smallest]) {
                smallest = right
            }
            
            if smallest != nodeIndex {
                newHeap.swapAt(nodeIndex, smallest)
                newHeap = minHeapify(heap:newHeap, nodeIndex: smallest)
            }
        }
        return newHeap
    }
    
    //MARK: Max Heap
    func buildMaxHeap (heap: [Int]) -> [Int]{
        
        var maxHeap = heap
        
        var heapIndex = heap.count/2 - 1
        if heapIndex < 0{
            heapIndex = 0
        }
        for i in (0 ... heapIndex).reversed() {
            maxHeap = maxHeapify(heap:maxHeap, nodeIndex: i)
        }
        return maxHeap
    }
    
    func maxHeapify(heap: [Int], nodeIndex: Int) -> [Int]{
        
        var newHeap = heap
        let left = 2 * nodeIndex + 1
        let right = 2 * nodeIndex + 2
        var largest = nodeIndex
        
        if left < newHeap.count && right < newHeap.count{
            
            if (newHeap[left] > newHeap [nodeIndex]) {
                largest = left
            }
            
            if (newHeap[right] > newHeap[largest]) {
                largest = right
            }
            
            if largest != nodeIndex {
                newHeap.swapAt(nodeIndex, largest)
                newHeap = maxHeapify(heap:newHeap, nodeIndex: largest)
            }
        }
        return newHeap
    }
    
    //MARK: Heap Sort
    func heapSort (heap: [Int]) -> [Int] {
        
        var newHeap = heap
        var sortedArray = [Int]()
        for _ in (0 ..< newHeap.count) {
            
            newHeap = buildMinHeap(heap: newHeap)
            newHeap.swapAt(0, newHeap.count - 1)
            if let lastElementInHeap = newHeap.last {
                sortedArray.append(lastElementInHeap)
            }
            newHeap.removeLast()
        }
        return sortedArray
    }
}

class PriorityQueue: NSObject {
    
    var queue = [Int]()
    
    func createPriorityQueue(heap: [Int]) {
        queue = Heap().buildMinHeap(heap: heap)
    }
    
    func getFirstQueueItem() -> Int?{
        return queue.first
    }
    
    func popFirstQueueItem() -> Int? {
        if queue.count == 0 {
            return nil
        }
        if let firstItem = queue.first, let lastItem = queue.last {
            queue[0] = lastItem
            queue = Heap().minHeapify(heap: queue, nodeIndex: 0)
            return firstItem
        }
        return nil
    }
    
    func increaseValue(itemIndex: Int, value: Int) {
        if value > queue[itemIndex] {
            return
        }
        var rootIndex = itemIndex
        queue[rootIndex] = value
        while (rootIndex > 0 && queue[(rootIndex - 1)/2] > queue[rootIndex]) {
            queue.swapAt((rootIndex - 1)/2, rootIndex)
            rootIndex = (rootIndex - 1) / 2
        }
    }
    
    func insertValue(value: Int){
        queue.append(value)
        increaseValue(itemIndex: queue.count - 1 , value: value)
    }
}
