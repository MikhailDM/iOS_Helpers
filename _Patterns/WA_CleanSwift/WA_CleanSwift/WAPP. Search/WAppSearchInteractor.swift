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
    var selectedCity: PublishSubject<String> { get set }
}


class WAppSearchInteractor: WAppSearchBusinessLogic, WAppSearchDataStore {
    //MARK: - Properties
    var presenter: WAppSearchPresentationLogic?
    var selectedCity = PublishSubject<String>()

    private var citiesList = [String]()
    private var searchData = [String]()
    private var disposeBag = DisposeBag()
    
    
    //MARK: - Managers
    private let citiesManager = CitiesManager()
    
    
    //MARK: - Requests
    func makeRequest(request: WAppSearch.Model.Request.RequestType) {
        switch request{
        case .subscribeToSearchedCities:
            citiesList = citiesManager.getAllCitiesName()
            presenter?.presentData(response: .presentCitiesWhichContainText(searchData: citiesList))

        case .getCitiesWhichContainText(searchText: let searchText):
            guard searchText != "" else {
                presenter?.presentData(response: .presentCitiesWhichContainText(searchData: citiesList))
                return
            }
            searchData = citiesList.filter { city -> Bool in
                return city.lowercased().contains(searchText.lowercased())
            }
            presenter?.presentData(response: .presentCitiesWhichContainText(searchData: searchData))
            
        case .selectCity(city: let city):
            selectedCity.onNext(city)
            
        case .completeSubscription:
            selectedCity.onCompleted()
        }
    }
    
}//
