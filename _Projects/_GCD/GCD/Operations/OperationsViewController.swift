//
//  OperationsViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 13.02.2021.
//

import UIKit

class OperationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operations = OperationsMyTest1()
        operations.test()
    }
}

class OperationTest {
    private let operationQueue = OperationQueue()
    
    func test() {
        operationQueue.addOperation {
            print("test")
        }
    }
}

class OperationTest2 {
    
    class OperationA: Operation {
        override func main() {
            print("test")
        }
    }
    
    private let operationQueue = OperationQueue()
    
    func test() {
        let testOperation = OperationA()
        operationQueue.addOperation(testOperation)
    }
}

class AsyncOperations: Operation {
    private var finish = false
    private var execute = false
    private let queue = DispatchQueue(label: "AsyncOperations")
    
    override var isAsynchronous: Bool { return true }
    override var isFinished: Bool { return finish }
    override var isExecuting: Bool { return execute }
    
    override func start() {
        queue.async {
            self.main()
        }
        execute = true
    }
    override func main() {
        print("test")
        finish = true
        execute = false
    }
}

class OperationCountTest {
    private let operationQueue = OperationQueue()
    
    func test() {
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation {
            sleep(1)
            print("test 1")
        }
        operationQueue.addOperation {
            sleep(1)
            print("test 2")
        }
        operationQueue.addOperation {
            sleep(1)
            print("test 3")
        }
        //test 1
        //...1 sec
        //test 2
        //...1 sec
        //test 3
    }
}

class CancelTest {
    private let operationQueue = OperationQueue()
    
    class OperationCancelTest: Operation {
        override func main() {
            if isCancelled {
                return
            }
            sleep(1)
            if isCancelled {
                return
            }
            print("test")
        }
    }
    
    func test() {
        let cancelOperation = OperationCancelTest()
        operationQueue.addOperation(cancelOperation)
        cancelOperation.cancel()
    }
}

class OperationSuspendTest {
    private let operationsQueue = OperationQueue()
    func test() {
        let operation1 = BlockOperation {
            sleep(1)
            print("test1")
        }
        let operation2 = BlockOperation {
            sleep(1)
            print("test2")
        }
        operationsQueue.maxConcurrentOperationCount = 1
        operationsQueue.addOperation(operation1)
        operationsQueue.addOperation(operation2)
        operationsQueue.isSuspended = true
    }
}

class OperationsMyTest1 {
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
        operationsQueue.maxConcurrentOperationCount = 1
        //operation2.addDependency(operation1)
        operationsQueue.addOperation(operation1)
        operationsQueue.addOperation(operation2)
    }
}
