//
//  FirstViewController.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FIRST SCREEN TITLE"
    }
    
    @IBAction func goToSecondPressed(_ sender: UIButton) {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
