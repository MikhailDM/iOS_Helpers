//
//  MutiCellsConfigurator.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. View. Presenter -> View
protocol MutiCellsViewLogic: class {
    func display(displayType: MutiCellsLogic.Action.Display.DisplayType)
}

protocol MutiCellsViewDependencies: class {
    var configurator: MutiCellsConfigurator { get set }
    var interactor: MutiCellsInteractorLogic? { get set }
    var dataStore: MutiCellsDataStore? { get set }
}

//MARK: - Protocol. Interactor. View -> Interactor
protocol MutiCellsInteractorLogic: class {
    func interactorRequest(requestType: MutiCellsLogic.Action.InteractorRequest.RequestType)
}

protocol MutiCellsInteractorDependencies: class {
    var presenter: MutiCellsPresenterLogic? { get set }
    var router: MutiCellsRouterLogic? { get set }
}

//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol MutiCellsPresenterLogic: class {
    func presenterRequest(requestType: MutiCellsLogic.Action.PresenterRequest.RequestType)
}

protocol MutiCellsPresenterDependencies: class {
    var view: MutiCellsViewLogic? { get set }
}

//MARK: - Protocol. Router. Router -> View
protocol MutiCellsRouterDependencies: class {
    var view: MutiCellsViewController? { get set }
}

//MARK: - Protocol. Configurator
protocol MutiCellsConfiguratorLogic: class {
    func configure(with view: MutiCellsViewController)
}

//MARK: - Configurator
class MutiCellsConfigurator: MutiCellsConfiguratorLogic {
    
    func configure(with view: MutiCellsViewController) {
        let interactor            = MutiCellsInteractor()
        let presenter             = MutiCellsPresenter()
        let router                = MutiCellsRouter()
        
        view.interactor           = interactor
        view.dataStore            = interactor
        interactor.presenter      = presenter
        interactor.router         = router
        presenter.view            = view
        router.view               = view
    }
}
