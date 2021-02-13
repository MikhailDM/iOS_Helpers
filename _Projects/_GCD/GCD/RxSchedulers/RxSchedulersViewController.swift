//
//  RxSchedulersViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 13.02.2021.
//

import UIKit
import RxSwift

class RxSchedulersViewController: UIViewController {
    
    let mainScheduler = MainScheduler()
    let globalScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    let serialScheduler = SerialDispatchQueueScheduler(internalSerialQueueName: "SerialDispatchQueueScheduler")
    let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)
    let operationsScheduler = OperationQueueScheduler(operationQueue: OperationQueue())
    let disposeBag = DisposeBag()
    
    let animal = BehaviorSubject(value: "[dog]")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsFunc()
    }
    
    func fruitsFunc() {
        let fruit = Observable<String>.create { observer in
          observer.onNext("[apple]")
          sleep(2)
          observer.onNext("[pineapple]")
          sleep(2)
          observer.onNext("[strawberry]")
          return Disposables.create()
        }

        fruit
            .subscribe(on: concurrentScheduler)
            .dump()
            .observe(on: MainScheduler.instance)
            .dumpingSubscription()
            .disposed(by: disposeBag)
    }
}

extension ObservableType {

    func dump() -> RxSwift.Observable<Self.Element> {
        return self.do(onNext: { element in
            let threadName = getThreadName()
            print("\(secondsElapsed())s | [D] \(element) received on \(threadName)")
        })
    }

    func dumpingSubscription() -> Disposable {
        return self.subscribe(onNext: { element in
            let threadName = getThreadName()
            print("\(secondsElapsed())s | [S] \(element) received on \(threadName)")
        })
    }
    
    private func getThreadName() -> String {
        if Thread.current.isMainThread {
            return "Main Thread"
        } else if let name = Thread.current.name {
            if name == "" {
                return "Anonymous Thread"
            }
            return name
        } else {
            return "Unknown Thread"
        }
    }
    private func secondsElapsed() -> String {
        return String(format: "%02i", Int(Date().timeIntervalSince(Date()).rounded()))
    }
}
