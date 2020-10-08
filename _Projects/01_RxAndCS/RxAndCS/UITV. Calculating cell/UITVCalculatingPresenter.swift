//
//  UITVCalculatingPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol UITVCalculatingPresentationLogic {
    func presentData(response: UITVCalculating.Model.Response.ResponseType)
}


class UITVCalculatingPresenter: UITVCalculatingPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: UITVCalculatingDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: UITVCalculating.Model.Response.ResponseType) {
        switch response {
        case .presentExpandedText(isExpanded: let isExpanded):
            viewController?.displayData(viewModel: .displayExpandedText(isExpanded: isExpanded))
        }
    }
    
    
}//
