//
//  QueuesViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 13.02.2021.
//

import UIKit

class QueuesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let asyncVsSyncTest2 = AsyncVsSyncTest2()
        //asyncVsSyncTest2.testConcurrent()
        //asyncVsSyncTest2.testConcurrent2()
        //asyncVsSyncTest2.testSerial()
        //asyncVsSyncTest2.testSerial2()
        
        let concurrentPerform = ConcurrentPerform()
        concurrentPerform.test()
    }
}

class AsyncVsSyncTest2 {
    
    private let concurrentQueue = DispatchQueue.global()
    private let serialQueue = DispatchQueue(label: "Test1")
    
    func testConcurrent() {
        
        concurrentQueue.async {
            print("Test 1")
        }
        
        concurrentQueue.async {
            print("Test 2")
        }
        
        concurrentQueue.sync {
            print("Test 3")
        }
        
        concurrentQueue.sync {
            print("Test 4")
        }
    }
    
    func testConcurrent2() {
        for i in 0...10 {
            concurrentQueue.async {
                print("i is: \(i)")
            }
        }
    }
    
    func testSerial() {
        serialQueue.async {
           print("test2")
        }
        
        serialQueue.async {
           print("test3")
        }
        
        serialQueue.sync {
           print("test1")
        }
        
        serialQueue.sync {
           print("test4")
        }
    }
    
    func testSerial2() {
        for i in 0...10 {
            serialQueue.async {
                print("i is: \(i)")
            }
        }
    }
}

class ConcurrentPerform {
    
    func test() {
        DispatchQueue.concurrentPerform(iterations: 5) { (i) in
            print("Concurrent Perform: \(i)")
        }
    }
}

class WorkItem {
    private let queue = DispatchQueue(label: "TestWorkItem")
    
    func testNotify() {
        let item = DispatchWorkItem {
            print("Test")
        }
        
        item.notify(queue: DispatchQueue.main) {
            print("finish")
        }
        
        queue.async(execute: item)
    }
    //Test
    //Finish
}

class WorkItem2 {
    private let queue = DispatchQueue(label: "TestWorkItem2")
    
    func testCancel() {
        queue.async {
            sleep(1)
            print("test1")
        }
        
        queue.async {
            sleep(1)
            print("test2")
        }
        
        let item = DispatchWorkItem {
            print("test")
        }

        queue.async(execute: item)
        item.cancel()
    }
    //test1
    //test2
}

class SemathoreTest {
    private let semaphore = DispatchSemaphore(value: 2)
    
    func doWork() {
        semaphore.wait()
        print("test")
        sleep(3)
        semaphore.signal()
    }
    
    func test() {
        DispatchQueue.global().async {
            self.doWork()
        }
        DispatchQueue.global().async {
            self.doWork()
        }
        DispatchQueue.global().async {
            self.doWork()
        }
    }
    //test
    //test
    //...3 seconds
    //test
}

class Barrier {
    private let queue = DispatchQueue(label: "Test1", attributes: .concurrent)
    
    private var internalTest = 0
    
    func setTest(_ test: Int) {
        queue.async(flags: .barrier) {
            self.internalTest = test
        }
    }
    
    func test() -> Int {
        var tmp: Int = 0
        queue.sync {
            tmp = self.internalTest
        }
        return tmp
    }
}
