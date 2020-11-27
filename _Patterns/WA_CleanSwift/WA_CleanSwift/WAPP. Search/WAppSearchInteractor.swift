//
//  WAppSearchInteractor.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


//MARK: - Protocol. Data Store
protocol WAppSearchDataStore {
    var dataStore: Any? { get set }
}


class WAppSearchInteractor: WAppSearchBusinessLogic, WAppSearchDataStore {
    //MARK: - Properties
    var presenter: WAppSearchPresentationLogic?
    var dataStore: Any?
    
    
    //MARK: - Managers
    
    
    //MARK: - Requests
    func makeRequest(request: WAppSearch.Model.Request.RequestType) { }
    
}//
