//
//  FirstViewController.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class FirstViewController: UIViewController, FirstDisplayLogic {
    //MARK: - Settings
    var interactor: FirstBusinessLogic?
    var router: (NSObjectProtocol & FirstRoutingLogic & FirstDataPassing)?
    lazy var configurator: FirstConfiguratorProtocol = FirstConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var goToSecondButton: UIButton!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        subscribeToRouteToSecondScreen()
    }
    
    deinit {
        print("DEINITED - FirstViewController")
    }
    
    
    //MARK: - Display data
    func displayData(toDisplay: First.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    private func configureDesign() {
//        title = "Title"
//        navigationItem.backButtonTitle = ""
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    //MARK: - Extension. Rx
    private func subscribeToRouteToSecondScreen() {
        goToSecondButton.rx.tap.subscribe { [weak self] _ in self?.router?.routeToSecond() }
            .disposed(by: disposeBag)
    }
    
}//
