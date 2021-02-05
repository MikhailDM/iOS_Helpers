//
//  SinglePresenter.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit

//MARK: - Presenter
class SinglePresenter: SinglePresenterDependencies, SinglePresenterLogic {
    
    //MARK: - Properties
    weak var view: SingleViewLogic?
    
    //MARK: - Services
    
    //MARK: - Present Data
    func presenterRequest(requestType: SingleLogic.Action.PresenterRequest.RequestType) { }
}
