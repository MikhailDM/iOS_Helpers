//
//  MainViewController.swift
//  GCD
//
//  Created by Mikhail Dmitriev on 11.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }
    
    @IBAction func threadButtonPressed(_ sender: UIButton) {
        navigationController?.pushViewController(ThreadViewController(), animated: true)
    }
    @IBAction func queuesButtonPressed(_ sender: UIButton) {
        navigationController?.pushViewController(QueuesViewController(), animated: true)
    }
    
    @IBAction func operationsButoonPressed(_ sender: UIButton) {
        navigationController?.pushViewController(OperationsViewController(), animated: true)
    }
    
    @IBAction func problemsButtonPressed(_ sender: UIButton) {
        navigationController?.pushViewController(ProblemsViewController(), animated: true)
    }
}
