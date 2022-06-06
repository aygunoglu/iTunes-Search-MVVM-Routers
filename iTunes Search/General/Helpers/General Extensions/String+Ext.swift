//
//  String+Ext.swift
//  iTunes Search
//
//  Created by Hasan Aygünoglu on 5.06.2022.
//

import Foundation

extension String {
  func getReadableDateFromISO8601(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    guard let iso8601Date = ISO8601DateFormatter().date(from: self) else { return "-----" }
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateStyle = dateStyle
    dateFormatter.timeStyle = timeStyle
    
    let convertedDateString = dateFormatter.string(from: iso8601Date)
    return convertedDateString
  }
}
