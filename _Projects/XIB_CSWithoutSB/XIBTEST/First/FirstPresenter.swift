//
//  FirstPresenter.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit

//MARK: - Presenter
class FirstPresenter: FirstPresenterDependencies, FirstPresenterLogic {
    
    //MARK: - Properties
    weak var view: FirstViewLogic?
    
    //MARK: - Services
    
    //MARK: - Present Data
    func presenterRequest(requestType: FirstLogic.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .presentData(num: let num):
            view?.display(displayType: .displayData(num: num))
        }
    }
}
