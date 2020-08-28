import Foundation

//Работаем с датами

//MARK: - INIT

private let calendar = Calendar.current

enum DateFormat: String {
    case onlyDayOfWeek = "EEEEE"
    case onlyHoursAndMinutes = "HH:mm"
    case dateWithDash = "yyyy-MM-dd"
}

enum DateLocale: String {
    case ru = "ru_RU"
    case en = "en_EN"
}

private func initDateFormatter(dateFormat: DateFormat, locale: DateLocale) -> DateFormatter {
    let df = DateFormatter()
    df.locale = Locale(identifier: locale.rawValue)
    df.dateFormat = dateFormat.rawValue
    return df
}


//MARK: - FUNCTION. UNIVERSAL DATE FORMAT FUNCTION

func getStringFromDate(date: Date, format: DateFormat, locale: DateLocale) -> String {
    let df = initDateFormatter(dateFormat: format, locale: locale)
    return df.string(from: date)
}




//MARK: - FUNCTION. ONLY WEEKDAY IN STRING. "Вт"

func onlyDayOfWeek(from date: Date) -> String {
    let df = initDateFormatter(dateFormat: .onlyDayOfWeek, locale: .ru)
    return df.string(from: date).capitalized
}


//MARK: - FUNCTION. ONLY HOURS AND MINUTES. "22:00"

func onlyHoursAndMinutes(from date: Date) -> String {
    let df = initDateFormatter(dateFormat: .onlyHoursAndMinutes, locale: .ru)
    return df.string(from: date)
}

//MARK: - FUNCTION. SIMPLE DATE. "2020-12-25"

func dateWithDash(from date: Date) -> String {
    let df = initDateFormatter(dateFormat: .dateWithDash, locale: .ru)
    return df.string(from: date)
}

//MARK: - FUNCTION. DATE A WEEK AGO MORNING

func getDateWeekAgo(from date: Date) -> Date {
    guard var oneWeekAgoMorning = calendar.date(byAdding: .day, value: -6, to: date) else { return Date() }
    oneWeekAgoMorning = calendar.startOfDay(for: oneWeekAgoMorning)
    return oneWeekAgoMorning
}

//MARK: - FUNCTION. GET DATE COMPONENTS

func getDateComponents(from date: Date) {
    let dcs = calendar.dateComponents([.year, .month, .day], from: date)
    guard let year = dcs.year, let month = dcs.month, let day = dcs.day else { return }
    print("YEAR: \(year)", "MONTH: \(month)", "DAY: \(day)")
}



print(onlyDayOfWeek(from: Date()))
print(onlyHoursAndMinutes(from: Date()))
print(dateWithDash(from: Date()))
print(getDateWeekAgo(from: Date()))
print(getDateComponents(from: Date()))
print(getStringFromDate(date: Date(), format: .onlyHoursAndMinutes, locale: .ru))
