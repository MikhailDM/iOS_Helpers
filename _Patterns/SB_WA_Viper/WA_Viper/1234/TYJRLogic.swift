//
//  TYJRLogic.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 15.12.2020
//
//  View <-> Presenter <-> Interactor
//  Presenter -> Router
//  Router -> View
//  Presenter contains Data Store

import UIKit

enum TYJR {
    
    //MARK: - Logic
    enum Action {
        struct PresenterRequest {
            enum RequestType {
                case some
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
                case some
            }
        }
    }
    
    //MARK: - Route
    enum Route {
        case some
    }
    
    //MARK: - Data Store
    struct DataStore {
        var data: Any?
    }
    
}//
