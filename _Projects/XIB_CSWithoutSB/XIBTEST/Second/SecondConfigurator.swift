//
//  SecondConfigurator.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol SecondViewLogic: class {
    func display(displayType: SecondLogic.Action.Display.DisplayType)
}

protocol SecondViewDependencies: class {
    var configurator: SecondConfigurator { get set }
    var interactor: SecondInteractorLogic? { get set }
    var dataStore: SecondDataStore? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol SecondInteractorLogic: class {
    func interactorRequest(requestType: SecondLogic.Action.InteractorRequest.RequestType)
}

protocol SecondInteractorDependencies: class {
    var presenter: SecondPresenterLogic? { get set }
    var router: SecondRouterLogic? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol SecondPresenterLogic: class {
    func presenterRequest(requestType: SecondLogic.Action.PresenterRequest.RequestType)
}

protocol SecondPresenterDependencies: class {
    var view: SecondViewLogic? { get set }
}

//MARK: - Protocol. Router. Router -> View
protocol SecondRouterDependencies: class {
    var view: SecondViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol SecondConfiguratorLogic: class {
    func configure(with view: SecondViewController)
}

//MARK: - Configurator
class SecondConfigurator: SecondConfiguratorLogic {
    
    func configure(with view: SecondViewController) {
        let interactor            = SecondInteractor()
        let presenter             = SecondPresenter()
        let router                = SecondRouter()
        
        view.interactor           = interactor
        view.dataStore            = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        presenter.view            = view
        router.view               = view
    }
}
