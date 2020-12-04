//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___ViewProtocol {
    var configurator: ___VARIABLE_sceneName___Configurator { get set }
    var presenter: ___VARIABLE_sceneName___PresenterProtocol? { get set }
    func display(displayType: ___VARIABLE_sceneName___.Action.Display.DisplayType)
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol ___VARIABLE_sceneName___PresenterProtocol {
    var view: ___VARIABLE_sceneName___ViewProtocol? { get set }
    var router: ___VARIABLE_sceneName___RouterProtocol? { get set }
    var interactor: ___VARIABLE_sceneName___InputInteractorProtocol? { get set }
    func presenterRequest(requestType: ___VARIABLE_sceneName___.Action.PresenterRequest.RequestType)
}


//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol ___VARIABLE_sceneName___InputInteractorProtocol: class {
    var presenter: ___VARIABLE_sceneName___OutputInteractorProtocol? { get set }
    func interactorRequest(requestType: ___VARIABLE_sceneName___.Action.InteractorRequest.RequestType)
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___OutputInteractorProtocol: class {
    func interactorResponse(responseType: ___VARIABLE_sceneName___.Action.InteractorResponse.ResponseType)
}


//MARK: - Protocol. Presenter. Presenter -> Another View
protocol ___VARIABLE_sceneName___RouterProtocol {
    var viewController: ___VARIABLE_sceneName___ViewController? { get set }
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol? { get set }
    func routeToView(view: ___VARIABLE_sceneName___.Route)
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

