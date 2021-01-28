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
    private let alerts: AlertServiceLogic = AlertService()
    
    
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
        alerts.showCustomAlert(controller: self, title: "", message: "Message", style: .actionSheet,
                               actions: [(button: .ok, style: .default)]) { [weak self] buttonPressed in
            if buttonPressed == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
        }
    }
    
    private func showRetryAlert() {
        alerts.showCustomAlert(controller: self, title: "", message: "Message", style: .actionSheet,
                               actions: [(button: .ok, style: .default), (button: .retry, style: .default)]) { [weak self] buttonPressed in
            if buttonPressed == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
            if buttonPressed == .retry { print("===== RETRY PRESSED") }
        }
    }
    
    private func showMultiButtonsAlert() {
        alerts.showCustomAlert(controller: self, title: "", message: "Message", style: .actionSheet,
                               actions: [(button: .ok, style: .default), (button: .retry, style: .destructive), (button: .cancel, style: .cancel)]) { [weak self] buttonPressed in
            if buttonPressed == .ok { print("===== OK PRESSED"); self?.navigationController?.popViewController(animated: true) }
            if buttonPressed == .retry { print("===== RETRY PRESSED") }
            if buttonPressed == .cancel { print("===== CANCEL PRESSED") }
        }
    }
}
