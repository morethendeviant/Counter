//
//  Model.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 30.09.2022.
//

import Foundation

struct Counter {
    let name: String
    var count: Int
}

class CounterModel {
    private(set) var counters: [Counter] = CountersMockData.counters
    
    func createCounter(name: String) {
        counters.append(Counter(name: name, count: 0))
    }
    
    func updateCounter(at index: Int?) {
        if let index = index { counters[index].count += 1 }
    }
    
    func deleteCounter(at index: Int?) {
        if let index = index, counters.indices.contains(index) {
            counters.remove(at: index)            
        }
    }
}


struct CountersMockData {
    static let counters: [Counter] = [Counter(name: "Birds", count: 4),
                                      Counter(name: "Flowers", count: 11),
                                      Counter(name: "Cats", count: 2)]
}
