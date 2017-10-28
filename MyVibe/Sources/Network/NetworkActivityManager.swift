//
//  NetworkActivityManager.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 28/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class NetworkActivityManager {
    
    private var activityCount: Int {
        willSet(newValue) {
            isNetworkActivityIndicatorVisible = newValue > 0
        }
    }
    
    private let lock: NSLock
    
    private(set) var isNetworkActivityIndicatorVisible: Bool = false {
        didSet {
            guard isNetworkActivityIndicatorVisible != oldValue else { return }
            
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = self.isNetworkActivityIndicatorVisible
            }
        }
    }
    
    init() {
        lock = NSLock()
        activityCount = 0
    }
    
    func incrementActivityCount() {
        lock.lock()
        defer {
            lock.unlock()
        }
        activityCount += 1
    }
    
    func decrementActivityCount() {
        lock.lock()
        defer {
            lock.unlock()
        }
        activityCount -= 1
    }
}
