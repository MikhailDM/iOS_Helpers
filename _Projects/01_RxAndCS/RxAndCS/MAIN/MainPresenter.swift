//
//  MainPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol MainPresentationLogic {
    func presentData(response: Main.Model.Response.ResponseType)
}


class MainPresenter: MainPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: MainDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: Main.Model.Response.ResponseType) {
        switch response {
        case .presentExamplesCells(sections: let sections):
            let vm = MainViewModel(sections: sections)
            viewController?.displayData(viewModel: .displayExamplesCells(viewModel: vm))
        }
    }
    
    
}//
