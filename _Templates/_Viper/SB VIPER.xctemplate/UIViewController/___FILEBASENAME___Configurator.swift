//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___SearchViewLogicProtocol {
    func display(displayType: ___VARIABLE_sceneName___Search.Action.Display.DisplayType)
}

protocol ___VARIABLE_sceneName___SearchViewProtocol {
    var configurator: ___VARIABLE_sceneName___SearchConfigurator { get set }
    var presenter: (___VARIABLE_sceneName___SearchPresenterLogicProtocol & ___VARIABLE_sceneName___SearchDataStoreProtocol)? { get set }
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol ___VARIABLE_sceneName___SearchPresenterLogicProtocol {
    func presenterRequest(requestType: ___VARIABLE_sceneName___Search.Action.PresenterRequest.RequestType)
}

protocol ___VARIABLE_sceneName___SearchPresenterProtocol {
    var view: ___VARIABLE_sceneName___SearchViewLogicProtocol? { get set }
    var router: ___VARIABLE_sceneName___SearchRouterLogicProtocol? { get set }
    var interactor: ___VARIABLE_sceneName___SearchInputInteractorLogicProtocol? { get set }
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol ___VARIABLE_sceneName___SearchInputInteractorLogicProtocol: class {
    func interactorRequest(requestType: ___VARIABLE_sceneName___Search.Action.InteractorRequest.RequestType)
}

protocol ___VARIABLE_sceneName___SearchInputInteractorProtocol: class {
    var presenter: ___VARIABLE_sceneName___SearchOutputInteractorProtocol? { get set }
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___SearchOutputInteractorProtocol: class {
    func interactorResponse(responseType: ___VARIABLE_sceneName___Search.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Router. Presenter -> Another View
protocol ___VARIABLE_sceneName___SearchRouterLogicProtocol {
    func routeTo(routeType: ___VARIABLE_sceneName___Search.Route)
}

protocol ___VARIABLE_sceneName___SearchRouterProtocol {
    var viewController: ___VARIABLE_sceneName___SearchViewController? { get set }
    var dataStore: ___VARIABLE_sceneName___SearchDataStoreProtocol? { get set }
}


//MARK: - Protocol. Presenter/Router. Data Store
protocol ___VARIABLE_sceneName___SearchDataStoreProtocol {
    var dataStore: ___VARIABLE_sceneName___Search.DataStore? { get set }
}


//MARK: - Protocol. Configurator
protocol ___VARIABLE_sceneName___SearchConfiguratorProtocol: class {
    func configure(with viewController: ___VARIABLE_sceneName___SearchViewController)
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

