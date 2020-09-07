//
//  VolCalendarConfigurator.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

//MARK: - Protocol. Configurator

protocol VolCalendarConfiguratorProtocol: class {
    func configure(with viewController: VolCalendarViewController)
}


//MARK: - Configurator

class VolCalendarConfigurator: VolCalendarConfiguratorProtocol {
    func configure(with viewController: VolCalendarViewController) {
        let interactor            = VolCalendarInteractor()
        let presenter             = VolCalendarPresenter()
        let router                = VolCalendarRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        router.dataStore          = interactor
    }
    
    
}//Class End
