//
//  WAppPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppPresenter: WAppPresenterProtocol, WAppOutputInteractorProtocol {
    //MARK: - Properties
    var view: WAppViewProtocol?
    var router: WAppRouterProtocol?
    var interactor: WAppInputInteractorProtocol?
    
    
    //MARK: - Present
    func present(presentType: WApp.Action.Present.PresentType) {
        switch presentType {
        case .presentTestText:
            interactor?.makeRequest(request: .changeTestText(text: "XXXXX"))
        }
    }
    
    
    //MARK: - From Interactor
    func makeResponse(request: WApp.Action.InteractorResponse.InteractorResponseType) {
        switch request {
        case .getTestText(text: let text):
            view?.display(displayType: .displayTestText(text: text))
        }
    }
    
    
    //MARK: - Present Data
    //func presentData(response: WApp.Model.Response.ResponseType) { }
    
}//
