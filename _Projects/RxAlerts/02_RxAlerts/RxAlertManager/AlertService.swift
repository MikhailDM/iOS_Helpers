//
//  AlertService.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020
//
//  Full Open Closed Service

import UIKit

//MARK: - Protocol. Alert Service
protocol AlertServiceLogic {
    func showAlert(controller: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style, buttons: [AlertButton])
    var buttons: AlertButtons { get }
}

//MARK: - Protocol. Alert Button
protocol AlertButton {
    var name: String { get set }
    var buttonPressed: () -> () { get set }
    var style: UIAlertAction.Style { get set }
}

struct AlertButtons {
    
    //MARK: - Configure Buttons
    func ok(style: UIAlertAction.Style, _ completion: @escaping () -> ()) -> AlertButton {
        return OkAlertButton(style: style) { completion() }
    }
    
    func cancel(style: UIAlertAction.Style, _ completion: @escaping () -> ()) -> AlertButton {
        return CancelAlertButton(style: style) { completion() }
    }
    
    func retry(style: UIAlertAction.Style, _ completion: @escaping () -> ()) -> AlertButton {
        return RetryAlertButton(style: style) { completion() }
    }
    
    //MARK: - Button Models
    struct OkAlertButton: AlertButton {
        var name: String = "Ок"
        var style: UIAlertAction.Style
        var buttonPressed: () -> ()
    }

    struct CancelAlertButton: AlertButton {
        var name: String = "Отменить"
        var style: UIAlertAction.Style
        var buttonPressed: () -> ()
    }
    
    struct RetryAlertButton: AlertButton {
        var name: String = "Повторить"
        var style: UIAlertAction.Style
        var buttonPressed: () -> ()
    }
}

//MARK: - Completion Alert Service
struct AlertService: AlertServiceLogic {
    
    //MARK: - All Buttons
    var buttons = AlertButtons()
    
    //MARK: - Universal Alert
    func showAlert(controller: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style, buttons: [AlertButton]) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        buttons.forEach { button in alertVC.addAction(UIAlertAction(title: button.name, style: button.style, handler: { _ in button.buttonPressed() })) }
        controller.present(alertVC, animated: true, completion: nil)
    }
}
