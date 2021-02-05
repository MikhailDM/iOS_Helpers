//
//  UITVCustomCellsInteractor.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. BusinessLogic

protocol UITVCustomCellsBusinessLogic {
    func makeRequest(request: UITVCustomCells.Model.Request.RequestType)
}


//MARK: - Protocol. DataStore

protocol UITVCustomCellsDataStore {
    var switchState: Bool { get set }
    var enteredText: String? { get set }
    var validState: Bool { get set }
}


class UITVCustomCellsInteractor: UITVCustomCellsBusinessLogic, UITVCustomCellsDataStore {
    //MARK: - Properties
    
    var presenter: UITVCustomCellsPresentationLogic?
    var service: UITVCustomCellsWorker?
    
    var switchState = true
    var enteredText: String?
    var validState = false
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Requests
    
    func makeRequest(request: UITVCustomCells.Model.Request.RequestType) {
        if service == nil {
            service = UITVCustomCellsWorker()
        }
        
        switch request {
        case .switchPressed(state: let state):
            switchState = state
            goToPresenter()
            
        case .textEntered(text: let text):
            enteredText = text
            goToPresenter()
            
        case .passedTheValidation(isValid: let isValid):
            validState = isValid
            goToPresenter()
        }
    }
    
    
    //MARK: - Private
    
    private func goToPresenter() {
        presenter?
            .presentData(response:
                            .presentViewModel(data: UITVCustomCellsData(switchState: switchState,
                                                                        enteredText: enteredText,
                                                                            validState: validState)))
    }
    
    
}//
