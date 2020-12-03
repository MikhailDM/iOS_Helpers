//
//  WAppModels.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


enum WApp {
    //MARK: - Logic
    enum Action {
        struct PresenterRequest {
            enum RequestType {
                case requestDefaultWeather
            }
        }
        struct InteractorRequest {
            enum RequestType {
                case requestDefaultWeather
            }
        }
        struct InteractorResponse {
            enum ResponseType {
                case responseDefaultWeather(data: WAppEntity.ServerData)
            }
        }
        struct Display {
            enum DisplayType {
                case displayWeather(viewModel: WAppEntity.ViewModel)
            }
        }
    }
    
    
    //MARK: - Route
    enum Route {
        case some
    }
    
    
    //MARK: - Data Store
    struct DataStore {
        var cityName: String?
    }
    
}//



