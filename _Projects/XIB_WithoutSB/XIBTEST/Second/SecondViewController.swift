//
//  SecondViewController.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECOND SCREEN TITLE"
    }
    
    @IBAction func backToFirstButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
