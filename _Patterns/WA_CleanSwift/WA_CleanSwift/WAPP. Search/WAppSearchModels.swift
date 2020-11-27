//
//  WAppSearchModels.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


enum WAppSearch {
    //MARK: - Models
    enum Model {
        struct Request {
            enum RequestType {
                case subscribeToSearchedCities
                case getCitiesWhichContainText(searchText: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentCitiesWhichContainText(searchData: [String])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayCitiesWhichContainText(searchData: [String])
            }
        }
    }
    
}//
