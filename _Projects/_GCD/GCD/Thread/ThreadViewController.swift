//
//  ThreadViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 11.02.2021.
//

import UIKit

class ThreadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Threads"
        
        pThread()
        NSThread()
        
        pThreadQoS()
        NSThreadQoS()
        
        pThreadMutex()
        NSThreadLock()
        RecursiveMutexTest().test1()
        NSRecursiveMutexTest().test1()
        
        let pthreadConditions = PthreadConditionsTest()
        pthreadConditions.test2()
        pthreadConditions.test1()
        
        let nsthreadConditions = NSThreadConditionsTest()
        nsthreadConditions.test2()
        nsthreadConditions.test1()
    }
    
    //MARK: - Низкоуровневый примитив многопоточности. UNIX поток
    func pThread() {
        var thread = pthread_t(bitPattern: 0)
        var attr = pthread_attr_t()
        
        pthread_attr_init(&attr)
        pthread_create(&thread, &attr, { pointer in
            print("pthread")
            return nil
        }, nil)
    }
    
    //MARK: - NSThread. Obj-C обертка над unix потоком
    func NSThread() {
        let nsthread = Thread {
            print("NSThread")
        }
        nsthread.start()
    }
    
    //MARK: - pthread. Quality Of Service
    func pThreadQoS() {
        var thread = pthread_t(bitPattern: 0)
        var attr = pthread_attr_t()
        pthread_attr_init(&attr)
        pthread_attr_set_qos_class_np(&attr, QOS_CLASS_USER_INITIATED, 0)
        pthread_create(&thread, &attr, { pointer in
            print("pthread. QoS")
            pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
            return nil
        }, nil)
    }
    
    //MARK: - NSThread. Quality Of Service
    func NSThreadQoS() {
        let nsthread = Thread {
            print("NSThread. QoS")
            print(qos_class_self())
        }
        nsthread.qualityOfService = .userInteractive
        nsthread.start()
        print(qos_class_main())
    }
    
    //MARK: - pthread. Mutex
    func pThreadMutex() {
        var mutex = pthread_mutex_t()
        pthread_mutex_init(&mutex, nil)
        
        pthread_mutex_lock(&mutex)
        print("pthread. Mutex")
        pthread_mutex_unlock(&mutex)
    }
    
    //MARK: - NSThread. Lock
    func NSThreadLock() {
        let lock = NSLock()
        lock.lock()
        print("NSThread. Lock")
        lock.unlock()
    }
}

//MARK: - pthread. Recursive Mutex
class RecursiveMutexTest {
    private var mutex = pthread_mutex_t()
    private var attr = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&attr)
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attr)
    }
    
    func test1() {
        pthread_mutex_lock(&mutex)
        test2()
        pthread_mutex_unlock(&mutex)
    }
    
    func test2() {
        pthread_mutex_lock(&mutex)
        print("pthread. Recursive Mutex")
        pthread_mutex_unlock(&mutex)
    }
}

//MARK: - NSThread. NSRecursiveLock
class NSRecursiveMutexTest {
    private var lock = NSRecursiveLock()
    
    func test1() {
        lock.lock()
        test2()
        lock.unlock()
    }
    
    func test2() {
        lock.lock()
        print("NSThread. Recursive Mutex")
        lock.unlock()
    }
}

//MARK: - Conditions
class PthreadConditionsTest {
    private var conditions = pthread_cond_t()
    private var mutex = pthread_mutex_t()
    private var check = false
    
    init() {
        pthread_cond_init(&conditions, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    func test1() {
        pthread_mutex_lock(&mutex)
        while !check {
            pthread_cond_wait(&conditions, &mutex)
        }
        print("pthread. Conditions 2")
        pthread_mutex_unlock(&mutex)
    }
    
    func test2() {
        pthread_mutex_lock(&mutex)
        check = true
        print("pthread. Conditions 1")
        pthread_cond_signal(&conditions)
        pthread_mutex_unlock(&mutex)
    }
}

class NSThreadConditionsTest {
    private var condition = NSCondition()
    private var check = false
    
    func test1() {
        condition.lock()
        while !check {
            condition.wait()
        }
        print("NSThread. Conditions 2")
        condition.unlock()
    }
    
    func test2() {
        condition.lock()
        check = true
        condition.signal()
        print("NSThread. Conditions 1")
        condition.unlock()
    }
}

//MARK: - Read Write Lock
class PthreadReadWriteTest {
    private var lock = pthread_rwlock_t()
    private var attr = pthread_rwlockattr_t()
    private var test: Int32 = 0
    
    init() {
        pthread_rwlock_init(&lock, &attr)
    }
    
    var testProperty: Int32 {
        get {
            pthread_rwlock_rdlock(&lock)
            let tmp = test
            pthread_rwlock_unlock(&lock)
            return tmp
        }
        set {
            pthread_rwlock_wrlock(&lock)
            test = newValue
            pthread_rwlock_unlock(&lock)
        }
    }
}

//MARK: - Spin Lock
class PthreadSpinLockTest {
    private var lock = OS_SPINLOCK_INIT

    func test() {
        OSSpinLockLock(&lock)
        //Do Something
        OSSpinLockUnlock(&lock)
    }
}

//MARK: - Unfair Lock
class PthreadUnfairLockTest {
    private var lock = os_unfair_lock_s()

    func test() {
        os_unfair_lock_lock(&lock)
        //Do Something
        os_unfair_lock_unlock(&lock)
    }
}

//MARK: - Synchronized
class NSThreadSynchronizedTest {
    private var lock = NSObject()

    func test() {
        objc_sync_enter(lock)
        //Do Something
        objc_sync_exit(lock)
    }
}

