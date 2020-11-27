//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Request
protocol ___VARIABLE_sceneName___BusinessLogic {
    func makeRequest(request: ___VARIABLE_sceneName___.Model.Request.RequestType)
}


//MARK: - Protocol. Present
protocol ___VARIABLE_sceneName___PresentationLogic {
    func presentData(response: ___VARIABLE_sceneName___.Model.Response.ResponseType)
}


//MARK: - Protocol. Display
protocol ___VARIABLE_sceneName___DisplayLogic: class {
    func displayData(toDisplay: ___VARIABLE_sceneName___.Model.ViewModel.ViewModelData)
}


//MARK: - Protocol. Data Passing
protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get set }
}


//MARK: - Protocol. Configure
protocol ___VARIABLE_sceneName___ConfiguratorProtocol: class {
    func configure(with viewController: ___VARIABLE_sceneName___ViewController)
}


class ___VARIABLE_sceneName___Configurator: ___VARIABLE_sceneName___ConfiguratorProtocol {
    //MARK: - Configure
    func configure(with viewController: ___VARIABLE_sceneName___ViewController) {
        let interactor            = ___VARIABLE_sceneName___Interactor()
        let presenter             = ___VARIABLE_sceneName___Presenter()
        let router                = ___VARIABLE_sceneName___Router()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
}//
