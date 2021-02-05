//
//  MainInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. BusinessLogic

protocol MainBusinessLogic {
    func makeRequest(request: Main.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol MainDataStore {
    var mainCells: [MainViewModel.Section] { get set }
}


class MainInteractor: MainBusinessLogic, MainDataStore {
    //MARK: - Properties
    
    var presenter: MainPresentationLogic?
    var service: MainWorker?
    var mainCells = [MainViewModel.Section]()
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: Main.Model.Request.RequestType) {
        if service == nil {
            service = MainWorker()
        }
        switch request {
        case .getExamplesCells:
            mainCells = MainViewModel.getAllCells()
            presenter?.presentData(response: .presentExamplesCells(sections: mainCells))
        }
    }
    
    
}//
