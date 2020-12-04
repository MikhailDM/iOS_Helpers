//
//  WAppConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol WAppViewLogicProtocol {
    func display(displayType: WApp.Action.Display.DisplayType)
}

protocol WAppViewProtocol {
    var configurator: WAppConfigurator { get set }
    var presenter: (WAppPresenterLogicProtocol & WAppDataStoreProtocol)? { get set }
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol WAppPresenterLogicProtocol {
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType)
}

protocol WAppPresenterProtocol {
    var view: WAppViewLogicProtocol? { get set }
    var router: WAppRouterLogicProtocol? { get set }
    var interactor: WAppInputInteractorLogicProtocol? { get set }
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol WAppInputInteractorLogicProtocol: class {
    func interactorRequest(requestType: WApp.Action.InteractorRequest.RequestType)
}

protocol WAppInputInteractorProtocol: class {
    var presenter: WAppOutputInteractorProtocol? { get set }
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppOutputInteractorProtocol: class {
    func interactorResponse(responseType: WApp.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Router. Presenter -> Another View
protocol WAppRouterLogicProtocol {
    func routeTo(routeType: WApp.Route)
}

protocol WAppRouterProtocol {
    var viewController: WAppViewController? { get set }
    var dataStore: WAppDataStoreProtocol? { get set }
}


//MARK: - Protocol. Presenter/Router. Data Store
protocol WAppDataStoreProtocol {
    var dataStore: WApp.DataStore? { get set }
}


//MARK: - Protocol. Configurator
protocol WAppConfiguratorProtocol: class {
    func configure(with viewController: WAppViewController)
}


class WAppConfigurator: WAppConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: WAppViewController) {
        let interactor            = WAppInteractor()
        let presenter             = WAppPresenter()
        let router                = WAppRouter()
        let dataStore             = WApp.DataStore()
        
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
