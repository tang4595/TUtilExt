//
//  Array.swift
//  TUtilExt
//
//  Created by YL Tang on 2024/7/29.
//

import Foundation

public extension Array where Element == Task<(), Never> {
    func cancelAll() {
        forEach { task in
            task.cancel()
        }
    }
    
    func cancel(_ index: Int) {
        guard index < count else { return }
        self[index].cancel()
    }
    
    func cancel(withHash hashValue: Int) {
        guard let target = first(where: { $0.hashValue == hashValue }) else { return }
        target.cancel()
    }
}

public extension Array where Element == Task<(), any Error> {
    func cancelAll() {
        forEach { task in
            task.cancel()
        }
    }
    
    func cancel(_ index: Int) {
        guard index < count else { return }
        self[index].cancel()
    }
    
    func cancel(withHash hashValue: Int) {
        guard let target = first(where: { $0.hashValue == hashValue }) else { return }
        target.cancel()
    }
}
