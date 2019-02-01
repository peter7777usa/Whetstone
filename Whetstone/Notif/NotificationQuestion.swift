//
//  NotificationQuestion.swift
//  Whetstone
//
//  Created by Peter Fong on 1/31/19.
//  Copyright © 2019 Peter Fong. All rights reserved.
//

import Foundation


public typealias MSNotificationCallback = (_ notification: String, _ data: Any) -> (Void)

public protocol MSNotificationObserver: AnyObject {
    var callback: MSNotificationCallback { get }
}

public protocol MSNotificationCenter {
    func addObserver(for notification: String, observer: MSNotificationObserver)
    func removeObserver(_ observer: MSNotificationObserver, for notification: String)
    func postNotification(_ notification: String, data: Any)
}


public final class SomeRandomClass{
/// Implement the this class to use MSNotificationCeter to observe/post notifications
}






////Expectation

//// Step 1, Goals: Test for understanding of protocols, ability to read codes, knowledge of Blocks. Communication skill if candidate is unclear of what's going on after reading the code
/// After taking the time to understand the question, candidate will be able to adapt the MSNotification Protocol and Start implementing the 3 notifications methods

/// Step 2, assessment of programming skills, knowledge of common data structures like Hashtables
/// Candidate should come up with a [Key: [Observer]] container and finish the implementation of the NotificationCenter methods

/// Step 3, Ask for what happen if multiple thread is using this NotificationCenter class, will it crash? Gives Hint, looking for a solution to a thread safe dictionary
/// Test for understanding of GCD, Sync/Async, serial/concurrent, what will happen if multiple thread is mutating the Container
