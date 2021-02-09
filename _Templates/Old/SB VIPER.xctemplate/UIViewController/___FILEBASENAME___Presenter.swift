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

//MARK: - Presenter
class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresenterDependencies, ___VARIABLE_sceneName___PresenterLogic, ___VARIABLE_sceneName___OutputInteractorLogic, ___VARIABLE_sceneName___DataStore {
    
    //MARK: - Properties
    weak var view: ___VARIABLE_sceneName___ViewLogic?
    var router: ___VARIABLE_sceneName___RouterLogic?
    var interactor: ___VARIABLE_sceneName___InputInteractorLogic?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: ___VARIABLE_sceneName___Logic.Action.PresenterRequest.RequestType) { }
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: ___VARIABLE_sceneName___Logic.Action.InteractorResponse.ResponseType) { }
    
    //MARK: - Private
}
