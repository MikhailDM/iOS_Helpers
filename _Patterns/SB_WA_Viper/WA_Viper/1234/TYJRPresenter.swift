//
//  TYJRPresenter.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 15.12.2020
//

import UIKit

class TYJRPresenter: TYJRPresenterProtocol, TYJRPresenterLogicProtocol, TYJROutputInteractorProtocol, TYJRDataStoreProtocol {
    
    //MARK: - Properties
    var view: TYJRViewLogicProtocol?
    var router: TYJRRouterLogicProtocol?
    var interactor: TYJRInputInteractorLogicProtocol?
    var dataStore: TYJR.DataStore?
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: TYJR.Action.PresenterRequest.RequestType) { }
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: TYJR.Action.InteractorResponse.ResponseType) { }
    
    //MARK: - Private
    
}//
