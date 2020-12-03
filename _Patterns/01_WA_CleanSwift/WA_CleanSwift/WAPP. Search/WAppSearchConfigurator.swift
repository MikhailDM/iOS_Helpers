//
//  WAppSearchConfigurator.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Request
protocol WAppSearchBusinessLogic {
    func makeRequest(request: WAppSearch.Model.Request.RequestType)
}


//MARK: - Protocol. Present
protocol WAppSearchPresentationLogic {
    func presentData(response: WAppSearch.Model.Response.ResponseType)
}


//MARK: - Protocol. Display
protocol WAppSearchDisplayLogic: class {
    func displayData(toDisplay: WAppSearch.Model.ViewModel.ViewModelData)
}


//MARK: - Protocol. Data Passing
protocol WAppSearchDataPassing {
    var dataStore: WAppSearchDataStore? { get set }
}


//MARK: - Protocol. Configure
protocol WAppSearchConfiguratorProtocol: class {
    func configure(with viewController: WAppSearchViewController)
}


class WAppSearchConfigurator: WAppSearchConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: WAppSearchViewController) {
        let interactor            = WAppSearchInteractor()
        let presenter             = WAppSearchPresenter()
        let router                = WAppSearchRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
}//
