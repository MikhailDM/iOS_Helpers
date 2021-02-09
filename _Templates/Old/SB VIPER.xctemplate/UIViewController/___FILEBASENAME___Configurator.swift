//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___ViewLogic: class {
    func display(displayType: ___VARIABLE_sceneName___Logic.Action.Display.DisplayType)
}

protocol ___VARIABLE_sceneName___ViewDependencies: class {
    var configurator: ___VARIABLE_sceneName___Configurator { get set }
    var presenter: ___VARIABLE_sceneName___PresenterLogic? { get set }
    var dataStore: ___VARIABLE_sceneName___DataStore? { get set }
} 

//MARK: - Protocol. Presenter. View -> Presenter
protocol ___VARIABLE_sceneName___PresenterLogic: class {
    func presenterRequest(requestType: ___VARIABLE_sceneName___Logic.Action.PresenterRequest.RequestType)
}

protocol ___VARIABLE_sceneName___PresenterDependencies: class {
    var view: ___VARIABLE_sceneName___ViewLogic? { get set }
    var router: ___VARIABLE_sceneName___RouterLogic? { get set }
    var interactor: ___VARIABLE_sceneName___InputInteractorLogic? { get set }
}

//MARK: - Protocol. Interactor. Presenter -> Interactor
protocol ___VARIABLE_sceneName___InputInteractorLogic: class {
    func interactorRequest(requestType: ___VARIABLE_sceneName___Logic.Action.InteractorRequest.RequestType)
}

protocol ___VARIABLE_sceneName___InputInteractorDependencies: class {
    var presenter: ___VARIABLE_sceneName___OutputInteractorLogic? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___OutputInteractorLogic: class {
    func interactorResponse(responseType: ___VARIABLE_sceneName___Logic.Action.InteractorResponse.ResponseType)
}

//MARK: - Protocol. Router. Router -> View
protocol ___VARIABLE_sceneName___RouterDependencies: class {
    var view: ___VARIABLE_sceneName___ViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol ___VARIABLE_sceneName___ConfiguratorLogic: class {
    func configure(with view: ___VARIABLE_sceneName___ViewController)
}

//MARK: - Configurator
class ___VARIABLE_sceneName___Configurator: ___VARIABLE_sceneName___ConfiguratorLogic {
    
    func configure(with view: ___VARIABLE_sceneName___ViewController) {
        let interactor            = ___VARIABLE_sceneName___Interactor()
        let presenter             = ___VARIABLE_sceneName___Presenter()
        let router                = ___VARIABLE_sceneName___Router()
        
        view.presenter            = presenter
        view.dataStore            = presenter
        presenter.view            = view
        presenter.router          = router
        presenter.interactor      = interactor
        interactor.presenter      = presenter
        router.view               = view
    }
}

