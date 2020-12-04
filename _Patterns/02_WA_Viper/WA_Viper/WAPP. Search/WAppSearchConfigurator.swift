//
//  WAppSearchConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol WAppSearchViewProtocol {
    var configurator: WAppSearchConfigurator { get set }
    var presenter: WAppSearchPresenterProtocol? { get set }
    func display(displayType: WAppSearch.Action.Display.DisplayType)
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol WAppSearchPresenterProtocol {
    var view: WAppSearchViewProtocol? { get set }
    var router: WAppSearchRouterProtocol? { get set }
    var interactor: WAppSearchInputInteractorProtocol? { get set }
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType)
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol WAppSearchInputInteractorProtocol: class {
    var presenter: WAppSearchOutputInteractorProtocol? { get set }
    func interactorRequest(requestType: WAppSearch.Action.InteractorRequest.RequestType)
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppSearchOutputInteractorProtocol: class {
    func interactorResponse(responseType: WAppSearch.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Presenter. Presenter -> Another View
protocol WAppSearchRouterProtocol {
    var viewController: WAppSearchViewController? { get set }
    var dataStore: WAppSearchDataStoreProtocol? { get set }
    func routeToView(view: WAppSearch.Route)
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

