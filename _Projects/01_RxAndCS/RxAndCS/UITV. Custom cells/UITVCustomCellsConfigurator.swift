//
//  UITVCustomCellsConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol UITVCustomCellsConfiguratorProtocol: class {
    func configure(with viewController: UITVCustomCellsViewController)
}


class UITVCustomCellsConfigurator: UITVCustomCellsConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: UITVCustomCellsViewController) {
        let interactor            = UITVCustomCellsInteractor()
        let presenter             = UITVCustomCellsPresenter()
        let router                = UITVCustomCellsRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
