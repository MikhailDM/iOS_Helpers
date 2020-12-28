//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//
//  View -> Interactor -> Presenter -> View
//  Interactor -> Router -> View
//  Interactor contains Data Store

import UIKit

//MARK: - Logic
enum ___VARIABLE_sceneName___Logic {
    
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