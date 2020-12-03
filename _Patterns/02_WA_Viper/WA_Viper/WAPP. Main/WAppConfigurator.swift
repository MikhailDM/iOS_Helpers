//
//  WAppConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Configurator
protocol WAppConfiguratorProtocol: class {
    func configure(with viewController: WAppViewController)
}


class WAppConfigurator: WAppConfiguratorProtocol {
    //MARK: - Configurator
    func configure(with viewController: WAppViewController) {
        let interactor            = WAppInteractor()
        let presenter             = WAppPresenter()
        let router                = WAppRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
}//
