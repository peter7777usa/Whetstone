//
//  Reminder.swift
//  Whetstone
//
//  Created by Peter Fong on 7/7/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation

//Remember:
func reminder () {
    let exampleArray = Array(repeating: 0, count: 10)  //Initialize array of 10 Int with 0s
    
    for (index, flowerBucket) in exampleArray.enumerated() where index > 0 && index < 10 {
    }  //enumerated array with index and indexObj between x to y using where clause
    
    
    //Block, closure
}



//class test: Observer {
//    var callback: Callback
//
//    //public typealias Callback = (_ notification: String, _ data: Any) -> Void
//
//    init() {
//
//        callback = { notification, data in
//
//        }
//    }
//
//    func test () {
//        let notificationCenter = NotificationCenterImpl()
//        notificationCenter.addObserver(for: "test", observer: self)
//    }
//
//}
//
