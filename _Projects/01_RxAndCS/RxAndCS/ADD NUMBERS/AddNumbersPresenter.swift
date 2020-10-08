//
//  AddNumbersPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol AddNumbersPresentationLogic {
    func presentData(response: AddNumbers.Model.Response.ResponseType)
}


class AddNumbersPresenter: AddNumbersPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: AddNumbersDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: AddNumbers.Model.Response.ResponseType) {
        
    }
    
    
}//
