//
//  WAppInteractor.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppInteractor: WAppInputInteractorProtocol  {
    //MARK: - Properties
    weak var presenter: WAppOutputInteractorProtocol?
    
    
    //MARK: - Managers
    
    
    //MARK: - Request
    func makeRequest(requestType: WApp.Action.InteractorRequest.InteractorRequestType) {
        switch requestType {
        case .changeTestText(text: let text):
            let newText = text + " AFTER INTERACTOR"
            presenter?.makeResponse(requestType: .getTestText(text: newText))
        }
    }
    
}//
