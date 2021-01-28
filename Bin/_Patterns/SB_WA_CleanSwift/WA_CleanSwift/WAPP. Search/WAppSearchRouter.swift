//
//  WAppSearchSearchRouter.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020
//

import UIKit
import RxSwift

class WAppSearchRouter: WAppSearchRouterProtocol, WAppSearchRouterLogicProtocol {
    
    //MARK: - Properties
    weak var view: WAppSearchViewController?
    private var disposeBag = DisposeBag()
    
    
    //MARK: - Routing
    func routeTo(routeType: WAppSearch.Route) {
        switch routeType {
        case .dismissView:
            view?.dismiss(animated: true, completion: nil)
        }
    }
    
}//
