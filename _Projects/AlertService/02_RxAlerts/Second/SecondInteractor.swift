//
//  SecondInteractor.swift
//  02_RxAlerts
//
//  Created by Михаил Дмитриев on 14.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Data Store
protocol SecondDataStore {
    var dataStore: Any? { get set }
}


class SecondInteractor: SecondBusinessLogic, SecondDataStore {
    //MARK: - Properties
    var presenter: SecondPresentationLogic?
    var dataStore: Any?
    
    
    //MARK: - Managers
    
    
    //MARK: - Requests
    func makeRequest(request: Second.Model.Request.RequestType) { }
    
}//
