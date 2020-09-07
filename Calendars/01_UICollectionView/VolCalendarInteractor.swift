//
//  VolCalendarInteractor.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol. Interactor

protocol VolCalendarBusinessLogic {
    func makeRequest(request: VolCalendar.Model.Request.RequestType)
}


//MARK: - Protocol. Data Store

protocol VolCalendarDataStore {
    var firstSelectedDate: Date? { get set }
    var lastSelectedDate: Date? { get set }
    var selectedDatesRange: [Date]? { get set }
}


class VolCalendarInteractor: VolCalendarBusinessLogic, VolCalendarDataStore {
    //MARK: - Properties
    
    var presenter: VolCalendarPresentationLogic?
    var service: VolCalendarService?
    
    //Data Store
    var firstSelectedDate: Date?
    var lastSelectedDate: Date?
    var selectedDatesRange: [Date]?
    var currentPage = Date()
    
    
    //MARK: - Helper
    
    private let datesManager = VolDates()
    
    
    //MARK: - Requests
    
    func makeRequest(request: VolCalendar.Model.Request.RequestType) {
        if service == nil {
            service = VolCalendarService()
        }
        
        switch request {
        case .configureCalendar:
            presenter?.presentData(response: .presentCalendar(data: getCalendarData()))
            
        case .moveCalendarCurrentPage(isUp: let isUp):
            moveCalendarCurrentPage(isUp: isUp)
            presenter?.presentData(response: .presentCalendar(data: getCalendarData()))
            
        case .setSelectedDate(date: let date):
            setSelectedDate(date: date)
            presenter?.presentData(response: .presentCalendar(data: getCalendarData()))
            
        case .restorePreviousSettings:
            restorePreviousSettings()
        }
    }
    
    
    //MARK: - Private. Get Data
    
    private func getCalendarData() -> VolCalendarData {
        let monthDates = getDatesArrayOfCurrentMonth()
        let data = VolCalendarData(currentMonthDates: monthDates,
                                   currentPageDate: currentPage,
                                   selectedDatesRange: selectedDatesRange)
        return data
    }
    
    
    //MARK: - Private. Get Dates Of Current For Calendar
    
    private func getDatesArrayOfCurrentMonth() -> [Date] {
        let startOfTheMonth = datesManager.getDateFromDate(from: currentPage, newType: .startOfTheMonth)
        let endOfTheMonth = datesManager.getDateFromDate(from: currentPage, newType: .endOfTheMonth)
        
        let startOfTheWeek = datesManager.getDateFromDate(from: startOfTheMonth, newType: .startOfTheWeek)
        let endOfTheWeek = datesManager.getDateFromDate(from: endOfTheMonth, newType: .endOfTheWeek)
        
        let currentMonthDatesArray = datesManager.getDatesRange(from: startOfTheWeek, to: endOfTheWeek)
        return currentMonthDatesArray
    }
    
    
    //MARK: - Private. Move Current Page
    
    private func moveCalendarCurrentPage(isUp: Bool) {
        switch isUp {
        case true:
            currentPage = datesManager.getDateFromDate(from: currentPage, newType: .nextMonth)
        case false:
            currentPage = datesManager.getDateFromDate(from: currentPage, newType: .previousMonth)
        }
    }
    
    
    //MARK: - Private. Set Selected Date
    
    private func setSelectedDate(date: Date) {
        //Non dates selected:
        if firstSelectedDate == nil {
            firstSelectedDate = date
            selectedDatesRange = [firstSelectedDate!]
            return
        }
        
        //Only first date is selected:
        if firstSelectedDate != nil && lastSelectedDate == nil {
            //If the last date is less than the first date:
            if date <= firstSelectedDate! {
                firstSelectedDate = date
                selectedDatesRange = [firstSelectedDate!]
                return
            }
            //Else - array dates between 2 dates
            let range = datesManager.getDatesRange(from: firstSelectedDate!, to: date)
            
            lastSelectedDate = range.last
            selectedDatesRange = range
            return
        }
        
        // Both Dates are selected:
        if firstSelectedDate != nil && lastSelectedDate != nil {
            //If the last date is less than the first date:
            if date <= firstSelectedDate! {
                firstSelectedDate = date
                lastSelectedDate = nil
                selectedDatesRange = [firstSelectedDate!]
                return
            //If the last date is in selected middle:
            } else if date > firstSelectedDate! && date <= lastSelectedDate! {
                firstSelectedDate = date
                lastSelectedDate = nil
                selectedDatesRange = [firstSelectedDate!]
                return
            }
            //Else - array dates between 2 dates
            let range = datesManager.getDatesRange(from: firstSelectedDate!, to: date)
            lastSelectedDate = range.last
            selectedDatesRange = range
        }
    }
    
    
    //MARK: - Private. Restore Settings
    
    private func restorePreviousSettings() {
        //No previous settings
        if firstSelectedDate == nil && lastSelectedDate == nil {
            return
        }
        
        //One date selected
        if firstSelectedDate != nil && lastSelectedDate == nil {
            selectedDatesRange = [firstSelectedDate!]
            currentPage = firstSelectedDate!
            return
        }
        
        // Both Dates are selected
        if firstSelectedDate != nil && lastSelectedDate != nil {
            let range = datesManager.getDatesRange(from: firstSelectedDate!, to: lastSelectedDate!)
            lastSelectedDate = range.last
            selectedDatesRange = range
            currentPage =  lastSelectedDate!
            return
        }
    }
    
    
}//Class End
