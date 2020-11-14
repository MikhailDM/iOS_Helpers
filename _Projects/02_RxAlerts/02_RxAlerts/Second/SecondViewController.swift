//
//  SecondViewController.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class SecondViewController: UIViewController, SecondDisplayLogic {
    //MARK: - Settings
    var interactor: SecondBusinessLogic?
    var router: (NSObjectProtocol & SecondRoutingLogic & SecondDataPassing)?
    lazy var configurator: SecondConfiguratorProtocol = SecondConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var showOKAlertButton: UIButton!
    @IBOutlet weak var showRetryAlertButton: UIButton!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - Managers
    private let alerts = RxAlertManager()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        subscribeToShowOKAlertButton()
        subscribeToShowRetryAlert()
    }
    
    deinit {
        print("DEINITED - SecondViewController")
    }
    
    
    //MARK: - Display data
    func displayData(toDisplay: Second.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    private func configureDesign() {
//        title = "Title"
//        navigationItem.backButtonTitle = ""
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    //MARK: - Rx
    private func subscribeToShowOKAlertButton() {
        showOKAlertButton.rx.tap.subscribe(onNext: {
            self.showOkAlert()
        })
        .disposed(by: disposeBag)
    }
    
    private func subscribeToShowRetryAlert() {
        showRetryAlertButton.rx.tap.subscribe(onNext: {
            self.showRetryAlert()
        })
        .disposed(by: disposeBag)
    }
    
    
    //MARK: - Alerts
    private func showOkAlert() {
        alerts.showOKAlert(controller: self, title: "", text: "Ok Alert")
            .subscribe(onCompleted: {
                print("===================")
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func showRetryAlert() {
        alerts.showOKAndRetryAlert(controller: self, title: "Title", text: "Retry Alert")
            .subscribe(
                onSuccess: {
                    print("===== RETRY")
                },
                onCompleted: {
                    self.navigationController?.popViewController(animated: true)
                })
            .disposed(by: disposeBag)
    }
    
}//
