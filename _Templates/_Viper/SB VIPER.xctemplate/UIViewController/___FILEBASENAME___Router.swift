//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Router
class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RouterProtocol, ___VARIABLE_sceneName___RouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: ___VARIABLE_sceneName___ViewController?
    
    //MARK: - Route
    func routeTo(routeType: ___VARIABLE_sceneName___Logic.Route) { }
    
//    let storyboard = UIStoryboard(name: "WAppSearch", bundle: nil)
//    guard let viewController = view,
//          let homeDS = view?.presenter?.dataStore,
//          let destinationVC = storyboard.instantiateViewController(withIdentifier: "UIViewController") as? UIViewController,
//          var destinationDS = destinationVC.presenter?.dataStore else { print("===== NAVIGATION FAIL"); return }
//    navigateTo(source: viewController, destination: destinationVC)
//    passDataTo(source: homeDS, destination: &destinationDS)
    
    //MARK: - Navigation
//    private func navigateTo(source: ___VARIABLE_sceneName___ViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
    
    //MARK: - Passing Data
//    private func passDataTo(source: ___VARIABLE_sceneName___.DataStore, destination: inout Destination.DataStore) {
//        destination.dataStore = source.dataStore
//    }
    
}//
