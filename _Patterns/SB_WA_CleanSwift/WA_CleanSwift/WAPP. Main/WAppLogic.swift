//
//  WAppLogic.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//
//  View -> Interactor -> Presenter -> View
//  Interactor <-> Router


import UIKit


enum WApp {
    //MARK: - Models
    enum Action {
        struct InteractorRequest {
            enum RequestType {
                case requestDefaultWeather
                case requestWeatherByCity(cityName: String)
                case routeToSearch
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
