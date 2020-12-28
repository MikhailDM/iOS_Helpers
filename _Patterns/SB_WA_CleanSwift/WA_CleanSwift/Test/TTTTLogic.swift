//
//  TTTTLogic.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router -> View
//  Interactor contains Data Store

import UIKit

//MARK: - Logic
enum TTTTLogic {
    
    //MARK: - Actions
    enum Action {
        struct InteractorRequest {
            enum RequestType {
                case some
            }
        }
        
        struct PresenterRequest {
            enum RequestType {
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
