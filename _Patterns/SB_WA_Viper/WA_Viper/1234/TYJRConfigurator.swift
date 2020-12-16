//
//  TYJRConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 15.12.2020
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol TYJRViewLogicProtocol {
    func display(displayType: TYJR.Action.Display.DisplayType)
}

protocol TYJRViewProtocol {
    var configurator: TYJRConfigurator { get set }
    var presenter: (TYJRPresenterLogicProtocol & TYJRDataStoreProtocol)? { get set }
} 

//MARK: - Protocol. Presenter. View -> Presenter
protocol TYJRPresenterLogicProtocol {
    func presenterRequest(requestType: TYJR.Action.PresenterRequest.RequestType)
}

protocol TYJRPresenterProtocol {
    var view: TYJRViewLogicProtocol? { get set }
    var router: TYJRRouterLogicProtocol? { get set }
    var interactor: TYJRInputInteractorLogicProtocol? { get set }
}

//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol TYJRInputInteractorLogicProtocol: class {
    func interactorRequest(requestType: TYJR.Action.InteractorRequest.RequestType)
}

protocol TYJRInputInteractorProtocol: class {
    var presenter: TYJROutputInteractorProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol TYJROutputInteractorProtocol: class {
    func interactorResponse(responseType: TYJR.Action.InteractorResponse.ResponseType)
}

//MARK: - Protocol. Router. Presenter -> Another View
protocol TYJRRouterLogicProtocol {
    func routeTo(routeType: TYJR.Route)
}

protocol TYJRRouterProtocol {
    var view: TYJRViewController? { get set }
}

//MARK: - Protocol. Presenter/Router. Data Store
protocol TYJRDataStoreProtocol {
    var dataStore: TYJR.DataStore? { get set }
}

//MARK: - Protocol. Configurator
protocol TYJRConfiguratorProtocol: class {
    func configure(with view: TYJRViewController)
}

class TYJRConfigurator: TYJRConfiguratorProtocol {
    
    //MARK: - Configure
    func configure(with view: TYJRViewController) {
        let interactor            = TYJRInteractor()
        let presenter             = TYJRPresenter()
        let router                = TYJRRouter()
        let dataStore             = TYJR.DataStore()
        
        view.presenter            = presenter
        presenter.view            = view
        presenter.router          = router
        presenter.interactor      = interactor
        presenter.dataStore       = dataStore
        interactor.presenter      = presenter
        router.view               = view
    }
    
}//

