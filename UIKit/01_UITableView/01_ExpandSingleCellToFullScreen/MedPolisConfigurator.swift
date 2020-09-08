//
//  MedPolisConfigurator.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol MedPolisConfiguratorProtocol: class {
    func configure(with viewController: MedPolisViewController)
}


class MedPolisConfigurator: MedPolisConfiguratorProtocol {
    //MARK: - Configurator
    
    func configure(with viewController: MedPolisViewController) {
        let interactor            = MedPolisInteractor()
        let presenter             = MedPolisPresenter()
        let router                = MedPolisRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//Class end
