//
//  WAppSearchConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol WAppSearchViewLogicProtocol {
    func display(displayType: WAppSearch.Action.Display.DisplayType)
}

protocol WAppSearchViewProtocol {
    var configurator: WAppSearchConfigurator { get set }
    var presenter: (WAppSearchPresenterLogicProtocol & WAppSearchDataStoreProtocol)? { get set }
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol WAppSearchPresenterLogicProtocol {
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType)
}

protocol WAppSearchPresenterProtocol {
    var view: WAppSearchViewLogicProtocol? { get set }
    var router: WAppSearchRouterLogicProtocol? { get set }
    var interactor: WAppSearchInputInteractorLogicProtocol? { get set }
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol WAppSearchInputInteractorLogicProtocol: class {
    func interactorRequest(requestType: WAppSearch.Action.InteractorRequest.RequestType)
}

protocol WAppSearchInputInteractorProtocol: class {
    var presenter: WAppSearchOutputInteractorProtocol? { get set }
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppSearchOutputInteractorProtocol: class {
    func interactorResponse(responseType: WAppSearch.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Router. Presenter -> Another View
protocol WAppSearchRouterLogicProtocol {
    func routeTo(routeType: WAppSearch.Route)
}

protocol WAppSearchRouterProtocol {
    var viewController: WAppSearchViewController? { get set }
    var dataStore: WAppSearchDataStoreProtocol? { get set }
}


//MARK: - Protocol. Presenter/Router. Data Store
protocol WAppSearchDataStoreProtocol {
    var dataStore: WAppSearch.DataStore? { get set }
}


//MARK: - Protocol. Configurator
protocol WAppSearchConfiguratorProtocol: class {
    func configure(with viewController: WAppSearchViewController)
}


class WAppSearchConfigurator: WAppSearchConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: WAppSearchViewController) {
        let interactor            = WAppSearchInteractor()
        let presenter             = WAppSearchPresenter()
        let router                = WAppSearchRouter()
        let dataStore             = WAppSearch.DataStore()
        
        viewController.presenter  = presenter
        presenter.view            = viewController
        presenter.router          = router
        presenter.interactor      = interactor
        presenter.dataStore       = dataStore
        interactor.presenter      = presenter
        router.viewController     = viewController
        router.dataStore = presenter
    }
}//

