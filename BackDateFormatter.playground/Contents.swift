import UIKit

// MARK: - Basic Usage

let momentInTime = Date()
print(momentInTime.description)

let secondsAgo = -momentInTime.timeIntervalSinceNow
print("\nmomentInTime happened \(secondsAgo) seconds ago,")
let secondsSinceReferenceDate = momentInTime.timeIntervalSinceReferenceDate
print("or \(secondsSinceReferenceDate) seconds since January 1, 2001,")
let secondsSinceUnixEpochDate = momentInTime.timeIntervalSince1970
print("or \(secondsSinceUnixEpochDate) seconds since January 1, 1970.")

print()
print(momentInTime.description(with: Locale(identifier: "en-US")))    // US English
print(momentInTime.description(with: Locale(identifier: "en-GB")))    // British English
print(momentInTime.description(with: Locale(identifier: "es")))       // Spanish
print(momentInTime.description(with: Locale(identifier: "zh-Hans")))  // Simplified Chinese
print(momentInTime.description(with: Locale(identifier: "id_ID"))) // Simplified Indonesia


// MARK: - User Locale Date

var userLocale = Locale.autoupdatingCurrent
let fiveSecondsAgo = Date(timeIntervalSinceNow: -5)
let eightMinutesFromNow = Date(timeIntervalSinceNow: 8 * 60)
print("5 seconds ago, it was \(fiveSecondsAgo.description(with: userLocale)).")
print("8 minutes from now, it will be \(eightMinutesFromNow.description(with: userLocale)).")


// More simpler with DateFormatter() and iso860DateFormatter()

let myDateFormatter = DateFormatter()
myDateFormatter.dateFormat = "MMMM d, y 'at' h:mm a, zzzz"

var motherOfAllDemosDate = myDateFormatter.date(from: "December 9, 1968 at 3:45 PM, Pacific Standard Time")!
print("\nThe Mother of All Demos took place on \(motherOfAllDemosDate.description(with: userLocale)).")

let iso8601DateFormatter = ISO8601DateFormatter()
motherOfAllDemosDate = iso8601DateFormatter.date(from: "1968-12-09T15:45:00-08:00")!
print("\nOnce again, the Mother of All Demos took place on \(motherOfAllDemosDate.description(with: userLocale)).")


// MARK: - Calendar & DateComponents

print("\nThe current calendar is \(Calendar.current).")
print("The current calendar’s time zone is \(Calendar.current.timeZone) ")

var gregorianCalendar = Calendar(identifier: .gregorian)
gregorianCalendar.locale = userLocale

let iPhoneStevenoteComponents = DateComponents(
  calendar: gregorianCalendar,
  timeZone: TimeZone(identifier: "America/Los_Angeles"),
  year: 2007,
  month: 1,
  day: 9,
  hour: 10,
  minute: 00
)

let iPhoneStevenoteDate = gregorianCalendar.date(from: iPhoneStevenoteComponents)!
print("\nOnce again, the iPhone Stevenote took place on \(iPhoneStevenoteDate.description(with: userLocale)).")

// Different time zone
var iPadStevenoteComponents = DateComponents()
iPadStevenoteComponents.year = 2010
iPadStevenoteComponents.month = 1
iPadStevenoteComponents.day = 27
iPadStevenoteComponents.hour = 10
iPadStevenoteComponents.minute = 0
iPadStevenoteComponents.timeZone = TimeZone(identifier: "America/Los_Angeles")
let iPadStevenoteDate = gregorianCalendar.date(from: iPadStevenoteComponents)!
print("\nOnce again, the iPad Stevenote took place on \(iPadStevenoteDate.description(with: userLocale)).")


// Date with specific criteria
let tenThousandHoursComponents = DateComponents(
    year: 2023,
    hour: 10000
)
let tenThousandHoursInto2023Date = gregorianCalendar.date(from: tenThousandHoursComponents)!
print("\n10,000 hours into 2023, the date and time will be \(tenThousandHoursInto2023Date.description(with: userLocale)).")
print("In UTC, that’s \(tenThousandHoursInto2023Date.description).")

let day234Components = DateComponents(
    year: 2023,
    day: 243
)
let day234Date = gregorianCalendar.date(from: day234Components)!
print("\nThe 234th day of 2023 will be \(day234Date.description(with: userLocale)).")

