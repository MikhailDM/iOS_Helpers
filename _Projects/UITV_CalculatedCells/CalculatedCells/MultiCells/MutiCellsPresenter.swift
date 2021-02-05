//
//  MutiCellsPresenter.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Presenter
class MutiCellsPresenter: MutiCellsPresenterDependencies, MutiCellsPresenterLogic {
    
    //MARK: - Properties
    weak var view: MutiCellsViewLogic?
    
    //MARK: - Services
    
    //MARK: - Present Data
    func presenterRequest(requestType: MutiCellsLogic.Action.PresenterRequest.RequestType) { }
}
