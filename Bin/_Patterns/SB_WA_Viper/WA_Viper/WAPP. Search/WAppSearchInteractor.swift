//
//  WAppSearchInteractor.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//

import UIKit

class WAppSearchInteractor: WAppSearchInputInteractorProtocol, WAppSearchInputInteractorLogicProtocol  {
    
    deinit { print("===== DEINITED: WAppSearchInteractor") }
    
    //MARK: - Properties
    weak var presenter: WAppSearchOutputInteractorProtocol?
    
    //MARK: - Services
    
    //MARK: - Interactor Request
    func interactorRequest(requestType: WAppSearch.Action.InteractorRequest.RequestType) { }
    
}//