let firstFriday2024Components = DateComponents(
    year: 2024,        // We want a date in 2024
    weekday: 6,        // It’s a Friday
    weekdayOrdinal: 1  // The first one
)
let firstFriday2024Date = gregorianCalendar.date(from: firstFriday2024Components)!
print("\nThe first Friday of 2024 will be \(firstFriday2024Date.description(with: userLocale)).")

let firstDonutDay2023Components = DateComponents(
    year: 2023,        // We want a date in 2023
    month: 6,          // in June
    weekday: 6,        // It’s a Friday
    weekdayOrdinal: 1  // The first one
)
let firstDonutDay2023Date = gregorianCalendar.date(from: firstDonutDay2023Components)!
print("\nThe first National Donut Day of 2023 will be \(firstDonutDay2023Date.description(with: userLocale)).")

let thursday33rdWeek2023Components = DateComponents(
    year: 2023,     // We want a date in 2023
    weekday: 5,     // It’s a Thursday
    weekOfYear: 33  // on the 33rd week of the year
)
let thursday33rdWeek2023Date = gregorianCalendar.date(from: thursday33rdWeek2023Components)!
print("\nThe Thursday of the 33rd week of 2023 will be \(thursday33rdWeek2023Date.description(with: userLocale)).")

var sept50DateComponents = DateComponents(
  year: 2023,
  month: 9,
  day: 50
)

let sept50Date = gregorianCalendar.date(from: sept50DateComponents)!
print("\nSeptember 50, 2023 is actually \(sept50Date.description(with: userLocale)).")


// MARK: - Extracting Date Components
var iPhoneStevenoteDateComponents = gregorianCalendar.dateComponents(
    [
        .calendar,
        .day,
        .era,
        .hour,
        .minute,
        .month,
        .nanosecond,
        .quarter,
        .second,
        .timeZone,
        .weekday,
        .weekdayOrdinal,
        .weekOfMonth,
        .weekOfYear,
        .year,
        .yearForWeekOfYear
    ],
    from: iPhoneStevenoteDate
)

print("\nCalendar: \(iPhoneStevenoteDateComponents.calendar!.identifier)")
print("Day: \(iPhoneStevenoteDateComponents.day!)")
print("Era: \(iPhoneStevenoteDateComponents.era!)")
print("Hour: \(iPhoneStevenoteDateComponents.hour!)")
print("Minute: \(iPhoneStevenoteDateComponents.minute!)")
print("Month: \(iPhoneStevenoteDateComponents.month!)")
print("Nanosecond: \(iPhoneStevenoteDateComponents.nanosecond!)")
print("Quarter: \(iPhoneStevenoteDateComponents.quarter!)")
print("Second: \(iPhoneStevenoteDateComponents.second!)")
print("Time zone: \(iPhoneStevenoteDateComponents.timeZone!)")
print("Weekday: \(iPhoneStevenoteDateComponents.weekday!)")
print("Weekday ordinal: \(iPhoneStevenoteDateComponents.weekdayOrdinal!)")
print("Week of month: \(iPhoneStevenoteDateComponents.weekOfMonth!)")
print("Week of year: \(iPhoneStevenoteDateComponents.weekOfYear!)")
print("Year: \(iPhoneStevenoteDateComponents.year!)")
print("Year for week of year: \(iPhoneStevenoteDateComponents.yearForWeekOfYear!)")

var pacificCalendar = Calendar(identifier: .gregorian)
pacificCalendar.timeZone = TimeZone(identifier: "America/Los_Angeles")!
pacificCalendar.locale = Locale.autoupdatingCurrent
iPhoneStevenoteDateComponents = pacificCalendar.dateComponents(
    [
        .calendar,
        .day,
        .era,
        .hour,
        .minute,
        .month,
        .nanosecond,
        .quarter,
        .second,
        .timeZone,
        .weekday,
        .weekdayOrdinal,
        .weekOfMonth,
        .weekOfYear,
        .year,
        .yearForWeekOfYear
    ],
    from: iPhoneStevenoteDate
)

