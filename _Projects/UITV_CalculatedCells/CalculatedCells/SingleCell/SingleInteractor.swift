//
//  SingleInteractor.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. Data Store
protocol SingleDataStore: class {
    var data: Any? { get set }
}

//MARK: - Interactor
class SingleInteractor: SingleInteractorDependencies, SingleInteractorLogic, SingleDataStore {
    
    //MARK: - Properties
    var presenter: SinglePresenterLogic?
    var router: SingleRouterLogic?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: SingleLogic.Action.InteractorRequest.RequestType) { }
}
