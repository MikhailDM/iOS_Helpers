//
//  UITVAddCellsConfigurator.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol UITVAddCellsConfiguratorProtocol: class {
    func configure(with viewController: UITVAddCellsViewController)
}


class UITVAddCellsConfigurator: UITVAddCellsConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: UITVAddCellsViewController) {
        let interactor            = UITVAddCellsInteractor()
        let presenter             = UITVAddCellsPresenter()
        let router                = UITVAddCellsRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//
