//
//  AddNumbersInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. BusinessLogic

protocol AddNumbersBusinessLogic {
    func makeRequest(request: AddNumbers.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol AddNumbersDataStore {
    var dataStore: Any? { get set }
}


class AddNumbersInteractor: AddNumbersBusinessLogic, AddNumbersDataStore {
    //MARK: - Properties
    
    var presenter: AddNumbersPresentationLogic?
    var service: AddNumbersWorker?
    var dataStore: Any?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: AddNumbers.Model.Request.RequestType) {
        if service == nil {
            service = AddNumbersWorker()
        }
    }
    
    
}//
