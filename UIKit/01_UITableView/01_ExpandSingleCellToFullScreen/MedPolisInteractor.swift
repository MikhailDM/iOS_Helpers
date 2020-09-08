//
//  MedPolisInteractor.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Interactor

protocol MedPolisBusinessLogic {
    func makeRequest(request: MedPolis.Model.Request.RequestType)
}


//MARK: - Protocol. Data store

protocol MedPolisDataStore {
    var seriesOMS: String? { get set }
    var numberOMS: String? { get set }
    var isError: Bool { get set }
}


class MedPolisInteractor: MedPolisBusinessLogic, MedPolisDataStore {
    //MARK: - Properties
    
    var presenter: MedPolisPresentationLogic?
    var service: MedPolisWorker?
    
    var seriesOMS: String?
    var numberOMS: String?
    var isError = false
    
    
    //MARK: - Helpers/Managers
    
    private var lastCellCalculator = MedLastTVCellCalculator()
    
    
    //MARK: - Requests
    
    func makeRequest(request: MedPolis.Model.Request.RequestType) {
        if service == nil {
            service = MedPolisWorker()
        }
        
        switch request {
        case .setSerialAndNumberOMS(series: let series, number: let number):
            self.seriesOMS = series
            self.numberOMS = number
            presenter?.presentData(response: .presentData(data: getDataModel()))
            
        case .TESTMakeError:
            self.isError.toggle()
            presenter?.presentData(response: .presentError(data: getDataModel()))
            
        case .setCellsHeightsValues(cellsHeights: let cellsHeights, lastCellInitialHeight: let lastCellInitialHeight, tableViewHeight: let tableViewHeight):
            let lastCellHeight = lastCellCalculator.calculateLastCellHeight(tableViewHeight: tableViewHeight,
                                                       cellsHeights: cellsHeights,
                                                       lastCellInitialHeight: lastCellInitialHeight)
            presenter?.presentData(response: .presentLastCellHeight(height: lastCellHeight))
        }
    }
    
    
    //MARK: - Private
    
    private func getDataModel() -> MedPolisData {
        return MedPolisData(seriesOMS: seriesOMS,
                            numberOMS: numberOMS,
                            isError: isError)
    }
    
    
}//Class end
