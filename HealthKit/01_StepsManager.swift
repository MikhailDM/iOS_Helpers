//
//  ActiveHealthManager.swift
//  Steps
//
//  Created by Михаил Дмитриев on 14.07.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import Foundation
import HealthKit


//MARK: - Types of health access
enum ActivHeathAccessType {
    case HKAccessGranted
    case HKAccessNotDetermined
    case HKNoSupport
    case HKAccessDenied
}


class ActivHealthManager {
    //MARK: - Properties
    private var healthStore = HKHealthStore()
    private var calendar = Calendar.current
    
    
    //MARK: - Check access to health
    func checkAccessToHealth(completion: @escaping (ActivHeathAccessType) -> Void) {
        //Support check
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(.HKNoSupport)
            print("HKDATA - HKNoSupport")
            return
        }
        //Data Type
        guard let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        //Current Date Morning
        //let startDate = calendar.startOfDay(for: Date())
        //Predicate
        //let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        //Status
        switch healthStore.authorizationStatus(for: stepType) {
        case .notDetermined:
            print("HKSTATUS - NotDetermined")
            print("HKDATA - HKAccessNotDetermined")
            completion(.HKAccessNotDetermined)
            
        case .sharingDenied:
            print("HKSTATUS - SharingDenied")
            completion(.HKAccessDenied)
//            Request Authorization. Trouble if no data in Health
//            let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
//                guard let result = result, let _ = result.sumQuantity() else {
//                    print("HKDATA - HKAccessDenied")
//                    completion(.HKAccessDenied)
//                    return
//                }
//                print("HKDATA - HKAccessGranted")
//                completion(.HKAccessGranted)
//            }
//            healthStore.execute(query)
            
        case .sharingAuthorized:
            print("HKSTATUS - SharingAuthorized")
            print("HKDATA - HKAccessGranted")
            completion(.HKAccessGranted)
            
        @unknown default:
            print("HKSTATUS - UnknownDefault")
            print("HKDATA - HKAccessNotDetermined")
            completion(.HKAccessNotDetermined)
        }
    }
    
    
    //MARK: - Request access to health
    func requestAccessToHealth(completion: @escaping (ActivHeathAccessType) -> Void) {
        //Support check
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(.HKNoSupport)
            print("HKDATA - HKNoSupport")
            return
        }
        //Data Type
        guard let steps = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        //Prepare a list of types you want HealthKit to read and write
        let healthKitTypesToRead: Set<HKObjectType> = [steps]
        let healthKitTypesToWrite: Set<HKSampleType> = [steps]
        
        //Request Authorization
        healthStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in
            guard error == nil else {
                print("HKSTATUS - Error")
                completion(.HKAccessDenied)
                return
            }
            switch success {
                
            case true:
                print("HKSTATUS - RequestAuthorization True")
                self.checkAccessToHealth { (type) in
                    completion(type)
                }
            case false:
                
                print("HKSTATUS - RequestAuthorization False")
                self.checkAccessToHealth { (type) in
                    completion(type)
                }
            }
        }
    }
    
    
    //MARK: - Get steps count
    func getStepsCountForCurrentDay(completion: @escaping (Double?) -> Void) {
        guard let stepsQuantityType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(nil)
                return
            }
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        healthStore.execute(query)
    }
    
    
    
    //MARK: - Get array steps for week
    func getStepsCountForWeek(completion: @escaping ([ActivStepsStatistic]?) -> Void) {
        guard let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        //Последний день
        let now = Date()
        let oneWeekAgoMorning = ActivDateManager.getDateWeekAgo(from: now)
        
        //Интервал
        var interval = DateComponents()
        interval.day = 1
        
        //Массив данных за неделю
        var allStatistics = [ActivStepsStatistic]()
        
        //Запрос
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: stepsQuantityType,
                                                     quantitySamplePredicate: nil,
                                                     options: .cumulativeSum,
                                                     anchorDate: oneWeekAgoMorning,
                                                     intervalComponents: interval)
        //Результаты запроса
        stepsQuery.initialResultsHandler = { query, results, error in
            //Проверка доступности HK
            guard let results = results, results.statistics().count != 0 else {
                completion(nil)
                return
            }
            //Перебор статистики
            results.enumerateStatistics(from: oneWeekAgoMorning, to: now) { statistics, pointer in
                //Дата
                let date = statistics.startDate
                //Проверка - есть ли шаги за данный день
                guard let quantity = statistics.sumQuantity() else {
                    //Добавляем нулевую модель за день
                    allStatistics.append(ActivStepsStatistic(date: ActivDateManager.getDateYYYYMMdd(from: date),
                                                             dayOfWeek: ActivDateManager.getOnlyWeekday(from: date),
                                                             stepsCount: 0.0))
                    return
                }
                //Добавляем модель за день c шагами
                let steps = quantity.doubleValue(for: HKUnit.count())
                allStatistics.append(ActivStepsStatistic(date: ActivDateManager.getDateYYYYMMdd(from: date),
                                                         dayOfWeek: ActivDateManager.getOnlyWeekday(from: date),
                                                         stepsCount: steps))
            }
            completion(allStatistics)
        }
        healthStore.execute(stepsQuery)
    }
    
}//
