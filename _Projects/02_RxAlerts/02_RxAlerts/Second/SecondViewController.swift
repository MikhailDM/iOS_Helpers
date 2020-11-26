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
    @IBOutlet weak var showRetryCancelAlertButton: UIButton!
    
    
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
        subscribeToShowRetryCancelAlert()
    }
    
    deinit {
        print("DEINITED - SecondViewController")
    }
    
    
    //MARK: - Display data
    func displayData(toDisplay: Second.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Private
    private func configureDesign() { }
    
    
    //MARK: - Rx
    private func subscribeToShowOKAlertButton() {
        showOKAlertButton.rx.tap.subscribe(onNext: {
            self.showOkAlert()
        }).disposed(by: disposeBag)
    }
    
    private func subscribeToShowRetryAlert() {
        showRetryAlertButton.rx.tap.subscribe(onNext: {
            self.showRetryAlert()
        }).disposed(by: disposeBag)
    }
    
    private func subscribeToShowRetryCancelAlert() {
        showRetryCancelAlertButton.rx.tap.subscribe(onNext: {
            self.showMultiButtonsAlert()
        }).disposed(by: disposeBag)
    }
    
    
    //MARK: - Alerts
    private func showOkAlert() {
        alerts.showCustomAlert(controller: self, title: "Ok Title", text: "Ok Alert", actions: [.ok])
            .subscribe(onNext: { [weak self] action in
                if action == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
            }).disposed(by: disposeBag)
    }
    
    private func showRetryAlert() {
        alerts.showCustomAlert(controller: self, title: "Ok/Retry Title", text: "Ok/Retry Alert", actions: [.ok, .retry])
            .subscribe(onNext: { [weak self] action in
                if action == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
                if action == .retry { print("===== RETRY PRESSED") }
            }).disposed(by: disposeBag)
    }
    
    private func showMultiButtonsAlert() {
        alerts.showCustomAlert(controller: self, title: "Ok/Retry/Cancel Title", text: "Ok/Retry/Cancel Alert", actions: [.ok, .retry, .cancel])
            .subscribe(onNext: { [weak self] action in
                if action == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
                if action == .retry { print("===== RETRY PRESSED") }
                if action == .cancel { print("===== CANCEL PRESSED") }
            }).disposed(by: disposeBag)
    }
    
}//
