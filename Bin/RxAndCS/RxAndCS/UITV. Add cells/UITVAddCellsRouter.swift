//
//  UITVAddCellsRouter.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. RoutingLogic

protocol UITVAddCellsRoutingLogic {
    func routeTo()
}


//MARK: - Protocol. DataPassing

protocol UITVAddCellsDataPassing {
    var dataStore: UITVAddCellsDataStore? { get set }
}


class UITVAddCellsRouter: NSObject, UITVAddCellsRoutingLogic, UITVAddCellsDataPassing {
    //MARK: - Properties
    
    weak var viewController: UITVAddCellsViewController?
    var dataStore: UITVAddCellsDataStore?
    
    
    //MARK: - Routing
    
    //Navigation Forward
    func routeTo() { }
    
    
    //MARK: - Navigation
    
    private func navigateTo(source: UITVAddCellsViewController, destination: UIViewController) { }
     
    
    //MARK: - Passing data
    
    
}//
