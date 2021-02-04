//
//  SecondPresenter.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Presenter
class SecondPresenter: SecondPresenterDependencies, SecondPresenterLogic {
    
    //MARK: - Properties
    weak var view: SecondViewLogic?
    
    //MARK: - Services
    
    //MARK: - Present Data
    func presenterRequest(requestType: SecondLogic.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .presentData(num: let num):
            view?.display(displayType: .displayData(num: num))
        }
    }
}
