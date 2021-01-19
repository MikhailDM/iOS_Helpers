//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol ___VARIABLE_sceneName___ViewLogicProtocol: class {
    func display(displayType: ___VARIABLE_sceneName___Logic.Action.Display.DisplayType)
}

protocol ___VARIABLE_sceneName___ViewProtocol: class {
    var configurator: ___VARIABLE_sceneName___Configurator { get set }
    var interactor: ___VARIABLE_sceneName___InteractorLogicProtocol? { get set }
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol ___VARIABLE_sceneName___InteractorLogicProtocol: class {
    func interactorRequest(requestType: ___VARIABLE_sceneName___Logic.Action.InteractorRequest.RequestType)
}

protocol ___VARIABLE_sceneName___InteractorProtocol: class {
    var presenter: ___VARIABLE_sceneName___PresenterLogicProtocol? { get set }
    var router: ___VARIABLE_sceneName___RouterLogicProtocol? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol ___VARIABLE_sceneName___PresenterLogicProtocol: class {
    func presenterRequest(requestType: ___VARIABLE_sceneName___Logic.Action.PresenterRequest.RequestType)
}

protocol ___VARIABLE_sceneName___PresenterProtocol: class {
    var view: ___VARIABLE_sceneName___ViewLogicProtocol? { get set }
}

//MARK: - Protocol. Router. Router -> View
protocol ___VARIABLE_sceneName___RouterProtocol: class {
    var view: ___VARIABLE_sceneName___ViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol ___VARIABLE_sceneName___ConfiguratorProtocol: class {
    func configure(with view: ___VARIABLE_sceneName___ViewController)
}

//MARK: - Configurator
class ___VARIABLE_sceneName___Configurator: ___VARIABLE_sceneName___ConfiguratorProtocol {
    
    func configure(with view: ___VARIABLE_sceneName___ViewController) {
        let interactor            = ___VARIABLE_sceneName___Interactor()
        let presenter             = ___VARIABLE_sceneName___Presenter()
        let router                = ___VARIABLE_sceneName___Router()
        
        view.interactor           = interactor
        view.dataStore            = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        presenter.view            = view
        router.view               = view
    }
}