print("\nCalendar: \(iPhoneStevenoteDateComponents.calendar!.identifier)")
print("Day: \(iPhoneStevenoteDateComponents.day!)")
print("Era: \(iPhoneStevenoteDateComponents.era!)")
print("Hour: \(iPhoneStevenoteDateComponents.hour!)")
print("Minute: \(iPhoneStevenoteDateComponents.minute!)")
print("Month: \(iPhoneStevenoteDateComponents.month!)")
print("Nanosecond: \(iPhoneStevenoteDateComponents.nanosecond!)")
print("Quarter: \(iPhoneStevenoteDateComponents.quarter!)")
print("Second: \(iPhoneStevenoteDateComponents.second!)")
print("Time zone: \(iPhoneStevenoteDateComponents.timeZone!)")
print("Weekday: \(iPhoneStevenoteDateComponents.weekday!)")
print("Weekday ordinal: \(iPhoneStevenoteDateComponents.weekdayOrdinal!)")
print("Week of month: \(iPhoneStevenoteDateComponents.weekOfMonth!)")
print("Week of year: \(iPhoneStevenoteDateComponents.weekOfYear!)")
print("Year: \(iPhoneStevenoteDateComponents.year!)")
print("Year for week of year: \(iPhoneStevenoteDateComponents.yearForWeekOfYear!)")

let aprilFoolsDay2023Components = DateComponents(
    year: 2023,
    month: 4,
    day: 1
)
let aprilFoolsDay2023Date = gregorianCalendar.date(from: aprilFoolsDay2023Components)!

// Extract the weekday and week of the year from the date
let wantedComponents = gregorianCalendar.dateComponents(
    [
        .weekday,
        .weekOfYear,
    ],
    from: aprilFoolsDay2023Date
)
let aprilFools2023Weekday = wantedComponents.weekday!
let aprilFools2023WeekdayName = gregorianCalendar.weekdaySymbols[aprilFools2023Weekday - 1]
let aprilFools2023WeekOfYear = wantedComponents.weekOfYear!
print("\nApril Fools’ Day 2023 happens on day \(aprilFools2023Weekday) of the week (\(aprilFools2023WeekdayName)),")
print("and is on week \(aprilFools2023WeekOfYear) of 2023.")

// Challenge date
let challengeDateComponents = DateComponents(
    calendar: gregorianCalendar,
    timeZone: TimeZone(identifier: "America/Los_Angeles")!,
    year: 2023,
    month: 7,
    hour: 15,
    minute: 30,
    weekday: 4,
    weekdayOrdinal: 3
)
let challengeDate = gregorianCalendar.date(from: challengeDateComponents)!
print("\nThe challenge date in the Gregorian calendar is \(challengeDate.description(with: userLocale)).")

var melbourneCalendar = Calendar(identifier: .gregorian)
melbourneCalendar.timeZone = TimeZone(identifier: "Australia/Melbourne")!
let melbourneDateComponents = melbourneCalendar.dateComponents(
  [
    .year,
    .month,
    .day,
    .weekday,
    .hour,
    .minute
  ],
  from: challengeDate)
print("melbourneDateComponents: \(melbourneDateComponents)")

// Create the Coptic calendar and set its locale to Arabic(Egypt)
// so that it uses Arabic month names,
// and its time zone to Melbourne.
var copticCalendar = Calendar(identifier: .coptic)
copticCalendar.locale = Locale(identifier: "ar_EG")
copticCalendar.timeZone = TimeZone(identifier: "Australia/Melbourne")!

// Extract the date components from the date using the Coptic calendar
let challengeCopticComponents = copticCalendar.dateComponents(
  [
    .year,
    .month,
    .day,
    .weekday,
    .hour,
    .minute
  ],
  from: challengeDate)
let challengeYear = challengeCopticComponents.year!
let challengeMonth = challengeCopticComponents.month!
let challengeMonthName = copticCalendar.monthSymbols[challengeMonth - 1]
let challengeDay = challengeCopticComponents.day!
let challengeWeekday = challengeCopticComponents.weekday!
let challengeWeekdayName = copticCalendar.weekdaySymbols[challengeWeekday - 1]
let challengeHour = challengeCopticComponents.hour!
let challengeMinute = challengeCopticComponents.minute!
print("The challenge date in the Coptic calendar happens on")
print("year \(challengeYear)")
print("month \(challengeMonth) (\(challengeMonthName))")
print("day \(challengeDay)")
print("weekday \(challengeWeekday) (\(challengeWeekdayName))")
print("hour \(challengeHour)")
print("minute \(challengeMinute) (Melbourne time).")

// MARK: - Date Extensions

//extension Date {
// var millisecondsSince1970:Int64 {
//        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
//    }
//
//    init(milliseconds:Int) {
//        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
//    }
//}
//
//Date().millisecondsSince1970
//Date(milliseconds: 0)
