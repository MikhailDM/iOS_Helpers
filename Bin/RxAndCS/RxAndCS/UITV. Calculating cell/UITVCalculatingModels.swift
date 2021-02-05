//
//  UITVCalculatingModels.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum UITVCalculating {
    //MARK: - Actions
    
    enum Model {
        struct Request {
            enum RequestType {
                case expandTheText
            }
        }
        struct Response {
            enum ResponseType {
                case presentExpandedText(isExpanded: Bool)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayExpandedText(isExpanded: Bool)
            }
        }
    }
    
    
}//
