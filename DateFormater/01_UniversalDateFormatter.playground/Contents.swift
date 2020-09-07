import Foundation

//Работаем с датами

//MARK: - Init

private let calendar = Calendar.current

enum DateFormat: String {
    case onlyDayOfWeek = "EEEEE"
    case onlyHoursAndMinutes = "HH:mm"
    case dateWithDash = "yyyy-MM-dd"
    case onlyDay = "d"
}

enum DateLocale: String {
    case ru = "ru_RU"
    case en = "en_EN"
}

enum DateType {
    case startOfTheWeek
    case endOfTheWeek
    case startOfTheMonth
    case endOfTheMonth
    case nextMonth
    case previousMonth
    case weekAgo
    case startOfTheDay
    case endOfTheDay
}

private func initDateFormatter(dateFormat: DateFormat, locale: DateLocale) -> DateFormatter {
    let df = DateFormatter()
    df.locale = Locale(identifier: locale.rawValue)
    df.dateFormat = dateFormat.rawValue
    return df
}


//MARK: - Custom data

private let monthNamesLong = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
private let monthNamesShort = ["янв", "фев", "мар", "апр", "май", "июн", "июл", "авг", "сен", "окт", "ноя", "дек"]




//MARK: - Function. Universal Date formatter. Get String from Date

/// Get new String from Date
/// - Parameters:
///   - date: Initial Date
///   - format: New Date format
///   - locale: Locale
/// - Returns: String
func getStringFromDate(date: Date, format: DateFormat, locale: DateLocale) -> String {
    let df = initDateFormatter(dateFormat: format, locale: locale)
    return df.string(from: date)
}


//MARK: - Function. Universal Date formatter. Get Date from Date

/// Get new Date from Date
/// - Parameters:
///   - date: Initial Date
///   - newType: New Date format
/// - Returns: Date
func getDateFromDate(from date: Date, newType: DateType) -> Date {
    switch newType {
    case .startOfTheWeek:
        guard
            let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)),
            let monday = calendar.date(byAdding: DateComponents(day: 1), to: sunday) else { return Date() }
        //Check if initial day is Sunday
        guard
            let weekday = calendar.dateComponents([.weekday], from: date).weekday,
            weekday == 1,
            let addWeekAgoToMonday = calendar.date(byAdding: DateComponents(day: -7), to: monday) else { return monday }
        return addWeekAgoToMonday
        
    case .endOfTheWeek:
        let startOfTheWeek = getDateFromDate(from: date, newType: .startOfTheWeek)
        guard let sunday = calendar.date(byAdding: DateComponents(day: -1, weekOfYear: 1), to: startOfTheWeek) else { return Date() }
        return sunday
        
    case .startOfTheMonth:
        guard let date = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else { return Date() }
        return date
        
    case .endOfTheMonth:
        let startOfTheMonth = getDateFromDate(from: date, newType: .startOfTheMonth)
        guard let date = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfTheMonth) else { return Date() }
        return date
        
    case .nextMonth:
        guard let nextMonth = calendar.date(byAdding: DateComponents(month: 1), to: date) else { return Date() }
        return nextMonth
       
    case .previousMonth:
        guard let previousMonth = calendar.date(byAdding: DateComponents(month: -1), to: date) else { return Date() }
        return previousMonth
        
    case .weekAgo:
        guard let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: date) else { return Date() }
        return oneWeekAgo
        
    case .startOfTheDay:
        let startOfTheDay = calendar.startOfDay(for: date)
        return startOfTheDay
        
    case .endOfTheDay:
        let startOfTheDay = calendar.startOfDay(for: date)
        guard let endOfTheDay = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfTheDay) else { return Date() }
        return endOfTheDay
    }
}




//MARK: - Function. Get array of Dates

/// Get array of Dates
/// - Parameters:
///   - from: Start Date
///   - to: End Date
/// - Returns: [Date]
func getDatesRange(from: Date, to: Date) -> [Date] {
    // In case of the "from" date is more than "to" date it should returns an empty array
    if from > to { return [Date]() }
    var tempDate = from
    var dates = [tempDate]
    while tempDate < to {
        tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
        dates.append(tempDate)
    }
    return dates
}


//MARK: - Function. Custom Data

/// Return custom data from Date
/// - Parameter date: Date
/// - Returns: "Январь 2020"/"Февраль 2020"...
func getDateInLongFormatString(from date: Date) -> String {
    let dateComponents = calendar.dateComponents([.month, .year], from: date)
    guard
        let dateMonthInt = dateComponents.month,
        let dateYearInt = dateComponents.year else { return "" }
    let dateYearString = "\(dateYearInt)"
    let dateMonthString = monthNamesLong[dateMonthInt - 1]
    let dateString = "\(dateMonthString) \(dateYearString)"
    
    return dateString
}


//MARK: - Function. Get Date components

func getDateComponents(from date: Date) {
    let dcs = calendar.dateComponents([.year, .month, .day], from: date)
    guard let year = dcs.year, let month = dcs.month, let day = dcs.day else { return }
    print("YEAR: \(year)", "MONTH: \(month)", "DAY: \(day)")
}


let sunday = calendar.date(byAdding: DateComponents(day: -1), to: Date())
print(getDateFromDate(from: sunday!, newType: .startOfTheWeek))
print(getDateFromDate(from: Date(), newType: .startOfTheWeek))
print(getDatesRange(from: getDateFromDate(from: Date(), newType: .weekAgo), to: Date()))
