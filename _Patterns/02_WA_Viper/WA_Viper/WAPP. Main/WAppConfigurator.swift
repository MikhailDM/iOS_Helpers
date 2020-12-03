//
//  WAppConfigurator.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. View. Presenter -> View
protocol WAppViewProtocol {
    var configurator: WAppConfigurator { get set }
    var presenter: WAppPresenterProtocol? { get set }
    func display(displayType: WApp.Action.Display.DisplayType)
}


//MARK: - Protocol. Presenter. View -> Presenter
protocol WAppPresenterProtocol {
    var view: WAppViewProtocol? { get set }
    var router: WAppRouterProtocol? { get set }
    var interactor: WAppInputInteractorProtocol? { get set }
    func present(presentType: WApp.Action.Present.PresentType)
}


//MARK: - Protocol. Interactor.  Presenter -> Interactor
protocol WAppInputInteractorProtocol: class {
    var presenter: WAppOutputInteractorProtocol? { get set }
    func makeRequest(requestType: WApp.Action.InteractorRequest.InteractorRequestType)
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppOutputInteractorProtocol: class {
    func makeResponse(requestType: WApp.Action.InteractorResponse.InteractorResponseType)
}


//MARK: - Protocol. Presenter. Presenter -> Another View
protocol WAppRouterProtocol {
    var viewController: WAppViewController? { get set }
    var dataStore: WAppDataStoreProtocol? { get set }
    func routeToView(view: WApp.Route)
}


//MARK: - Protocol. Presenter/Router. Data Store
protocol WAppDataStoreProtocol {
    var dataStore: WApp.DataStore? { get set }
}


//MARK: - Protocol. Configurator
protocol WAppConfiguratorProtocol: class {
    func configure(with viewController: WAppViewController)
}


class WAppConfigurator: WAppConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: WAppViewController) {
        let interactor            = WAppInteractor()
        let presenter             = WAppPresenter()
        let router                = WAppRouter()
        let dataStore             = WApp.DataStore()
        
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


/*
 fruitListRef.presenter = presenter
 fruitListRef.presenter?.wireframe = FruitListWireframe()
 fruitListRef.presenter?.view = fruitListRef
 fruitListRef.presenter?.interactor = FruitListInteractor()
 fruitListRef.presenter?.interactor?.presenter = presenter
 */

//MARK: - Protocol. Presenter
//protocol WAppPresentationLogic {
//    func presentData(response: WApp.Model.Response.ResponseType)
//}


//MARK: - Protocol. Display
//protocol WAppDisplayLogic: class {
//    func displayData(toDisplay: WApp.Model.ViewModel.ViewModelData)
//}


//MARK: - Protocol. Data Passing
//protocol WAppDataPassing {
//    var dataStore: WAppDataStore? { get set }
//}
