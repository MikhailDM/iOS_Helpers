//
//  SecondInteractor.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Protocol. Data Store
protocol SecondDataStore: class {
    var nums: [Int] { get set }
    var selectedNum: Int? { get set }
}

//MARK: - Interactor
class SecondInteractor: SecondInteractorDependencies, SecondInteractorLogic, SecondDataStore {
    
    //MARK: - Properties
    var presenter: SecondPresenterLogic?
    var router: SecondRouterLogic?
    
    var nums = [10,34,23,56,12]
    var selectedNum: Int?
    
    //MARK: - Data Store
    var data: Int?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: SecondLogic.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .updateData:
            guard let num = selectedNum else { return }
            presenter?.presenterRequest(requestType: .presentData(num: num))
            
        case .routeBack:
            router?.routeBack()
        }
    }
}
