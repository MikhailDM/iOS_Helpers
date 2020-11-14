//
//  SecondConfigurator.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Request
protocol SecondBusinessLogic {
    func makeRequest(request: Second.Model.Request.RequestType)
}


//MARK: - Protocol. Present
protocol SecondPresentationLogic {
    func presentData(response: Second.Model.Response.ResponseType)
}


//MARK: - Protocol. Display
protocol SecondDisplayLogic: class {
    func displayData(toDisplay: Second.Model.ViewModel.ViewModelData)
}


//MARK: - Protocol. Data Passing
protocol SecondDataPassing {
    var dataStore: SecondDataStore? { get set }
}


//MARK: - Protocol. Configure
protocol SecondConfiguratorProtocol: class {
    func configure(with viewController: SecondViewController)
}


class SecondConfigurator: SecondConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: SecondViewController) {
        let interactor            = SecondInteractor()
        let presenter             = SecondPresenter()
        let router                = SecondRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
}//
