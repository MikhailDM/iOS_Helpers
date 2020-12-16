//
//  TYJRInteractor.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 15.12.2020
//

import UIKit

class TYJRInteractor: TYJRInputInteractorProtocol, TYJRInputInteractorLogicProtocol  {
    
    //MARK: - Properties
    weak var presenter: TYJROutputInteractorProtocol?
    
    //MARK: - Services
    
    //MARK: - Interactor Request
    func interactorRequest(requestType: TYJR.Action.InteractorRequest.RequestType) { }
    
}//
