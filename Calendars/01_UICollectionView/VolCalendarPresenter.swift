//
//  VolCalendarPresenter.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

//MARK: - Protocol. Presentation

protocol VolCalendarPresentationLogic {
    func presentData(response: VolCalendar.Model.Response.ResponseType)
}


class VolCalendarPresenter: VolCalendarPresentationLogic {
    //MARK: - Properties
    
    weak var viewController: VolCalendarDisplayLogic?
    
    
    //MARK: - Helper
    
    private let datesManager = VolDates()
    private let colors = VolColors()
    
    
    //MARK: - Present Data
    
    func presentData(response: VolCalendar.Model.Response.ResponseType) {
        switch response {
        case .presentCalendar(data: let data):
            let viewModel = getCalendarViewModel(data: data)
            viewController?.displayData(viewModel: .displayCalendar(viewModel: viewModel))
        }
    }
    
    
    
    
    //MARK: - Private. View Model
    
    private func getCalendarViewModel(data: VolCalendarData) -> VolCalendarViewModel {
        let cells = data.currentMonthDates.map({ (date) in
            getCalendarCell(date: date, currentPage: data.currentPageDate, selectedDatesRange: data.selectedDatesRange)
        })
        return VolCalendarViewModel(cells: cells,
                                    currentPageText: datesManager.getCurrentPageInLongFormat(from: data.currentPageDate),
                                    backButtonState: getBackButtonState(currentPage: data.currentPageDate),
                                    screenTitle: getScreenTitle(selectedDatesRange: data.selectedDatesRange))
    }
    
    private func getCalendarCell(date: Date, currentPage: Date, selectedDatesRange: [Date]?) -> VolCalendarCell {
        
        let cell = VolCalendarCell(dateString: getCalendarCellDateString(date: date, currentPage: currentPage),
                                   dateDate: date,
                                   bgImage: getCalendarCellDateImage(cellDate: date, selectedDatesRange: selectedDatesRange, currentPage: currentPage),
                                   fontColor: getCalendarCellFontColor(date: date, selectedDatesRange: selectedDatesRange),
                                   isInteractable: isCellIteractable(date: date, currentPage: currentPage))
        return cell
    }
    
    
    
    
    //MARK: - Private
    
    private func getCalendarCellDateString(date: Date, currentPage: Date) -> String? {
        let isDateFromCurrentMonth = datesManager.isDateFromCurrentMonth(date: date, month: currentPage)
        switch isDateFromCurrentMonth {
        case true:
            return datesManager.dateOnlyDay(from: date)
        case false:
            return nil
        }
    }
   
    private func getCalendarCellFontColor(date: Date, selectedDatesRange: [Date]?) -> UIColor {
        guard !datesManager.isDateLessThanToday(date: date) else {
            return colors.calendarLightGray
        }
        
        guard let selectedDatesRangeSafe = selectedDatesRange,
            selectedDatesRangeSafe.contains(date) else {
                return datesManager.isDateToday(date: date) ? colors.blue : colors.calendarBlack
        }
        
        if date == selectedDatesRangeSafe.first {
            return .white
        } else if let dateLast = selectedDatesRangeSafe.last, date == dateLast {
            return .white
        } else {
            return colors.calendarBlack
        }
    }
    
    private func getCalendarCellDateImage(cellDate: Date, selectedDatesRange: [Date]?, currentPage: Date) -> UIImage? {
        guard
            let selectedDatesRangeSafe = selectedDatesRange,
            selectedDatesRangeSafe.contains(cellDate),
            isCellIteractable(date: cellDate, currentPage: currentPage) else { return nil }
        
        guard selectedDatesRangeSafe.count != 1 else {
            return UIImage(named: "ic_calendar_one_day")
        }
        
        if cellDate == selectedDatesRange?.first {
            return UIImage(named: "ic_calendar_first_day")
        } else if cellDate == selectedDatesRange?.last {
            return UIImage(named: "ic_calendar_last_day")
        } else {
            return UIImage(named: "ic_calendar_between")
        }
    }
    
    private func getScreenTitle(selectedDatesRange: [Date]?) -> String {
        guard let selectedDatesRangeSafe = selectedDatesRange else { return "Календарь" }
        
        if selectedDatesRangeSafe.count == 1 {
            let title = datesManager.getDateInShortFormat(from: selectedDatesRangeSafe.first)
            return title
        } else {
            let title = "\(datesManager.getDateInShortFormat(from: selectedDatesRangeSafe.first)) - \(datesManager.getDateInShortFormat(from: selectedDatesRangeSafe.last))"
            return title
        }
    }
    
    private func getBackButtonState(currentPage: Date) -> Bool {
        let isDateFromCurrentMonth = datesManager.isDateFromCurrentMonth(date: Date(), month: currentPage)
        return !isDateFromCurrentMonth
    }
    
    private func isCellIteractable(date: Date, currentPage: Date) -> Bool {
        let isDateFromCurrentMonth = datesManager.isDateFromCurrentMonth(date: date, month: currentPage)
        let isDateLessThanToday = datesManager.isDateLessThanToday(date: date)
        if !isDateFromCurrentMonth || isDateLessThanToday {
            return false
        } else {
            return true
        }
    }
    
    
}//Class End
