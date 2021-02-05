//
//  MutiCellsInteractor.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Protocol. Data Store
protocol MutiCellsDataStore: class {
    var data: Any? { get set }
}

//MARK: - Interactor
class MutiCellsInteractor: MutiCellsInteractorDependencies, MutiCellsInteractorLogic, MutiCellsDataStore {
    
    //MARK: - Properties
    var presenter: MutiCellsPresenterLogic?
    var router: MutiCellsRouterLogic?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: MutiCellsLogic.Action.InteractorRequest.RequestType) { }
}
