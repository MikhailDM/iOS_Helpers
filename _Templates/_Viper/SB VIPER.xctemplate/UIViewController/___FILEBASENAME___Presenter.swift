//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresenterProtocol, ___VARIABLE_sceneName___OutputInteractorProtocol, ___VARIABLE_sceneName___DataStoreProtocol {
    //MARK: - Properties
    var view: ___VARIABLE_sceneName___ViewProtocol?
    var router: ___VARIABLE_sceneName___RouterProtocol?
    var interactor: ___VARIABLE_sceneName___InputInteractorProtocol?
    var dataStore: ___VARIABLE_sceneName___.DataStore?
    
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: ___VARIABLE_sceneName___.Action.PresenterRequest.RequestType) { }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: ___VARIABLE_sceneName___.Action.InteractorResponse.ResponseType) { }
    
    
    //MARK: - Private
}//
