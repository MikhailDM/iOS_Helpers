//
//  MedPolisPresenter.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Presentation

protocol MedPolisPresentationLogic {
    func presentData(response: MedPolis.Model.Response.ResponseType)
}


class MedPolisPresenter: MedPolisPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: MedPolisDisplayLogic?
    
    
    //MARK: - Present data
    
    func presentData(response: MedPolis.Model.Response.ResponseType) {
        switch response {
            
        case .presentData(data: let data):
            viewController?.displayData(viewModel: .displayViewModel(viewModel: getViewModel(data: data)))
            
        case .presentError(data: let data):
            viewController?.displayData(viewModel: .displayError(viewModel: getViewModel(data: data)))

        case .presentLastCellHeight(height: let height):
            viewController?.displayData(viewModel: .presentLastCellHeight(height: height))
        }
    }
    
    
    //MARK: - Private
    
    private func getViewModel(data: MedPolisData) -> MedPolisViewModel {
        return MedPolisViewModel(seriesOMS: data.seriesOMS,
                                 numberOMS: data.numberOMS,
                                 isError: data.isError)
    }
    
    
}//Class end
