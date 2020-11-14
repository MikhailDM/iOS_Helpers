//
//  RxAlertManager.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//

import UIKit
import RxSwift


struct RxAlertManager {
    
    func showOKAlert(controller: UIViewController, title: String, text: String) -> Completable {
        return Completable.create { completable in
            let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Ок", style: .default, handler: {_ in
                completable(.completed)
            }))
            controller.present(alertVC, animated: true, completion: nil)
            return Disposables.create()
        }
    }
    
    func showOKAndRetryAlert(controller: UIViewController, title: String, text: String) -> Maybe<Void> {
        return Maybe.create { completable in
            let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Ок", style: .default, handler: {_ in
                completable(.completed)
            }))
            alertVC.addAction(UIAlertAction(title: "Повторить", style: .default, handler: {_ in
                completable(.success(()))
            }))
            controller.present(alertVC, animated: true, completion: nil)
            return Disposables.create()
        }
    }
}
