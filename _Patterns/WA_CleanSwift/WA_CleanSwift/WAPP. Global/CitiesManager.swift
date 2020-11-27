//
//  CitiesManager.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//

import Foundation
import MapKit
import RxSwift


class CitiesManager: NSObject, MKLocalSearchCompleterDelegate {
    //MARK: - Properties
    private var completer: MKLocalSearchCompleter = MKLocalSearchCompleter()
    public var searchedCities = PublishSubject<[MKLocalSearchCompletion]>()
    
    
    //MARK: - Init
    override init() {
        super.init()
        completer.delegate = self
        completer.region = MKCoordinateRegion(.world)
        completer.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
    }
    
    
    //MARK: - Get Cities
    func getCitiesAfterSearch(searchText: String) {
        guard searchText != "" else { searchedCities.onNext([]); return }
        completer.queryFragment = searchText
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print("===== COMPLETER: \(completer)")
        let results = completer.results.filter { result in
            guard result.title.contains(",") || !result.subtitle.isEmpty,
                  !result.subtitle.contains("Nearby") else { return false }
            return true
        }
        print("===== RESULTS: \(results)")
        searchedCities.onNext(results)
        //let asd = results.map { $0.title + ($0.subtitle.isEmpty ? "" : ", " + $0.subtitle) }
    }
    
}//
