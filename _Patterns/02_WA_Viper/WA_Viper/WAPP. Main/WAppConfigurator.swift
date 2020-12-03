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
    func makeRequest(request: WApp.Action.InteractorRequest.InteractorRequestType)
}


//MARK: - Protocol. Presenter. Interactor -> Presenter
protocol WAppOutputInteractorProtocol: class {
    func makeResponse(request: WApp.Action.InteractorResponse.InteractorResponseType)
}


protocol WAppRouterProtocol {
    //Presenter -> Another View
    func routeToView(view: WApp.Route)
}


protocol WAppDataStoreProtocol {
    //Presenter/Router. Data Store
    var viewController: WAppViewController? { get set }
    var dataStore: WApp.WAppDataStore? { get set }
}



//MARK: - Protocol. Configure
protocol WAppConfiguratorProtocol: class {
    func configure(with viewController: WAppViewController)
}


class WAppConfigurator: WAppConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: WAppViewController) {
        let interactor            = WAppInteractor()
        let presenter             = WAppPresenter()
        let router                = WAppRouter()
        
        viewController.presenter  = presenter
        presenter.view            = viewController
        presenter.router          = router
        presenter.interactor      = interactor
        //presenter.dataStore =
        interactor.presenter      = presenter
        router.viewController     = viewController
        //router.dataStore = presenter
        
//        viewController.interactor = interactor
//        viewController.router     = router
//        interactor.presenter      = presenter
//        presenter.viewController  = viewController
//        router.viewController     = viewController
//        router.dataStore          = interactor
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
