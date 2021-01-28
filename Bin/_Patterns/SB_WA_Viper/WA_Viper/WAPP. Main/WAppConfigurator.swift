//
//  WAppConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol WAppViewLogicProtocol: class {
    func display(displayType: WApp.Action.Display.DisplayType)
}

protocol WAppViewProtocol: class {
    var configurator: WAppConfigurator { get set }
    var presenter: (WAppPresenterLogicProtocol & WAppDataStoreProtocol)? { get set }
}

//MARK: - Protocol. Presenter. View -> Presenter
protocol WAppPresenterLogicProtocol: class {
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType)
}

protocol WAppPresenterProtocol: class {
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
protocol WAppRouterLogicProtocol: class {
    func routeTo(routeType: WApp.Route)
}

protocol WAppRouterProtocol: class {
    var view: WAppViewController? { get set }
}

//MARK: - Protocol. Presenter/Router. Data Store
protocol WAppDataStoreProtocol: class {
    var dataStore: WApp.DataStore? { get set }
}

//MARK: - Protocol. Configurator
protocol WAppConfiguratorProtocol: class {
    func configure(with view: WAppViewController)
}

class WAppConfigurator: WAppConfiguratorProtocol {
    //MARK: - Configure
    func configure(with view: WAppViewController) {
        let interactor            = WAppInteractor()
        let presenter             = WAppPresenter()
        let router                = WAppRouter()
        let dataStore             = WApp.DataStore()
        
        view.presenter  = presenter
        presenter.view            = view
        presenter.router          = router
        presenter.interactor      = interactor
        presenter.dataStore       = dataStore
        interactor.presenter      = presenter
        router.view               = view
    }
    
}//
