//
//  WAppModels.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//
//  View <-> Presenter <-> Interactor
//  Presenter -> Router
//  Router -> View
//  Presenter contains Data Store

import UIKit
import RxSwift

enum WApp {
    
    //MARK: - Logic
    enum Action {
        struct PresenterRequest {
            enum RequestType {
                case requestDefaultWeather
                case updateCity(city: String)
                case routeToSearch
            }
        }
        
        struct InteractorRequest {
            enum RequestType {
                case requestDefaultWeather
                case requestWeatherByCity(cityName: String)
            }
        }
        
        struct InteractorResponse {
            enum ResponseType {
                case responseWeatherByCity(data: WAppEntity.ServerData)
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



