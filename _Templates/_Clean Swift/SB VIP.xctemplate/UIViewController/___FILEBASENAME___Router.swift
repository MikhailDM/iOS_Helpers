//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol ___VARIABLE_sceneName___RouterLogicProtocol: class {
    func routeTo()
}

//MARK: - Router
class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RouterProtocol, ___VARIABLE_sceneName___RouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: ___VARIABLE_sceneName___ViewController?
    
    //MARK: - Route
    func routeTo() { }
    
//    let storyboard = UIStoryboard(name: "DestinationSB", bundle: nil)
//    guard let sourceVC = view,
//          let sourceDS = view?.dataStore,
//          let destinationVC = storyboard.instantiateViewController(withIdentifier: "UIViewController") as? UIViewController,
//          var destinationDS = destinationVC.dataStore else { print("===== NAVIGATION FAIL"); return }
//    navigateTo(source: sourceVC, destination: destinationVC)
//    passDataTo(source: sourceDS, destination: &destinationDS)
    
    //MARK: - Navigation
//    private func navigateTo(source: ___VARIABLE_sceneName___ViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
    
    //MARK: - Passing Data
//    private func passDataTo(source: ___VARIABLE_sceneName___DataStoreProtocol, destination: inout DestinationDataStoreProtocol) {
//        destination.data = source.data
//    }
}
