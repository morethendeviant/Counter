//
//  CounterDelegateProtocol.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 30.09.2022.
//

protocol CounterDelegate {
    func updateCounter()
    func createCounter(name: String)
}
