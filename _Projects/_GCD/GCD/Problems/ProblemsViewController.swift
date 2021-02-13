//
//  ProblemsViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 13.02.2021.
//

import UIKit

class ProblemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let deadlock = DeadLock()
//        deadlock.deadlock()
        
//        let raceCondition = RaceCondition()
//        raceCondition.test()
        
        let priorityInversion = PriorityInversion()
        priorityInversion.highAsync()
        priorityInversion.mediumAsync()
        priorityInversion.lowAsync()
    }
}

class DeadLock {
    //Make async or make another queue
    func deadlock() {
        DispatchQueue.main.sync {
            print("Oooups")
        }
    }
}

class RaceCondition {
    //Make serial operations
    private let operationsQueue = OperationQueue()
    var value = 1
    
    func test() {
        let operation1 = BlockOperation {
            sleep(1)
            self.value += 5
            print("==== value is: \(self.value)")
        }
        let operation2 = BlockOperation {
            sleep(1)
            self.value += 10
            print("==== value is: \(self.value)")
        }
        //operationsQueue.maxConcurrentOperationCount = 1
        //operation2.addDependency(operation1)
        operationsQueue.addOperation(operation1)
        operationsQueue.addOperation(operation2)
    }
}

class PriorityInversion {
    //Make serial operations
    let high = DispatchQueue.global(qos: .userInteractive)
    let medium = DispatchQueue.global(qos: .userInitiated)
    let low = DispatchQueue.global(qos: .background)
    let semaphore = DispatchSemaphore(value: 1)
    
    func highAsync() {
        high.async {
            // Wait 2 seconds just to be sure all the other tasks have enqueued
            //Thread.sleep(forTimeInterval: 2)
            //self.semaphore.wait()
            //defer { self.semaphore.signal() }
            print("High priority task is now running")
        }
    }
    
    func mediumAsync() {
        for i in 1 ... 10 {
            medium.async {
                let waitTime = Double(exactly: arc4random_uniform(7))!
                print("Running medium task \(i)")
                Thread.sleep(forTimeInterval: waitTime)
            }
        }
    }
    
    func lowAsync() {
        low.async {
            //self.semaphore.wait()
            //defer { self.semaphore.signal() }
            print("Running long, lowest priority task")
            Thread.sleep(forTimeInterval: 5)
        }
    }
}


