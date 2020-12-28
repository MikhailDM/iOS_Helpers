//
//  TTTTPresenter.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//

import UIKit

//MARK: - Presenter
class TTTTPresenter: TTTTPresenterProtocol, TTTTPresenterLogicProtocol {
    
    //MARK: - Properties
    weak var view: TTTTViewLogicProtocol?
    
    //MARK: - Services
    
    //MARK: - Present Data
    func presenterRequest(requestType: TTTTLogic.Action.PresenterRequest.RequestType) { }
    
}//
