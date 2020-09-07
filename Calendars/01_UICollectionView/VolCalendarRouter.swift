//
//  VolCalendarRouter.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

//MARK: - Protocol. Routing

protocol VolCalendarRoutingLogic {
    func routeBackToFilter()
}


//MARK: - Protocol. Data Passing

protocol VolCalendarDataPassing {
    var dataStore: VolCalendarDataStore? { get set }
}


class VolCalendarRouter: NSObject, VolCalendarRoutingLogic, VolCalendarDataPassing {
    //MARK: - Properties
    
    weak var viewController: VolCalendarViewController?
    var dataStore: VolCalendarDataStore?
    
    
    //MARK: - Routing
    
    //Navigation Backward from Modal
    func routeBackToFilter() {
        guard
            let viewController = viewController,
            let homeDS = dataStore else { fatalError("NAVIGATION FAIL") }
        
        navigateBackToFilter(source: viewController)
        passDataBackToFilter(source: homeDS)
    }
    
    
    //MARK: - Navigation
    
    private func navigateBackToFilter(source: VolCalendarViewController) {
        //Navigation Backward From Modal
        source.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Passing Data
    
    //Pass Data from Modal
    private func passDataBackToFilter(source: VolCalendarDataStore) {
        viewController?.calendarDelegate?.onCalendarDismiss(dateBegin: source.firstSelectedDate, dateEnd: source.lastSelectedDate)
    }
    
    
}//Class End
