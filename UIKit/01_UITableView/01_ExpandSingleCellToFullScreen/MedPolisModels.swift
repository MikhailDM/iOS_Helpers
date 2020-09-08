//
//  MedPolisModels.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

enum MedPolis {
    //MARK: - Models
    
    enum Model {
        struct Request {
            enum RequestType {
                case setSerialAndNumberOMS(series: String?, number: String?)
                case setCellsHeightsValues(cellsHeights: [CGFloat], lastCellInitialHeight: CGFloat, tableViewHeight: CGFloat)
                case TESTMakeError
            }
        }
        struct Response {
            enum ResponseType {
                case presentData(data: MedPolisData)
                case presentError(data: MedPolisData)
                case presentLastCellHeight(height: CGFloat?)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayViewModel(viewModel: MedPolisViewModel)
                case displayError(viewModel: MedPolisViewModel)
                case presentLastCellHeight(height: CGFloat?)
            }
        }
    }
    
    
}//


struct MedPolisData: MedPolisDataStore {
    var seriesOMS: String?
    var numberOMS: String?
    var isError = false
}


struct MedPolisViewModel {
    var seriesOMS: String?
    var numberOMS: String?
    var isError = false
}
