//
//  WAppConfigurator.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol WAppViewLogicProtocol: class {
    func display(displayType: WApp.Action.Display.DisplayType)
}

protocol WAppViewProtocol: class {
    var configurator: WAppConfigurator { get set }
    var interactor: (WAppInteractorLogicProtocol & WAppDataStoreProtocol)? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol WAppInteractorLogicProtocol: class {
    func interactorRequest(requestType: WApp.Action.InteractorRequest.RequestType)
}

protocol WAppInteractorProtocol: class {
    var presenter: WAppPresenterLogicProtocol? { get set }
    var router: WAppRouterLogicProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppPresenterLogicProtocol: class {
    func presenterRequest(requestType: WApp.Action.PresenterRequest.RequestType)
}

protocol WAppPresenterProtocol: class {
    var view: WAppViewLogicProtocol? { get set }
}

//MARK: - Protocol. Router. Interactor -> Another View
protocol WAppRouterLogicProtocol: class {
    func routeTo(routeType: WApp.Route)
}

protocol WAppRouterProtocol: class {
    var view: WAppViewController? { get set }
}

//MARK: - Protocol. Interactor. Data Store
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
        
        view.interactor           = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        interactor.dataStore      = dataStore
        presenter.view            = view
        router.view               = view
    }
    
}//
