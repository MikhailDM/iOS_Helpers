//
//  WAppSearchInteractor.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift


//MARK: - Protocol. Data Store
protocol WAppSearchDataStore {
    var cityName: String? { get set }
}


class WAppSearchInteractor: WAppSearchBusinessLogic, WAppSearchDataStore {
    //MARK: - Properties
    var presenter: WAppSearchPresentationLogic?
    var cityName: String?
    
    private var searchData = [String]()
    private var disposeBag = DisposeBag()
    
    //MARK: - Managers
    private let citiesManager = CitiesManager()
    
    
    //MARK: - Requests
    func makeRequest(request: WAppSearch.Model.Request.RequestType) {
        switch request{
        case .subscribeToSearchedCities:
            citiesManager.searchedCities
                .debug("===== CITIES MANAGER")
                .subscribe(onNext: { [weak self] cities in
                    guard let self = self else { return }
                    self.searchData = cities.map { $0.title }
                    self.presenter?.presentData(response: .presentCitiesWhichContainText(searchData: self.searchData))
                }).disposed(by: disposeBag)
            
        case .getCitiesWhichContainText(searchText: let searchText):
            citiesManager.getCitiesAfterSearch(searchText: searchText)
        }
    }
    
}//
