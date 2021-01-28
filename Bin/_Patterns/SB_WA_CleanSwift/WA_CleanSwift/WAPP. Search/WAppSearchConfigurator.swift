//
//  WAppSearchSearchConfigurator.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol WAppSearchViewLogicProtocol: class {
    func display(displayType: WAppSearch.Action.Display.DisplayType)
}

protocol WAppSearchViewProtocol: class {
    var configurator: WAppSearchConfigurator { get set }
    var interactor: (WAppSearchInteractorLogicProtocol & WAppSearchDataStoreProtocol)? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol WAppSearchInteractorLogicProtocol: class {
    func interactorRequest(requestType: WAppSearch.Action.InteractorRequest.RequestType)
}

protocol WAppSearchInteractorProtocol: class {
    var presenter: WAppSearchPresenterLogicProtocol? { get set }
    var router: WAppSearchRouterLogicProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppSearchPresenterLogicProtocol: class {
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType)
}

protocol WAppSearchPresenterProtocol: class {
    var view: WAppSearchViewLogicProtocol? { get set }
}

//MARK: - Protocol. Router. Interactor -> Another View
protocol WAppSearchRouterLogicProtocol: class {
    func routeTo(routeType: WAppSearch.Route)
}

protocol WAppSearchRouterProtocol: class {
    var view: WAppSearchViewController? { get set }
}

//MARK: - Protocol. Interactor. Data Store
protocol WAppSearchDataStoreProtocol: class {
    var dataStore: WAppSearch.DataStore? { get set }
}

//MARK: - Protocol. Configurator
protocol WAppSearchConfiguratorProtocol: class {
    func configure(with view: WAppSearchViewController)
}

class WAppSearchConfigurator: WAppSearchConfiguratorProtocol {
    
    //MARK: - Configure
    func configure(with view: WAppSearchViewController) {
        let interactor            = WAppSearchInteractor()
        let presenter             = WAppSearchPresenter()
        let router                = WAppSearchRouter()
        let dataStore             = WAppSearch.DataStore()
        
        view.interactor           = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        interactor.dataStore      = dataStore
        presenter.view            = view
        router.view               = view
    }
    
}//
