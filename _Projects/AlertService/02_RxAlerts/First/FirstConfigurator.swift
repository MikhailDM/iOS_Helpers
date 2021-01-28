//
//  FirstConfigurator.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Request
protocol FirstBusinessLogic {
    func makeRequest(request: First.Model.Request.RequestType)
}


//MARK: - Protocol. Present
protocol FirstPresentationLogic {
    func presentData(response: First.Model.Response.ResponseType)
}


//MARK: - Protocol. Display
protocol FirstDisplayLogic: class {
    func displayData(toDisplay: First.Model.ViewModel.ViewModelData)
}


//MARK: - Protocol. Data Passing
protocol FirstDataPassing {
    var dataStore: FirstDataStore? { get set }
}


//MARK: - Protocol. Configure
protocol FirstConfiguratorProtocol: class {
    func configure(with viewController: FirstViewController)
}


class FirstConfigurator: FirstConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: FirstViewController) {
        let interactor            = FirstInteractor()
        let presenter             = FirstPresenter()
        let router                = FirstRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
}//
