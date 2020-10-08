//
//  AlertManager.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//

import UIKit

struct AlertManager {
    
    func showInfoAlert(view: UIViewController, title: String, infoText: String) {
        let alert = UIAlertController(title: title,
                                      message: infoText,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}
