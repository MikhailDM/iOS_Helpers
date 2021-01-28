//
//  NotifNetworkService.swift
//  ekpv2
//
//  Created by Mikhail Dmitriev on 20.01.2021.
//  Copyright © 2021 aisa. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

//MARK: - Protocol. NotifNetworkService
protocol NotifNetworkService {
    func getNotifCount() -> Observable<NotifNetworkModels.NotifCount>
    func getNotifTypes() -> Observable<NotifNetworkModels.NotifTypes>
    func getNotifIds(categories: [String]?, count: Int?, mark: Bool?) -> Observable<NotifNetworkModels.NotifIds>
    func getNotifDescriptions(ids: [Int]) -> Observable<NotifNetworkModels.NotifDescriptions>
}

//MARK: - NotifAlamofireService
struct NotifAlamofireService: NotifNetworkService {
    
    //MARK: - Manager
    private let alamofireManager = InetUtils.getAlamoFire()
    
    //MARK: - Get notifications count
    func getNotifCount() -> Observable<NotifNetworkModels.NotifCount> {
        let url = InetConstants.getNotifCountAddressV2()
        return alamofireManager.rx.request(.get, url, parameters: nil, encoding: JSONEncoding.default)
            .responseData()
            .map { response -> NotifNetworkModels.NotifCount in
                return try JSONDecoder().decode(NotifNetworkModels.NotifCount.self, from: response.1)
            }
    }
    
    //MARK: - Get notifications types
    func getNotifTypes() -> Observable<NotifNetworkModels.NotifTypes> {
        let url = InetConstants.getNotifTypesAddressV2()
        return alamofireManager.rx.request(.get, url, parameters: nil, encoding: JSONEncoding.default)
            .responseData()
            .map { response -> NotifNetworkModels.NotifTypes in
                return try JSONDecoder().decode(NotifNetworkModels.NotifTypes.self, from: response.1)
            }
    }
    
    
    //MARK: - Get notifications Ids
    func getNotifIds(categories: [String]?, count: Int?, mark: Bool?) -> Observable<NotifNetworkModels.NotifIds> {
        var parameters: [String: Any] = [:]
        if let categoriesSafe = categories { parameters["categories"] = categoriesSafe }
        if let countSafe = count { parameters["count"] = countSafe }
        if let markSafe = mark { parameters["mark"] = markSafe }
        
        let url = InetConstants.getNotifIdsAddressV2()
        return alamofireManager.rx.request(.post, url, parameters: parameters, encoding: JSONEncoding.default)
            .responseData()
            .map { response -> NotifNetworkModels.NotifIds in
                return try JSONDecoder().decode(NotifNetworkModels.NotifIds.self, from: response.1)
            }
    }
    
    //MARK: - Get notifications descriptions
    func getNotifDescriptions(ids: [Int]) -> Observable<NotifNetworkModels.NotifDescriptions> {
        let parameters: [String: Any] = ["ids": ids]
        let url = InetConstants.getNotifDescriptionAddressV2()
        return alamofireManager.rx.request(.post, url, parameters: parameters, encoding: JSONEncoding.default)
            .responseData()
            .map { response -> NotifNetworkModels.NotifDescriptions in
                return try JSONDecoder().decode(NotifNetworkModels.NotifDescriptions.self, from: response.1)
            }
    }
}
