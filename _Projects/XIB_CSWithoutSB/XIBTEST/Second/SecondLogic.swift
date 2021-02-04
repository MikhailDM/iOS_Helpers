//
//  SecondLogic.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router -> View
//  Data Store Access From View
//  Data Store Keeps In Interactor

import UIKit

//MARK: - Logic
enum SecondLogic {
    
    //MARK: - Actions
    enum Action {
        struct InteractorRequest {
            enum RequestType {
                case updateData
                case routeBack
            }
        }
        
        struct PresenterRequest {
            enum RequestType {
                case presentData(num: Int)
            }
        }
        
        struct Display {
            enum DisplayType {
                case displayData(num: Int)
            }
        }
    }
}
