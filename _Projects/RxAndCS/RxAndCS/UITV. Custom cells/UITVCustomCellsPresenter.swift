//
//  UITVCustomCellsPresenter.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. PresentationLogic

protocol UITVCustomCellsPresentationLogic {
    func presentData(response: UITVCustomCells.Model.Response.ResponseType)
}


class UITVCustomCellsPresenter: UITVCustomCellsPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: UITVCustomCellsDisplayLogic?
    
    
    //MARK: - Managers/Helpers
    
    
    //MARK: - Present data
    
    func presentData(response: UITVCustomCells.Model.Response.ResponseType) {
        switch response {
        case .presentViewModel(data: let data):
            let vm = UITVCustomCellsViewModel(switchStateString: getSwitchState(state: data.switchState),
                                              enteredTextString: getEnteredText(text: data.enteredText),
                                              validState: getValidState(isValid: data.validState))
            viewController?.displayData(viewModel: .displayViewModel(viewModel: vm))
        }
    }
    
    
    //MARK: - Private
    
    private func getSwitchState(state: Bool?) -> String {
        guard let stateSafe = state else {
            return "Press the switch"
        }
        return stateSafe ? "True" : "False"
    }
    
    private func getEnteredText(text: String?) -> String {
        guard
            let textSafe = text,
            textSafe != "" else {
            return "Enter the text"
        }
        return textSafe
    }
    
    private func getValidState(isValid: Bool?) -> String {
        guard let isValidSafe = isValid else {
            return "Invalid"
        }
        return isValidSafe ? "Valid" : "Invalid"
    }
    
    
}//
