//
//  VolCalendarModels.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

enum VolCalendar {
    //MARK: - Models
    
    enum Model {
        struct Request {
            enum RequestType {
                case restorePreviousSettings
                case configureCalendar
                case moveCalendarCurrentPage(isUp: Bool)
                case setSelectedDate(date: Date)
            }
        }
        struct Response {
            enum ResponseType {
                case presentCalendar(data: VolCalendarData)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayCalendar(viewModel: VolCalendarViewModel)
            }
        }
    }
    
    
}//Enum End


//MARK: - Screen View Model
struct VolCalendarViewModel {
    var cells: [VolCalendarCell]
    var currentPageText: String
    var backButtonState: Bool
    var screenTitle: String
}

struct VolCalendarCell {
    var dateString: String?
    var dateDate: Date?
    var bgImage: UIImage?
    var fontColor: UIColor?
    var isInteractable: Bool
}


//MARK: - Data

struct VolCalendarData {
    var currentMonthDates: [Date]
    var currentPageDate: Date
    var selectedDatesRange: [Date]?
}
