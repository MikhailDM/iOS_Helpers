//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___ViewLogicProtocol {
    func display(displayType: ___VARIABLE_sceneName___.Action.Display.DisplayType)
}

protocol ___VARIABLE_sceneName___ViewProtocol {
    var configurator: ___VARIABLE_sceneName___Configurator { get set }
    var presenter: (___VARIABLE_sceneName___PresenterLogicProtocol & ___VARIABLE_sceneName___DataStoreProtocol)? { get set }
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol ___VARIABLE_sceneName___PresenterLogicProtocol {
    func presenterRequest(requestType: ___VARIABLE_sceneName___.Action.PresenterRequest.RequestType)
}

protocol ___VARIABLE_sceneName___PresenterProtocol {
    var view: ___VARIABLE_sceneName___ViewLogicProtocol? { get set }
    var router: ___VARIABLE_sceneName___RouterLogicProtocol? { get set }
    var interactor: ___VARIABLE_sceneName___InputInteractorLogicProtocol? { get set }
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol ___VARIABLE_sceneName___InputInteractorLogicProtocol: class {
    func interactorRequest(requestType: ___VARIABLE_sceneName___.Action.InteractorRequest.RequestType)
}

protocol ___VARIABLE_sceneName___InputInteractorProtocol: class {
    var presenter: ___VARIABLE_sceneName___OutputInteractorProtocol? { get set }
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___OutputInteractorProtocol: class {
    func interactorResponse(responseType: ___VARIABLE_sceneName___.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Router. Presenter -> Another View
protocol ___VARIABLE_sceneName___RouterLogicProtocol {
    func routeTo(routeType: ___VARIABLE_sceneName___.Route)
}

protocol ___VARIABLE_sceneName___RouterProtocol {
    var viewController: ___VARIABLE_sceneName___ViewController? { get set }
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol? { get set }
}


//MARK: - Protocol. Presenter/Router. Data Store
protocol ___VARIABLE_sceneName___DataStoreProtocol {
    var dataStore: ___VARIABLE_sceneName___.DataStore? { get set }
}


//MARK: - Protocol. Configurator
protocol ___VARIABLE_sceneName___ConfiguratorProtocol: class {
    func configure(with viewController: ___VARIABLE_sceneName___ViewController)
}


class ___VARIABLE_sceneName___Configurator: ___VARIABLE_sceneName___ConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: ___VARIABLE_sceneName___ViewController) {
        let interactor            = ___VARIABLE_sceneName___Interactor()
        let presenter             = ___VARIABLE_sceneName___Presenter()
        let router                = ___VARIABLE_sceneName___Router()
        let dataStore             = ___VARIABLE_sceneName___.DataStore()
        
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

