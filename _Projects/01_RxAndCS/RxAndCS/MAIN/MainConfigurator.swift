//
//  MainConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}


class MainConfigurator: MainConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: MainViewController) {
        let interactor            = MainInteractor()
        let presenter             = MainPresenter()
        let router                = MainRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
