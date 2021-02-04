//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. Data Store
protocol ___VARIABLE_sceneName___DataStore: class {
    var data: Any? { get set }
}

//MARK: - Interactor
class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___InteractorDependencies, ___VARIABLE_sceneName___InteractorLogic, ___VARIABLE_sceneName___DataStore {
    
    //MARK: - Properties
    var presenter: ___VARIABLE_sceneName___PresenterLogic?
    var router: ___VARIABLE_sceneName___RouterLogic?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: ___VARIABLE_sceneName___Logic.Action.InteractorRequest.RequestType) { }
}
