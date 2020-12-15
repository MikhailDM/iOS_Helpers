//
//  WAppLogic.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router
//  Router -> View
//  Interactor contains Data Store

import UIKit

enum WApp {
    
    //MARK: - Logic
    enum Action {
        struct InteractorRequest {
            enum RequestType {
                case requestDefaultWeather
                case requestWeatherByCity(cityName: String)
                case searchButtonPressed
            }
        }
        
        struct PresenterRequest {
            enum RequestType {
                case presentWeather(data: WAppEntity.ServerData)
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
        case routeToSearch
    }
    
    //MARK: - Data Store
    struct DataStore {
        var selectedCity: String?
    }
    
}//
