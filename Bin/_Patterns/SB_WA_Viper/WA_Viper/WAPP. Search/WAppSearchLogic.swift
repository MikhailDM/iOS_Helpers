//
//  WAppSearchLogic.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//
//  View <-> Presenter <-> Interactor
//  Presenter -> Router
//  Router -> View
//  Presenter contains Data Store

import UIKit
import RxSwift

enum WAppSearch {

    //MARK: - Logic
    enum Action {
        struct PresenterRequest {
            enum RequestType {
                case getCitiesList
                case selectCity(city: String)
                case getCitiesWhichContainText(searchText: String)
            }
        }
        
        struct InteractorRequest {
            enum RequestType {
                case some
            }
        }
        
        struct InteractorResponse {
            enum ResponseType {
                case some
            }
        }
        
        struct Display {
            enum DisplayType {
                case displayCities(cities: [String])
            }
        }
    }
    
    //MARK: - Route
    enum Route {
        case some
    }
    
    //MARK: - Data Store
    struct DataStore {
        var selectedCity = PublishSubject<String>()
    }
    
}//
