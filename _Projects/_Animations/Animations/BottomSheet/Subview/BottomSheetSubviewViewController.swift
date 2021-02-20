//
//  BottomSheetSubviewViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetSubviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 10
    }
    
    @IBAction func childButtonClick(_ sender: UIButton) {
        print("===== Child View Button Click")
    }
}
