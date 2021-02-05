//
//  UITVAddCellsInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. BusinessLogic

protocol UITVAddCellsBusinessLogic {
    func makeRequest(request: UITVAddCells.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol UITVAddCellsDataStore {
    var dataStore: Any? { get set }
}


class UITVAddCellsInteractor: UITVAddCellsBusinessLogic, UITVAddCellsDataStore {
    //MARK: - Properties
    
    var presenter: UITVAddCellsPresentationLogic?
    var service: UITVAddCellsWorker?
    var dataStore: Any?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: UITVAddCells.Model.Request.RequestType) {
        if service == nil {
            service = UITVAddCellsWorker()
        }
    }
    
    
}//
