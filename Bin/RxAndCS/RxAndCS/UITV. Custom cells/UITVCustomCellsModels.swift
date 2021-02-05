//
//  UITVCustomCellsModels.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum UITVCustomCells {
    //MARK: - Actions
    
    enum Model {
        struct Request {
            enum RequestType {
                case switchPressed(state: Bool)
                case textEntered(text: String)
                case passedTheValidation(isValid: Bool)
            }
        }
        struct Response {
            enum ResponseType {
                case presentViewModel(data: UITVCustomCellsData)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayViewModel(viewModel: UITVCustomCellsViewModel)
            }
        }
    }
    
    
}//


struct UITVCustomCellsViewModel {
    let switchStateString: String
    let enteredTextString: String
    let validState: String
}

struct UITVCustomCellsData {
    let switchState: Bool?
    let enteredText: String?
    let validState: Bool?
}
