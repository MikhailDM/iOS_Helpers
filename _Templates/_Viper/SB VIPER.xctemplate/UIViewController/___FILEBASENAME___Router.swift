//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RouterProtocol {
    //MARK: - Properties
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol?
    
    
    //MARK: - Route
    func routeToView(view: ___VARIABLE_sceneName___.Route) { }
    
//Navigation Forward
//    func routeTo() {
//        let storyboard = UIStoryboard(name: "_____", bundle: nil)
//        guard let viewController = viewController,
//            //let homeDS = dataStore,
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "_____")
//              as? UIViewController else { print("===== NAVIGATION FAIL"); return }
//            //var destinationDS = destinationVC.router?.dataStore else { print("===== ===== NAVIGATION FAIL"); return }
//
//        navigateTo(source: viewController, destination: destinationVC)
//        //passDataTo(source: homeDS, destination: &destinationDS)
   
    
    //MARK: - Navigation
//    private func navigateTo(source: ___VARIABLE_sceneName___ViewController, destination: UIViewController) {
//        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
//    }
     
    
    //MARK: - PassingData
//    //Pass Data in Navigation Stack
//    private func passDataTo(source: ___VARIABLE_sceneName___DataStore, destination: inout DestinationDataStore) {
//        destination.dataStore = source.dataStore
//    }
}//
