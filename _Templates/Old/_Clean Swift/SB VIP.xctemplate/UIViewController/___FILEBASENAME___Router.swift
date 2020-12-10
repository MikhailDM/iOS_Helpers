//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//


import UIKit


//MARK: - Protocol. Routing
protocol ___VARIABLE_sceneName___RoutingLogic {
    func routeTo()
}


class ___VARIABLE_sceneName___Router: NSObject, ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {
    //MARK: - Properties
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?
    
    
    //MARK: - Routing
    //Navigation Forward
    func routeTo() {
//        let storyboard = UIStoryboard(name: "_____", bundle: nil)
//        guard let viewController = viewController,
//            //let homeDS = dataStore,
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "_____")
//              as? UIViewController else { print("===== NAVIGATION FAIL"); return }
//            //var destinationDS = destinationVC.router?.dataStore else { print("===== ===== NAVIGATION FAIL"); return }
//
//        navigateTo(source: viewController, destination: destinationVC)
//        //passDataTo(source: homeDS, destination: &destinationDS)
    }
    
//    //Navigation Backward
//    func routeTo() {
//        guard
//            let viewController = viewController,
//            //let homeDS = dataStore,
//            let destinationVC = viewController.navigationController?.viewControllers.dropLast().last as? UIViewController else { print("===== NAVIGATION FAIL"); return }
//            //var destinationDS = destinationVC.router?.dataStore else { print("===== NAVIGATION FAIL"); return }
//
//        navigateTo(source: viewController, destination: destinationVC)
//        //passDataTo(source: homeDS, destination: &destinationDS)
//    }
    
//    //Navigation Backward From Modal
//    func routeTo() {
//        guard
//            let viewController = viewController,
//            let homeDS = dataStore else { fatalError("NAVIGATION FAIL") }
//
//        passDataTo(source: homeDS)
//        navigateTo(source: viewController)
//    }
    
//    //Navigation Forward To Modal
//    func routeToThree() {
//        let storyboard = UIStoryboard(name: "_____", bundle: nil)
//        guard
//            let viewController = viewController,
//            let homeDS = dataStore,
//            let destinationNC = storyboard.instantiateViewController(withIdentifier: "_____") as? UINavigationController,
//            let destinationVC = destinationNC.viewControllers.first as? UIViewController,
//            var destinationDS = destinationVC.router?.dataStore else { fatalError("NAVIGATION FAIL") }
//
//        destinationVC.delegate = viewController
//        navigateToThree(source: viewController, destination: destinationNC)
//        passDataToThree(source: homeDS, destination: &destinationDS)
//    }
    
    
    //MARK: - Navigation
    private func navigateTo(source: ___VARIABLE_sceneName___ViewController, destination: UIViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
        
        //Navigation Backward
        //source.navigationController?.popViewController(animated: true)
        
        //Navigation Backward From Modal
        //source.dismiss(animated: true, completion: nil)
    }
     
    
    //MARK: - PassingData
//    //Pass Data in Navigation Stack
//    private func passDataTo(source: ___VARIABLE_sceneName___DataStore, destination: inout DestinationDataStore) {
//        destination.dataStore = source.dataStore
//    }
//
//    //Pass Data in Modal with Delegate
//    private func passDataTo(source: ___VARIABLE_sceneName___DataStore) {
//        viewController?.delegate?.onDataSaved(data: source.dataStore)
//    }
    
}//
