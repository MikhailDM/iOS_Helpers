//
//  UITVFullscreenPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol UITVFullscreenPresentationLogic {
    func presentData(response: UITVFullscreen.Model.Response.ResponseType)
}


class UITVFullscreenPresenter: UITVFullscreenPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: UITVFullscreenDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: UITVFullscreen.Model.Response.ResponseType) {
        
    }
    
    
}//
