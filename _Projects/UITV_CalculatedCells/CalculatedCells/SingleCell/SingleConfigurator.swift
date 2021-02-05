//
//  SingleConfigurator.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol SingleViewLogic: class {
    func display(displayType: SingleLogic.Action.Display.DisplayType)
}

protocol SingleViewDependencies: class {
    var configurator: SingleConfigurator { get set }
    var interactor: SingleInteractorLogic? { get set }
    var dataStore: SingleDataStore? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol SingleInteractorLogic: class {
    func interactorRequest(requestType: SingleLogic.Action.InteractorRequest.RequestType)
}

protocol SingleInteractorDependencies: class {
    var presenter: SinglePresenterLogic? { get set }
    var router: SingleRouterLogic? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol SinglePresenterLogic: class {
    func presenterRequest(requestType: SingleLogic.Action.PresenterRequest.RequestType)
}

protocol SinglePresenterDependencies: class {
    var view: SingleViewLogic? { get set }
}

//MARK: - Protocol. Router. Router -> View
protocol SingleRouterDependencies: class {
    var view: SingleViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol SingleConfiguratorLogic: class {
    func configure(with view: SingleViewController)
}

//MARK: - Configurator
class SingleConfigurator: SingleConfiguratorLogic {
    
    func configure(with view: SingleViewController) {
        let interactor            = SingleInteractor()
        let presenter             = SinglePresenter()
        let router                = SingleRouter()
        
        view.interactor           = interactor
        view.dataStore            = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        presenter.view            = view
        router.view               = view
    }
}
