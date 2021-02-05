//
//  MutiCellsLogic.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router -> View
//  Data Store Access From View
//  Data Store Keeps In Interactor

import UIKit

//MARK: - Logic
enum MutiCellsLogic {
    
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
}
