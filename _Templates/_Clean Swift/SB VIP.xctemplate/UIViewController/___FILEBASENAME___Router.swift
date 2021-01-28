//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

//MARK: - Protocol. Interactor -> Another View
protocol ___VARIABLE_sceneName___RouterLogic: class {
    func routeTo()
}

//MARK: - Router
class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RouterDependencies, ___VARIABLE_sceneName___RouterLogic {
    
    //MARK: - Properties
    weak var view: ___VARIABLE_sceneName___ViewController?
    
    //MARK: - Route
    func routeTo() { }
    
//    guard let sourceVC = view,
//          let sourceDS = view?.dataStore,
//          let destinationVC = UIStoryboard(name: "Second", bundle: nil)
//            .instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController,
//          var destinationDS = destinationVC.dataStore else { print("===== Navigation Fail"); return }
//    passDataTo(source: sourceDS, destination: &destinationDS)
//    sourceVC.navigationController?.pushViewController(destinationVC, animated: true)
    
    //MARK: - Passing Data
//    private func passDataTo(source: ___VARIABLE_sceneName___DataStore, destination: inout DestinationDataStore) {
//        destination.data = source.data
//    }
}
