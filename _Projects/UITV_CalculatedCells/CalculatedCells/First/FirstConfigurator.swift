//
//  FirstConfigurator.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol FirstViewLogic: class {
    func display(displayType: FirstLogic.Action.Display.DisplayType)
}

protocol FirstViewDependencies: class {
    var configurator: FirstConfigurator { get set }
    var interactor: FirstInteractorLogic? { get set }
    var dataStore: FirstDataStore? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol FirstInteractorLogic: class {
    func interactorRequest(requestType: FirstLogic.Action.InteractorRequest.RequestType)
}

protocol FirstInteractorDependencies: class {
    var presenter: FirstPresenterLogic? { get set }
    var router: FirstRouterLogic? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol FirstPresenterLogic: class {
    func presenterRequest(requestType: FirstLogic.Action.PresenterRequest.RequestType)
}

protocol FirstPresenterDependencies: class {
    var view: FirstViewLogic? { get set }
}

//MARK: - Protocol. Router. Router -> View
protocol FirstRouterDependencies: class {
    var view: FirstViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol FirstConfiguratorLogic: class {
    func configure(with view: FirstViewController)
}

//MARK: - Configurator
class FirstConfigurator: FirstConfiguratorLogic {
    
    func configure(with view: FirstViewController) {
        let interactor            = FirstInteractor()
        let presenter             = FirstPresenter()
        let router                = FirstRouter()
        
        view.interactor           = interactor
        view.dataStore            = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        presenter.view            = view
        router.view               = view
    }
}
