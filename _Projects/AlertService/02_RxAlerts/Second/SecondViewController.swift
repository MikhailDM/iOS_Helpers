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
        print("Loaded - SecondViewController")
    }
    
    deinit {
        print("Deinited - SecondViewController")
    }
    
    
    //MARK: - Display data
    func displayData(toDisplay: Second.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Private
    private func configureDesign() { }
    
    
    //MARK: - Rx
    private func subscribeToShowOKAlertButton() {
        showOKAlertButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.showOkAlert()
        }).disposed(by: disposeBag)
    }
    
    private func subscribeToShowRetryAlert() {
        showRetryAlertButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.showRetryAlert()
        }).disposed(by: disposeBag)
    }
    
    private func subscribeToShowRetryCancelAlert() {
        showRetryCancelAlertButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.showMultiButtonsAlert()
        }).disposed(by: disposeBag)
    }
    
    
    //MARK: - Alerts
    private func showOkAlert() {
        let ok = alerts.buttons.ok(style: .default) { [weak self] in self?.navigationController?.popViewController(animated: true) }
        alerts.showAlert(controller: self, title: "Ok", message: "Ok Message", preferredStyle: .alert, buttons: [ok])
    }
    
    private func showRetryAlert() {
        let ok = alerts.buttons.ok(style: .default) { [weak self] in self?.navigationController?.popViewController(animated: true) }
        let retry = alerts.buttons.retry(style: .default) { print("===== Retry Pressed") }
        alerts.showAlert(controller: self, title: "Ok/Retry", message: "Ok/Retry Message", preferredStyle: .alert, buttons: [ok, retry])
    }
    
    private func showMultiButtonsAlert() {
        let ok = alerts.buttons.ok(style: .default) { [weak self] in self?.navigationController?.popViewController(animated: true) }
        let retry = alerts.buttons.retry(style: .cancel) { print("===== Retry Pressed") }
        let cancel = alerts.buttons.cancel(style: .destructive) { print("===== Cancel Pressed") }
        alerts.showAlert(controller: self, title: "Ok/Retry/Cancel", message: "Ok/Retry/Cancel Message", preferredStyle: .alert, buttons: [ok, retry, cancel])
    }
}
