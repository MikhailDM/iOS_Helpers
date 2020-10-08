//
//  UITVCalculatingConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol UITVCalculatingConfiguratorProtocol: class {
    func configure(with viewController: UITVCalculatingViewController)
}


class UITVCalculatingConfigurator: UITVCalculatingConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: UITVCalculatingViewController) {
        let interactor            = UITVCalculatingInteractor()
        let presenter             = UITVCalculatingPresenter()
        let router                = UITVCalculatingRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
