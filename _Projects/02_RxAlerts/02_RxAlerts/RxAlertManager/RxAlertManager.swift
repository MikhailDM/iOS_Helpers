//
//  RxAlertManager.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//

import UIKit
import RxSwift


struct RxAlertManager {
    //MARK: - Properties
    enum ActionButtons: String {
        case ok = "Ок"
        case cancel = "Отменить"
        case retry = "Повторить"
    }
    
    
    //MARK: - Universal Alert
    /// Show custom alert
    /// - Parameters:
    ///   - controller: UIViewController
    ///   - title: String
    ///   - text: String
    ///   - actions: Type/Types of actions buttons
    /// - Returns: Type/Types of pressed buttons
    func showCustomAlert(controller: UIViewController, title: String, text: String, actions: [ActionButtons]) -> Observable<ActionButtons> {
        Observable<ActionButtons>.create { observer in
            let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
            actions.forEach { action in
                alertVC.addAction(UIAlertAction(title: action.rawValue, style: .default, handler: { _ in observer.onNext(action) }))
            }
            controller.present(alertVC, animated: true, completion: nil)
            return Disposables.create()
        }
    }
    
}//
