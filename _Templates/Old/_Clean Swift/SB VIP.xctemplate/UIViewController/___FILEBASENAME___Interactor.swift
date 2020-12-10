//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


//MARK: - Protocol. Data Store
protocol ___VARIABLE_sceneName___DataStore {
    var dataStore: Any? { get set }
}


class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic, ___VARIABLE_sceneName___DataStore {
    //MARK: - Properties
    var presenter: ___VARIABLE_sceneName___PresentationLogic?
    var dataStore: Any?
    
    
    //MARK: - Managers
    
    
    //MARK: - Requests
    func makeRequest(request: ___VARIABLE_sceneName___.Model.Request.RequestType) { }
    
}//
