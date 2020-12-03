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
            interactor?.makeRequest(request: .changeTestText(text: "XXXXX"))
        }
    }
    
    
    //MARK: - Interactor Response
    func makeResponse(request: WApp.Action.InteractorResponse.InteractorResponseType) {
        switch request {
        case .getTestText(text: let text):
            view?.display(displayType: .displayTestText(text: text))
        }
    }
    
}//
