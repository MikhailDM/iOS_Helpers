//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___SearchPresenterProtocol, ___VARIABLE_sceneName___SearchPresenterLogicProtocol, ___VARIABLE_sceneName___SearchOutputInteractorProtocol, ___VARIABLE_sceneName___SearchDataStoreProtocol {
    //MARK: - Properties
    var view: ___VARIABLE_sceneName___SearchViewLogicProtocol?
    var router: ___VARIABLE_sceneName___SearchRouterLogicProtocol?
    var interactor: ___VARIABLE_sceneName___SearchInputInteractorLogicProtocol?
    var dataStore: ___VARIABLE_sceneName___Search.DataStore?
    
    
    //MARK: - Presenter Request
    func presenterRequest(requestType: ___VARIABLE_sceneName___.Action.PresenterRequest.RequestType) { }
    
    
    //MARK: - Interactor Response
    func interactorResponse(responseType: ___VARIABLE_sceneName___.Action.InteractorResponse.ResponseType) { }
    
    
    //MARK: - Private
}//
