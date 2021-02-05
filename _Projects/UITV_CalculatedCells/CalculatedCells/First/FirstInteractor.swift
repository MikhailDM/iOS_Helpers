//
//  FirstInteractor.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. Data Store
protocol FirstDataStore: class {
    var data: Any? { get set }
}

//MARK: - Interactor
class FirstInteractor: FirstInteractorDependencies, FirstInteractorLogic, FirstDataStore {
    
    //MARK: - Properties
    var presenter: FirstPresenterLogic?
    var router: FirstRouterLogic?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: FirstLogic.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .routeToSingle:
            router?.routeToSingle()
        }
    }
}
