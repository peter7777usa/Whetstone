//
//  Subsets.swift
//  Whetstone
//
//  Created by Peter Fong on 1/25/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation
/**
 * Question Link: https://leetcode.com/problems/subsets/
 * Primary idea: Classic Depth-first Search
 *
 * Time Complexity: O(n!), Space Complexity: O(n)
 *
 */

class Subsets {
   class func subsets(nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        let nums = nums.sorted(by: <)
        
        _dfs(res: &res, &path, nums, 0)
        
        return res
    }
    
    private class func _dfs( res: inout [[Int]], _ path: inout [Int], _ nums: [Int], _ index: Int) {
        // termination case
        res.append(Array(path))
        
        for i in index..<nums.count {
            path.append(nums[i])
            _dfs(res: &res, &path, nums, i+1)
            path.removeLast()
        }
    }
}
