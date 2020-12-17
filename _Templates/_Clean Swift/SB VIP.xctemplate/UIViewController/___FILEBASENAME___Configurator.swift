//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___ViewLogicProtocol: class {
    func display(displayType: ___VARIABLE_sceneName___.Action.Display.DisplayType)
}

protocol ___VARIABLE_sceneName___ViewProtocol: class {
    var configurator: ___VARIABLE_sceneName___Configurator { get set }
    var interactor: (___VARIABLE_sceneName___InteractorLogicProtocol & ___VARIABLE_sceneName___DataStoreProtocol)? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol ___VARIABLE_sceneName___InteractorLogicProtocol: class {
    func interactorRequest(requestType: ___VARIABLE_sceneName___.Action.InteractorRequest.RequestType)
}

protocol ___VARIABLE_sceneName___InteractorProtocol: class {
    var presenter: ___VARIABLE_sceneName___PresenterLogicProtocol? { get set }
    var router: ___VARIABLE_sceneName___RouterLogicProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___PresenterLogicProtocol: class {
    func presenterRequest(requestType: ___VARIABLE_sceneName___.Action.PresenterRequest.RequestType)
}

protocol ___VARIABLE_sceneName___PresenterProtocol: class {
    var view: ___VARIABLE_sceneName___ViewLogicProtocol? { get set }
}

//MARK: - Protocol. Router. Interactor -> Another View
protocol ___VARIABLE_sceneName___RouterLogicProtocol: class {
    func routeTo(routeType: ___VARIABLE_sceneName___.Route)
}

protocol ___VARIABLE_sceneName___RouterProtocol: class {
    var view: ___VARIABLE_sceneName___ViewController? { get set }
}

//MARK: - Protocol. Interactor. Data Store
protocol ___VARIABLE_sceneName___DataStoreProtocol: class {
    var dataStore: ___VARIABLE_sceneName___.DataStore? { get set }
}

//MARK: - Protocol. Configurator
protocol ___VARIABLE_sceneName___ConfiguratorProtocol: class {
    func configure(with view: ___VARIABLE_sceneName___ViewController)
}

class ___VARIABLE_sceneName___Configurator: ___VARIABLE_sceneName___ConfiguratorProtocol {
    
    //MARK: - Configure
    func configure(with view: ___VARIABLE_sceneName___ViewController) {
        let interactor            = ___VARIABLE_sceneName___Interactor()
        let presenter             = ___VARIABLE_sceneName___Presenter()
        let router                = ___VARIABLE_sceneName___Router()
        let dataStore             = ___VARIABLE_sceneName___.DataStore()
        
        view.interactor           = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        interactor.dataStore      = dataStore
        presenter.view            = view
        router.view               = view
    }
    
}//
