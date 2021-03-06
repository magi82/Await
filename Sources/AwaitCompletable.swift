//
//  AwaitCompletable.swift
//  Await
//
//  Created by Choi Joongkwan on 2017. 8. 28..
//  Copyright © 2017년 tiny2n. All rights reserved.
//

import Foundation

public protocol AwaitCompletable {
    associatedtype AwaitCompletableType
    
    var queue: DispatchQueue { get }
    var timeout: DispatchTimeInterval? { get }
    
    func execute(_ completion: @escaping (AwaitCompletableType) throws -> Void) throws
}

extension AwaitCompletable {
    public var queue: DispatchQueue {
        return DispatchQueue(label: "com.tiny2n.queue.completable", attributes: .concurrent)
    }
    
    public var timeout: DispatchTimeInterval? {
        return nil
    }
}
