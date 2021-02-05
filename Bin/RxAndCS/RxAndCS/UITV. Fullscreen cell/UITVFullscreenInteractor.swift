//
//  UITVFullscreenInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. BusinessLogic

protocol UITVFullscreenBusinessLogic {
    func makeRequest(request: UITVFullscreen.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol UITVFullscreenDataStore {
    var dataStore: Any? { get set }
}


class UITVFullscreenInteractor: UITVFullscreenBusinessLogic, UITVFullscreenDataStore {
    //MARK: - Properties
    
    var presenter: UITVFullscreenPresentationLogic?
    var service: UITVFullscreenWorker?
    var dataStore: Any?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: UITVFullscreen.Model.Request.RequestType) {
        if service == nil {
            service = UITVFullscreenWorker()
        }
    }
    
    
}//
