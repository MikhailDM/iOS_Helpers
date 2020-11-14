//
//  FirstInteractor.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Data Store
protocol FirstDataStore {
    var dataStore: Any? { get set }
}


class FirstInteractor: FirstBusinessLogic, FirstDataStore {
    //MARK: - Properties
    var presenter: FirstPresentationLogic?
    var dataStore: Any?
    
    
    //MARK: - Managers
    
    
    //MARK: - Requests
    func makeRequest(request: First.Model.Request.RequestType) { }
    
}//
