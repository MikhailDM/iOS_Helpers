//
//  UITVFullscreenConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol UITVFullscreenConfiguratorProtocol: class {
    func configure(with viewController: UITVFullscreenViewController)
}


class UITVFullscreenConfigurator: UITVFullscreenConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: UITVFullscreenViewController) {
        let interactor            = UITVFullscreenInteractor()
        let presenter             = UITVFullscreenPresenter()
        let router                = UITVFullscreenRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
