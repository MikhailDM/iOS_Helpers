//
//  TTTTInteractor.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//

import UIKit

//MARK: - Interactor
class TTTTInteractor: TTTTInteractorProtocol, TTTTInteractorLogicProtocol, TTTTDataStoreProtocol  {
    
    //MARK: - Properties
    var presenter: TTTTPresenterLogicProtocol?
    var router: TTTTRouterLogicProtocol?
    var dataStore: TTTTLogic.DataStore?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: TTTTLogic.Action.InteractorRequest.RequestType) { }
    
}//
