//
//  AddNumbersConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol AddNumbersConfiguratorProtocol: class {
    func configure(with viewController: AddNumbersViewController)
}


class AddNumbersConfigurator: AddNumbersConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: AddNumbersViewController) {
        let interactor            = AddNumbersInteractor()
        let presenter             = AddNumbersPresenter()
        let router                = AddNumbersRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
