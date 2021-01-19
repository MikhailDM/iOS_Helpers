//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. Data Store
protocol ___VARIABLE_sceneName___DataStoreProtocol: class {
    var data: Any? { get set }
}

//MARK: - Interactor
class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___InteractorProtocol, ___VARIABLE_sceneName___InteractorLogicProtocol, ___VARIABLE_sceneName___DataStoreProtocol  {
    
    //MARK: - Properties
    var presenter: ___VARIABLE_sceneName___PresenterLogicProtocol?
    var router: ___VARIABLE_sceneName___RouterLogicProtocol?
    
    //MARK: - Data Store
    var data: Any?
    
    //MARK: - Services
    
    //MARK: - Requests
    func interactorRequest(requestType: ___VARIABLE_sceneName___Logic.Action.InteractorRequest.RequestType) { }
}
