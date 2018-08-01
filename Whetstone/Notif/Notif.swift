//
//  Notif.swift
//  Whetstone
//
//  Created by Peter Fong on 7/19/18.
//  Copyright © 2018 Peter Fong. All rights reserved.
//

import Foundation


//
//@synchornize {
//
//}
//
//recursive lock

import Foundation

public typealias Callback = (_ notification: String, _ data: Any) -> Void

public protocol Observer: AnyObject {
    var callback: Callback { get }
}

public protocol NotificationCenter {
    
    func addObserver(for notification: String, observer: Observer)
    func removeObserver(_ observer: Observer, for notification: String)
    func postNotification(_ notification: String, data: Any)
}

public final class NotificationCenterImpl: NotificationCenter {
    
    var queue =  DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    var notificationDic = [String: [Observer]]()
    
    public func addObserver(for notification: String, observer: Observer) {
        // @synchornize {
        if var notificationArray =  notificationDic[notification] {
            notificationArray.append(observer)
            // notificationDic[notification] = notificationArray
        } else {
            var notificationArray = [Observer]()
            queue.async(flags: .barrier) {
                notificationArray.append(observer)
            }
            
            notificationDic[notification] = notificationArray
        }
    }
    
    public func removeObserver(_ observer: Observer, for notification: String) {
        //@synchornize {
        if var notificationArray = notificationDic[notification] {
            for (index, obs) in notificationArray.enumerated() {
                if obs === observer {
                    notificationArray.remove(at: index)
                    notificationDic[notification] = notificationArray
                }
            }
        }
        //  }
        
        //    Dispatch.global.sync {
        //
        //    }
    }
    
    public func postNotification(_ notification: String, data: Any) {
        if var notificationArray = notificationDic[notification] {
            for obs in notificationArray {
                obs.callback(notification, data)
            }
        }
    }
}

//let notificationCenter = NotificationCenterImpl()
