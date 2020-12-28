//
//  TTTTConfigurator.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol TTTTViewLogicProtocol: class {
    func display(displayType: TTTTLogic.Action.Display.DisplayType)
}

protocol TTTTViewProtocol: class {
    var configurator: TTTTConfigurator { get set }
    var interactor: (TTTTInteractorLogicProtocol & TTTTDataStoreProtocol)? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol TTTTInteractorLogicProtocol: class {
    func interactorRequest(requestType: TTTTLogic.Action.InteractorRequest.RequestType)
}

protocol TTTTInteractorProtocol: class {
    var presenter: TTTTPresenterLogicProtocol? { get set }
    var router: TTTTRouterLogicProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol TTTTPresenterLogicProtocol: class {
    func presenterRequest(requestType: TTTTLogic.Action.PresenterRequest.RequestType)
}

protocol TTTTPresenterProtocol: class {
    var view: TTTTViewLogicProtocol? { get set }
}

//MARK: - Protocol. Router. Interactor -> Another View
protocol TTTTRouterLogicProtocol: class {
    func routeTo(routeType: TTTTLogic.Route)
}

protocol TTTTRouterProtocol: class {
    var view: TTTTViewController? { get set }
}

//MARK: - Protocol. Interactor. Data Store
protocol TTTTDataStoreProtocol: class {
    var dataStore: TTTTLogic.DataStore? { get set }
}

//MARK: - Protocol. Configurator
protocol TTTTConfiguratorProtocol: class {
    func configure(with view: TTTTViewController)
}

//MARK: - Configurator
class TTTTConfigurator: TTTTConfiguratorProtocol {
    
    func configure(with view: TTTTViewController) {
        let interactor            = TTTTInteractor()
        let presenter             = TTTTPresenter()
        let router                = TTTTRouter()
        let dataStore             = TTTTLogic.DataStore()
        
        view.interactor           = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        interactor.dataStore      = dataStore
        presenter.view            = view
        router.view               = view
    }
    
}//
