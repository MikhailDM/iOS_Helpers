//
//  RxAlertManager.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020
//

import UIKit

//MARK: - Protocol. Alert Service
protocol AlertServiceLogic {
    func showCustomAlert(controller: UIViewController, title: String, message: String, style: UIAlertController.Style,
                                   actions: [(button: AlertServiceActionButtons, style: UIAlertAction.Style)],
                                   _ completion: @escaping (AlertServiceActionButtons) -> ())
}

//MARK: - Buttons
enum AlertServiceActionButtons {
    case ok
    case cancel
    case retry
    
    var localizedButtonText: String {
        switch self {
        case .ok:       return "Ок"
        case .cancel:   return "Отменить"
        case .retry:    return "Повторить"
        }
    }
}

//MARK: - Completion Alert Service
struct AlertService: AlertServiceLogic {
    
    //MARK: - Universal Alert
    func showCustomAlert(controller: UIViewController, title: String, message: String, style: UIAlertController.Style,
                                   actions: [(button: AlertServiceActionButtons, style: UIAlertAction.Style)], _ completion: @escaping (AlertServiceActionButtons) -> ()) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action, style in alertVC.addAction(UIAlertAction(title: action.localizedButtonText, style: style, handler: { _ in completion(action) })) }
        controller.present(alertVC, animated: true, completion: nil)
    }
}

//RxVersion
//func showCustomAlert(controller: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style,
//                     actions: [(button: AlertServiceActionButtons, style: UIAlertAction.Style)]) -> Observable<AlertServiceActionButtons> {
//    Observable<AlertServiceActionButtons>.create { observer in
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
//        actions.forEach { action, style in alertVC.addAction(UIAlertAction(title: action.rawValue, style: style, handler: { _ in observer.onNext(action) })) }
//        controller.present(alertVC, animated: true, completion: nil)
//        return Disposables.create()
//    }
//}
