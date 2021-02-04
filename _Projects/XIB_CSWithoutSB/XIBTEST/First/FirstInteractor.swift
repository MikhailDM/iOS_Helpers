//
//  FirstInteractor.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Protocol. Data Store
protocol FirstDataStore: class {
    var nums: [Int] { get set }
    var selectedNum: Int? { get set }
}

//MARK: - Interactor
class FirstInteractor: FirstInteractorDependencies, FirstInteractorLogic, FirstDataStore {
    
    //MARK: - Properties
    var presenter: FirstPresenterLogic?
    var router: FirstRouterLogic?
    
    //MARK: - Data Store
    var nums = [1,3,5,8,4,9]
    var selectedNum: Int?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: FirstLogic.Action.InteractorRequest.RequestType) {
        switch requestType {
        case .routeToSecond:
            router?.routeToSecond()
            
        case .updateData:
            guard let num = selectedNum else { return }
            presenter?.presenterRequest(requestType: .presentData(num: num))
        }
    }
}
