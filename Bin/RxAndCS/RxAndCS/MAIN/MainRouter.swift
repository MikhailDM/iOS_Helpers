//
//  MainRouter.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. RoutingLogic

protocol MainRoutingLogic {
    func routeByType(routeType: MainViewModel.Section.Cell.CellRouteType)
}


//MARK: - Protocol. DataPassing

protocol MainDataPassing {
    var dataStore: MainDataStore? { get set }
}


class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    //MARK: - Properties
    
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    
    //MARK: - Routing
    
    //Navigation Forward
    func routeByType(routeType: MainViewModel.Section.Cell.CellRouteType) {
        switch routeType {
        case .addCell:
            let storyboard = UIStoryboard(name: "UITVAddCells", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "UITVAddCellsViewController")
                    as? UITVAddCellsViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
        
        case .customCell:
            let storyboard = UIStoryboard(name: "UITVCustomCells", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "UITVCustomCellsViewController")
                    as? UITVCustomCellsViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
            
        case .addingNumbers:
            let storyboard = UIStoryboard(name: "AddNumbers", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "AddNumbersViewController")
                    as? AddNumbersViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
            
        case .weatherApp:
            let storyboard = UIStoryboard(name: "WApp", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "WAppViewController")
                    as? WAppViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
            
        case .fulscreenCell:
            let storyboard = UIStoryboard(name: "UITVFullscreen", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "UITVFullscreenViewController")
                    as? UITVFullscreenViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
        
        case .calculatingCell:
            let storyboard = UIStoryboard(name: "UITVCalculating", bundle: nil)
            guard
                let viewController = viewController,
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "UITVCalculatingViewController")
                    as? UITVCalculatingViewController else { fatalError("NAVIGATION FAIL") }
            navigateForward(source: viewController, destination: destinationVC)
        }
    }
    
    
    //MARK: - Navigation
    
    private func navigateForward(source: MainViewController, destination: UIViewController) {
        //Navigation Forward
        source.navigationController?.pushViewController(destination as UIViewController, animated: true)
    }
     
    
    //MARK: - Passing data
    
    
}//
