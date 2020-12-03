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
        struct Present {
            enum PresentType {
                case presentTestText
            }
        }
        struct InteractorRequest {
            enum InteractorRequestType {
                case changeTestText(text: String)
            }
        }
        struct InteractorResponse {
            enum InteractorResponseType {
                case getTestText(text: String)
            }
        }
        struct Display {
            enum DisplayType {
                case displayTestText(text: String)
            }
        }
    }
    
    
    //MARK: - Route
    enum Route {
        case some
    }
    
    
    //MARK: - Data Store
    struct WAppDataStore {
        var data: Any?
    }
    
}//


//MARK: - View Model
struct WAppViewModel {
    let conditionImage: UIImage?
    let cityNameText: String
    let temperatureText: String
}


//MARK: - Server Data
struct WAppServerData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let description: String
        let id: Int
    }
}



