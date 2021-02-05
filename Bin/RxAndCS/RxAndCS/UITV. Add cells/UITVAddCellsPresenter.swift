//
//  UITVAddCellsPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol UITVAddCellsPresentationLogic {
    func presentData(response: UITVAddCells.Model.Response.ResponseType)
}


class UITVAddCellsPresenter: UITVAddCellsPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: UITVAddCellsDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: UITVAddCells.Model.Response.ResponseType) {
        
    }
    
    
}//
