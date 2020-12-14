//
//  WAppSearchSearchPresenter.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//

import UIKit


class WAppSearchPresenter: WAppSearchPresenterProtocol, WAppSearchPresenterLogicProtocol {
    //MARK: - Properties
    weak var view: WAppSearchViewLogicProtocol?
    
    
    //MARK: - Services
    
    
    //MARK: - Present Data
    func presenterRequest(requestType: WAppSearch.Action.PresenterRequest.RequestType) {
        switch requestType {
        case .presentCities(cities: let cities):
            view?.display(displayType: .displayCities(cities: cities))
        }
    }
}//
