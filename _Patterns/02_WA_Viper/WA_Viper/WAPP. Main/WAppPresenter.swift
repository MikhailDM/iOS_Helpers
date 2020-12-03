//
//  WAppPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppPresenter: WAppPresenterProtocol, WAppOutputInteractorProtocol, WAppDataStoreProtocol {
    //MARK: - Properties
    var view: WAppViewProtocol?
    var router: WAppRouterProtocol?
    var interactor: WAppInputInteractorProtocol?
    var dataStore: WApp.DataStore?
    
    
    //MARK: - Present
    func present(presentType: WApp.Action.Present.PresentType) {
        switch presentType {
        case .presentTestText:
            interactor?.makeRequest(requestType: .changeTestText(text: "XXXXX"))
            
        case .presentDataStore:
            guard let data = dataStore?.text else { return }
            print("===== DATA IN DATA STORE: \(data)")
        }
    }
    
    
    //MARK: - Interactor Response
    func makeResponse(requestType: WApp.Action.InteractorResponse.InteractorResponseType) {
        switch requestType {
        case .getTestText(text: let text):
            dataStore?.text = text
            view?.display(displayType: .displayTestText(text: text))
        }
    }
    
}//
