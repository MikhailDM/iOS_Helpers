//
//  RxAlertManager.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020
//

import UIKit
import RxSwift

struct RxAlertService {
    
    //MARK: - Properties
    let texts = Texts()
    
    //MARK: - Buttons
    enum ActionButton: String {
        case ok = "Ок"
        case cancel = "Отменить"
        case retry = "Повторить"
    }
    
    //MARK: - Messages
    struct Texts {
        let empty = ""
        let titles = Titles()
        let messages = Messages()
       
        struct Titles {
            let ok = "Ok Title"
            let okRetry = "Ok/Retry Title"
            let okRetryCancel = "Ok/Retry/Cancel Title"
        }
        
        struct Messages {
            let ok = "Ok Message"
            let okRetry = "Ok/Retry Message"
            let okRetryCancel = "Ok/Retry/Message"
        }
    }
    
    //MARK: - Universal Alert
    /// Show custom alert
    /// - Parameters:
    ///   - controller: UIViewController
    ///   - title: String
    ///   - message: String
    ///   - preferredStyle: Type of present
    ///   - actions: Type/Types of actions buttons
    /// - Returns: Type/Types of pressed buttons
    func showCustomAlert(controller: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style, actions: [(button: ActionButton, style: UIAlertAction.Style)]) -> Observable<ActionButton> {
        Observable<ActionButton>.create { observer in
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
            actions.forEach { action, style in alertVC.addAction(UIAlertAction(title: action.rawValue, style: style, handler: { _ in observer.onNext(action) })) }
            controller.present(alertVC, animated: true, completion: nil)
            return Disposables.create()
        }
    }
    
}//
