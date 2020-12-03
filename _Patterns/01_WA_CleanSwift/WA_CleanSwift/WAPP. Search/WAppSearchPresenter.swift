//
//  WAppSearchPresenter.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class WAppSearchPresenter: WAppSearchPresentationLogic {
    //MARK: - Properties
    weak var viewController: WAppSearchDisplayLogic?
    
    
    //MARK: - Present Data
    func presentData(response: WAppSearch.Model.Response.ResponseType) {
        switch response {
        case .presentCitiesWhichContainText(searchData: let searchData):
            viewController?.displayData(toDisplay: .displayCitiesWhichContainText(searchData: searchData))
        }
    }
    
}//
