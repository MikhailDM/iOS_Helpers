//
//  UITVCalculatingInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. BusinessLogic

protocol UITVCalculatingBusinessLogic {
    func makeRequest(request: UITVCalculating.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol UITVCalculatingDataStore {
    var isTextExpanded: Bool { get set }
}


class UITVCalculatingInteractor: UITVCalculatingBusinessLogic, UITVCalculatingDataStore {
    //MARK: - Properties
    
    var presenter: UITVCalculatingPresentationLogic?
    var service: UITVCalculatingWorker?
    var isTextExpanded = false
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: UITVCalculating.Model.Request.RequestType) {
        if service == nil {
            service = UITVCalculatingWorker()
        }
        
        switch request {
        case .expandTheText:
            isTextExpanded = !isTextExpanded
            presenter?.presentData(response: .presentExpandedText(isExpanded: isTextExpanded))
        }
    }
    
    
}//
