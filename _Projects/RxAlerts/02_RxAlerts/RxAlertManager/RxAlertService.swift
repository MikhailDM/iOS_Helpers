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
    case proceed
    
    var localizedButtonText: String {
        switch self {
        case .ok:       return "Ок"
        case .cancel:   return "Отменить"
        case .retry:    return "Повторить"
        case .proceed:  return "Продолжить"
        }
    }
}






protocol AlertButton {
    var name: String { get set }
    var buttonPressed: () -> () { get set }
    var style: UIAlertAction.Style { get set }
    //func executeButtonPress(_ completion: @escaping () -> ())
}

struct AlertButtons {
    struct OkAlertButton: AlertButton  {
        var name: String = "Ок"
        var style: UIAlertAction.Style
        var buttonPressed: () -> ()
    }
}

//MARK: - Completion Alert Service
struct AlertService: AlertServiceLogic {
//    func OkAlertButton() -> AlertButtons.OkAlertButton {
//        return AlertButtons.OkAlertButton(
//
//    }
    
    
    
    //MARK: - Universal Alert
    func showCustomAlertSOLID(controller: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style, buttons: [AlertButton]) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        buttons.forEach { button in alertVC.addAction(UIAlertAction(title: button.name, style: button.style, handler: { _ in button.buttonPressed() })) }
        controller.present(alertVC, animated: true, completion: nil)
    }
    
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
