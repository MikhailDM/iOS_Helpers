//
//  WAppSearchModels.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router
//  Router -> View
//  Interactor contains Data Store

import UIKit
import RxSwift

enum WAppSearch {
    
    //MARK: - Logic
    enum Action {
        struct InteractorRequest {
            enum RequestType {
                case getCitiesList
                case selectCity(city: String)
                case getCitiesWhichContainText(searchText: String)
                case dismissView
            }
        }
        
        struct PresenterRequest {
            enum RequestType {
                case presentCities(cities: [String])
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
        case dismissView
    }
    
    //MARK: - Data Store
    struct DataStore {
        var selectedCity = PublishSubject<String>()
    }
    
}//
